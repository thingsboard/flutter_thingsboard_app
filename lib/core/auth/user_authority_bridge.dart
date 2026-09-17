import 'package:thingsboard_app/thingsboard_client.dart';

/// Bridges the generated built_value [User.authority] enum to the hand-written
/// [Authority] enum the barrel re-exports. The two coexist during the client
/// migration, so equality/switches against the hand-written constants only
/// match when routed through [authorityFromString].
extension UserAuthorityBridge on User {
  Authority get appAuthority => authorityFromString(authority.name);
}
