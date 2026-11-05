import 'package:thingsboard_app/thingsboard_client.dart';

/// [TwoFaProviderType.valueOf] throws on an unknown name; this tolerant parser
/// returns null instead so callers can skip unrecognized provider types.
TwoFaProviderType? tryParseTwoFaProviderType(String? name) {
  if (name == null) return null;
  try {
    return TwoFaProviderType.valueOf(name);
  } catch (_) {
    return null;
  }
}
