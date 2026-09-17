import 'package:thingsboard_app/thingsboard_client.dart';

/// Request extra for calls that must not drive the global UI: no error toast or
/// dialog from the client's error handler, and no global loading indicator.
///
/// Used for best-effort calls made right around a login (mobile app info,
/// notification mobile-session sync, unread counts), which answer 401/403 in
/// perfectly normal situations where a toast reads as a failed login
/// (PROD-8200), and for the 2FA code calls, which report their failure inline.
///
/// Suppressing the UI is all it does. A 401 with `jwtTokenExpired` still makes
/// the client refresh the token and, if that refresh fails, clear the stored
/// session - see `HttpInterceptor.onError` in the client library.
Map<String, dynamic> silentRequestExtra() =>
    InterceptorConfig(ignoreErrors: true, ignoreLoading: true).toExtra();
