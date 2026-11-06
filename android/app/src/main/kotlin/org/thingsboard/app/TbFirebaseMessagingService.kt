package org.thingsboard.app

import android.app.ActivityManager
import android.app.KeyguardManager
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import com.google.firebase.messaging.RemoteMessage
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingService
import org.json.JSONObject

/**
 * Keeps a background push as reliable as the FCM SDK's own tray notification
 * while letting Dart add the icon from the notification template (PROD-7932).
 *
 * For a message with a notification payload that arrives while the app is
 * not in the foreground, a plain notification is posted here at once, then
 * the payload is stripped so the base FirebaseMessagingService.handleIntent()
 * does not post a second one. The Dart background handler re-posts the same
 * notification (same tag, id and channel, see PushNotificationDisplay) with
 * the icon, which replaces it in place without a new alert. If the Dart
 * isolate never runs (a stale callback handle right after an app update, the
 * process killed while the engine starts), the plain notification stays:
 * exactly what the SDK showed before this change.
 *
 * Delivery to Dart is unaffected: FlutterFirebaseMessagingReceiver gets its
 * own copy of the broadcast and forwards the complete message to
 * onMessage/onBackgroundMessage in every app state.
 *
 * The tap intent follows the flutter_local_notifications contract (action
 * SELECT_NOTIFICATION, extras notificationId and payload), so a tap on the
 * plain notification reaches the same Dart handler as a tap on the upgraded
 * one. Check it against FlutterLocalNotificationsPlugin when that plugin is
 * upgraded.
 */
class TbFirebaseMessagingService : FlutterFirebaseMessagingService() {

    override fun handleIntent(intent: Intent) {
        if (intent.action == ACTION_MESSAGE_RECEIVE) {
            val message = RemoteMessage(intent.extras ?: Bundle())
            if (message.notification != null) {
                if (!isApplicationForeground(this)) {
                    postPlainNotification(message)
                }
                stripNotificationPayload(intent)
            }
        }
        super.handleIntent(intent)
    }

    private fun postPlainNotification(message: RemoteMessage) {
        val notification = message.notification ?: return
        val messageId = message.messageId ?: return
        if (!NotificationManagerCompat.from(this).areNotificationsEnabled()) {
            Log.w(TAG, "Notifications are disabled, not posting $messageId")
            return
        }
        ensureChannel()
        val id = notificationId(messageId)
        // Dart gives up waiting for this one after a second; posting after it
        // would replace the icon version.
        if (isPosted(messageId, id)) {
            Log.i(TAG, "Dart already posted $messageId, skipping the plain one")
            return
        }
        val built = NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_launcher_foreground)
            .setColor(BRAND_COLOR)
            .setContentTitle(notification.title)
            .setContentText(notification.body)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setShowWhen(false)
            .setAutoCancel(true)
            .setContentIntent(tapIntent(id, JSONObject(message.data as Map<*, *>).toString()))
            .build()
        try {
            NotificationManagerCompat.from(this).notify(messageId, id, built)
            Log.i(TAG, "Posted plain notification $messageId; Dart adds the icon")
        } catch (e: SecurityException) {
            Log.w(TAG, "Could not post notification $messageId", e)
        }
    }

    private fun isPosted(tag: String, id: Int): Boolean =
        getSystemService(NotificationManager::class.java)
            .activeNotifications
            .any { it.tag == tag && it.id == id }

    private fun tapIntent(id: Int, payload: String): PendingIntent? {
        val intent = packageManager.getLaunchIntentForPackage(packageName) ?: return null
        intent.action = ACTION_SELECT_NOTIFICATION
        intent.putExtra(EXTRA_NOTIFICATION_ID, id)
        intent.putExtra(EXTRA_PAYLOAD, payload)
        return PendingIntent.getActivity(
            this,
            id,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    // Same id, name and importance as the Dart side, so whichever of the two
    // creates the channel first, the other finds it.
    private fun ensureChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val manager = getSystemService(NotificationManager::class.java)
        if (manager.getNotificationChannel(CHANNEL_ID) != null) return
        manager.createNotificationChannel(
            NotificationChannel(CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_MAX).apply {
                description = CHANNEL_DESCRIPTION
            },
        )
    }

    // Mirrors FlutterFirebaseMessagingUtils.isApplicationForeground (package
    // private in the plugin), so this decision matches the plugin's choice
    // between onMessage and the background handler.
    private fun isApplicationForeground(context: Context): Boolean {
        val keyguard = context.getSystemService(Context.KEYGUARD_SERVICE) as? KeyguardManager
        if (keyguard?.isKeyguardLocked == true) return false
        val activityManager =
            context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager ?: return false
        val processes = activityManager.runningAppProcesses ?: return false
        return processes.any {
            it.importance == ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND &&
                it.processName == context.packageName
        }
    }

    private fun stripNotificationPayload(intent: Intent) {
        val keys = intent.extras?.keySet() ?: return
        keys
            .filter {
                it.startsWith(NOTIFICATION_KEY_PREFIX) ||
                    it.startsWith(NOTIFICATION_KEY_PREFIX_OLD)
            }
            .forEach { intent.removeExtra(it) }
    }

    private companion object {
        const val TAG = "TbPush"
        const val ACTION_MESSAGE_RECEIVE = "com.google.android.c2dm.intent.RECEIVE"
        const val NOTIFICATION_KEY_PREFIX = "gcm.n."
        const val NOTIFICATION_KEY_PREFIX_OLD = "gcm.notification."

        const val ACTION_SELECT_NOTIFICATION = "SELECT_NOTIFICATION"
        const val EXTRA_NOTIFICATION_ID = "notificationId"
        const val EXTRA_PAYLOAD = "payload"

        // Mirror PushNotificationDisplay._androidDetails and AppColors.primaryBlue;
        // push_notification_display_test.dart compares them.
        const val CHANNEL_ID = "general"
        const val CHANNEL_NAME = "General notifications"
        const val CHANNEL_DESCRIPTION = "This channel is used for general notifications"
        const val BRAND_COLOR = 0xFF305680.toInt()

        /** Java's String.hashCode, which PushNotificationDisplay reproduces in Dart. */
        fun notificationId(messageId: String): Int = messageId.hashCode()
    }
}
