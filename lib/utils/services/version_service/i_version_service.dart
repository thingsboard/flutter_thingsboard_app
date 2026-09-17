import 'package:thingsboard_app/utils/services/version_service/version_info.dart';

abstract interface class IVersionService {
bool appUpdateRequired(VersionInfo info);
}
