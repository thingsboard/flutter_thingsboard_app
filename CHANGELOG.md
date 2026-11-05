# Changelog

## 2.0.0 (unreleased)

ThingsBoard CE and PE are now one product, and this is its single mobile app. It continues the ThingsBoard PE app (all of its history is kept) and ships under the CE store identity.

- **Breaking:** the app id is `org.thingsboard.app` on Android and iOS (it was `org.thingsboard.pe.app` for the PE app), and the app is named **ThingsBoard App**.
- **Breaking:** requires ThingsBoard 4.4.0 or later. The client checks the server version on login, two-factor verification and start-up, for every user.
- Moved to `thingsboard_client` 5.0, the single generated Dart client for ThingsBoard, replacing `thingsboard_pe_client`. The app is built with Flutter 3.47.9 (`.fvmrc`).
- Fixed regressions from the move to the generated client in 1.9:
  - Lists sort again (assets, customers, tenants, audit logs, device profiles, dashboards, alarm types, assignees): the sort order was no longer sent.
  - Device claiming reports success again, and its errors show on the claiming screen only.
  - The alarm details "open dashboard" button shows again.
  - Self-registration works with reCAPTCHA v2.
  - Opening a deleted alarm, device, asset, customer or tenant shows "requested entity does not exist" again instead of an endless spinner or an error toast.
  - Customer and tenant details show the entity title in the app bar.
  - Alarm comment and assignment notifications show the alarm severity.
  - Alarm comments stored as plain text show their text.
  - Reset password shows the server's error message once.
- Removed the code of the separate CE and PE editions.

See the [1.x releases](https://github.com/thingsboard/flutter_thingsboard_pe_app/releases) of the PE app for earlier changes.
