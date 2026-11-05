/// The ThingsBoard client for the app: import this file, never
/// `package:thingsboard_client/thingsboard_client.dart` directly
/// (test/client_import_test.dart enforces it).
///
/// It only hides generated models whose names clash with types the app uses
/// everywhere: `FontWeight` and `FontStyle` from `dart:ui` (a package import
/// silently shadows them, so `FontWeight.w500` fails with a confusing error)
/// and firebase_messaging's `NotificationSettings`. Add name clashes only;
/// workarounds for the client belong in the client.
library;

export 'package:thingsboard_client/thingsboard_client.dart'
    hide FontWeight, FontStyle, NotificationSettings;
