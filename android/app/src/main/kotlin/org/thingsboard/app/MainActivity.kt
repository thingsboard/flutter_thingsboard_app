package org.thingsboard.app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        registerTbWebAuth(flutterEngine)
    }

    fun registerTbWebAuth(flutterEngine: FlutterEngine) {
        val channel = MethodChannel(flutterEngine.dartExecutor, "tb_web_auth")
        channel.setMethodCallHandler(TbWebAuthHandler(this))
    }

}
