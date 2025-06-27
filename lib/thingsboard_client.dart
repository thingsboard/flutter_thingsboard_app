/// Since the CE and PE versions are mergeable, we frequently encounter merge
/// conflicts due to the different names of the Dart client.
/// The purpose of this file is to resolve these conflicts.
///
/// By exporting the TB Client here, we ensure a consistent name for the client
/// throughout the project. This file will change rarely,
/// thus minimizing merge conflicts.
library;

export 'package:thingsboard_client/thingsboard_client.dart';
