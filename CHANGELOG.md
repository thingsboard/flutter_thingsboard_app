# Changelog

## 2.0.0 (unreleased)

ThingsBoard CE and PE are now one product, and this is its single mobile app. It continues the ThingsBoard PE app (all of its history is kept) and ships under the CE store identity.

### Breaking

- The app id is `org.thingsboard.app` on Android and iOS (it was `org.thingsboard.pe.app` for the PE app), and the app is named **ThingsBoard App**.
- Requires ThingsBoard 4.4.0 or later. The version is checked on every sign-in (password, two-factor, QR code, OAuth) and at start-up; an older server shows a "Server update required" page with its version and keeps no session.
- Updating from 1.x signs the user out once and asks for the region or server again: the app data moved to the platform secure storage.

### Changed

- Uses `thingsboard_client` 5.0, the single generated Dart client for ThingsBoard, instead of `thingsboard_pe_client`. Built with Flutter 3.47.9 (`.fvmrc`).
- Push notifications register with the Firebase Installation ID.
- The language from the user profile also applies to system widgets (date pickers, dialog buttons) and dates; the profile saves it in the ThingsBoard format (`de_DE`). Arabic (`ar_AE`) and Norwegian devices (`nb`) get their translation, country names follow the app language.
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
- Dashboard export (CSV, XLS, XLSX) saves the file again on ThingsBoard 4.2.1 and later.
- App links (email verification, QR code login) open once instead of twice.
- Sign-up and email verification go back to the login page instead of stacking new ones.
- Server errors right after start-up or a QR server switch are shown instead of being hidden for two seconds.
- Two-factor authentication: when sending the code fails, it can be requested again at once.
- The ThingsBoard EU logo shows for the Europe region.

See the [1.x releases](https://github.com/thingsboard/flutter_thingsboard_pe_app/releases) of the PE app for earlier changes.
