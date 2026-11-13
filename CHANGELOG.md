# Changelog

## 2.0.0 (unreleased)

ThingsBoard CE and PE are now one product, and this is its open-source mobile app: use it as is, or as the base of your own branded app. It continues the ThingsBoard PE app (all of its history is kept).

### Breaking

- The default app id is `org.thingsboard.app` on Android and iOS (it was `org.thingsboard.pe.app`), and the default name is **ThingsBoard App**. An app that sets its own id (`androidApplicationId`, `iosApplicationId`) keeps it; a build that relied on the old default id gets a new one, which the stores treat as a different app.
- Requires ThingsBoard 4.4.0 or later. The version is checked on every sign-in (password, two-factor, QR code, OAuth) and at start-up; an older server shows a "Server update required" page with its version and keeps no session.
- Updating from 1.x signs the user out once and asks for the region or server again: the app data moved to the platform secure storage.

### Changed

- Uses `thingsboard_client` 5.0, the single generated Dart client for ThingsBoard, instead of `thingsboard_pe_client`. Built with Flutter 3.47.9 (`.fvmrc`).
- Push notifications register with the Firebase Installation ID.
- iOS plugins are integrated through Swift Package Manager (Firebase iOS SDK 13.1.1); building for iOS needs Xcode 26.2 or newer. Only `flutter_esp_ble_prov` and `plugin_wifi_connect` still use CocoaPods.
- The language from the user profile also applies to system widgets (date pickers, dialog buttons) and dates; the profile saves it in the ThingsBoard format (`de_DE`). Arabic (`ar_AE`) and Norwegian devices (`nb`) get their translation, country names follow the app language.
- When the camera permission is permanently denied, the QR scanner offers to open the app settings.
- The profile language can be set to Auto, as in the web UI: the app then follows the device language.
- The Roboto font is bundled instead of being downloaded from Google at run time.
- Smaller app: the arm64 Android APK went from 62.5 MB (1.9.1) to 46.7 MB, about 16 MB less installed on iOS.
- Account deletion (off by default) deletes only the current user, not the whole tenant (from PE 1.9.2).
- Removed the code of the separate CE and PE editions.

### Fixed

- Regressions of the move to the generated client in 1.9:
  - Lists sort again (assets, customers, tenants, audit logs, device profiles, dashboards, alarm types, assignees).
  - Device claiming reports success again; its errors are translated and say "not found" only for an unknown device.
  - The alarm details "open dashboard" button shows again.
  - Self-registration works with reCAPTCHA v2.
  - Opening a deleted alarm, device, asset, customer or tenant shows "requested entity does not exist" instead of an endless spinner or an error toast.
  - Customer and tenant details show the entity title in the app bar.
  - Alarm comment and assignment notifications show the alarm severity; comments stored as plain text show their text.
  - Reset password shows the server's error message once.
- Saving the profile with the Auto unit system no longer stores `AUTO`, which the web UI and dashboards did not recognise.
- Dashboard export (CSV, XLS, XLSX) saves the file again on ThingsBoard 4.2.1 and later.
- App links (email verification, QR code login) open once instead of twice.
- iOS: the email verification link opens the app again in release builds (TestFlight, App Store); the release `Info.plist` did not register the registration redirect scheme.
- Sign-up and email verification go back to the login page instead of stacking new ones.
- A session revoked elsewhere (e.g. a password change) shows one translated "Session has expired" instead of the server's "Token is outdated" and a toast per waiting request.
- Server errors right after start-up or a QR server switch are shown instead of being hidden for two seconds.
- Two-factor authentication: when sending the code fails, it can be requested again at once.
- The ThingsBoard EU logo shows for the Europe region, on the login page too.
- After choosing a region, the login page shows its OAuth clients and sign-up link.
- Signing in shows one steady loader until the home screen instead of a flickering one.
- The login and More pages scroll in landscape instead of cutting off the form and the menu.
- Many sign-in buttons no longer clip their logos on the login page: up to eight narrow to share one row, and more wrap into rows of same-sized buttons.
- A web page opened from More has a back arrow, which leaves the page after the site's last step back.
- Empty lists (entities, alarms, dashboards) show their message in the middle, without the "Try again" button of the error state.
- Granting the camera at the first QR scanner prompt no longer throws.
- The Live tracking header and the Dashboards page opened from the menu look like the other pages (title, back arrow).
- iOS: a dashboard the user cannot open shows the web UI's error instead of loading forever.
- iOS: pages can be closed with the edge swipe back.
- Arabic: phone numbers, emails, passwords and codes read left to right in every form.
- Large text: the role under the user name in More no longer breaks mid-word; the server name moves to the next line.
- Two-factor screens: each method shows a description (authenticator app recommended); the required setup names the account and offers Log Out; TOTP opens the authenticator app directly and shows the key in groups of four; a wrong code says "Verification code is incorrect", clears the field and keeps the focus; the success screen suggests backup codes.
- Two-factor sign-in opens again after going back to the login page and pressing Log In.
- The backup codes page is translated and points to the options below the codes.
- Log Out from the required two-factor setup leaves an empty login form.
- Relative times ("5 minutes ago") in notifications and alarm activity follow the app language.
- Live location tracking is translated into every app language (it was English only).
- Autofill and keyboards: email fields open the email keyboard; change password offers and saves a new password; sign-up suggests a new password instead of a saved one; phone fields take the number from autofill.
- Profile editing shows the saved phone number and its country instead of an empty US number.
- Two-factor setup: SMS opens instead of signing the user out, the settings open for users with backup codes, and a setup error opened from the profile goes back with a message instead of signing out.
- Two-factor setup titles are fully translated (they mixed English and the provider name).
- Arabic: an English server message in a toast keeps its punctuation in place, and the phone hint reads right to left with its example number's + in front; alarm durations use the same digits as the start time.
- Customer, asset, tenant and device details: the page titles follow the app language, a phone number keeps its + in front in Arabic, and the Arabic customer title is no longer labelled like its address.
- Counted texts take the right plural form: alarm durations in every language ("1 day", not "1 days"), and the Arabic dual and 11+ forms in notification and resend-code messages.
- The sign-up form shows "Invalid email format" for a malformed email instead of sending it to the server.
- Saving the profile with an invalid phone number shows why it is not saved instead of doing nothing.
- Back from a device dashboard returns to the device list or search results it was opened from.
- After acknowledging or clearing an alarm in its details, the alarms list shows the new status without a pull to refresh.
- Pulling to refresh the alarm filters shows the selected assignee's new name after the user is renamed.
- Long alarm comments wrap inside the Activity block instead of running past the screen edge; a long author name ends with "…" and keeps the time visible.
- Back no longer walks through every visited tab: it closes the pages opened in a tab, then returns to the first tab, then leaves the app, as before 1.6. `--dart-define=navigationType=push` keeps the tab history.
- The unread notifications count shows when Notifications is under More, and follows the server's count after reading, deleting or refreshing notifications.
- A bottom bar tab that can show the unread badge (Notifications) keeps its icon centred over its label.
- Entity lists that fail to load (offline, server error) show a translated error with Try again, and the device counts stop spinning; the counts are no longer clipped at large font sizes.
- Arabic: the layout is mirrored (status bars, paddings, alignments), audit log JSON reads left to right, and Latin names keep their own direction.

See the [1.x releases](https://github.com/thingsboard/flutter_thingsboard_pe_app/releases) of the PE app for earlier changes.
