import 'package:thingsboard_client/thingsboard_client.dart';

abstract interface class IVersionService {
bool appUpdateRequired(VersionInfo info);
}
