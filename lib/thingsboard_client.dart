/// Since the CE and PE versions are mergeable, we frequently encounter merge
/// conflicts due to the different names of the Dart client.
/// The purpose of this file is to resolve these conflicts.
///
/// By exporting the TB Client here, we ensure a consistent name for the client
/// throughout the project. This file will change rarely,
/// thus minimizing merge conflicts.
library;

// Hide generated built_value types that conflict with handwritten counterparts.
export 'package:thingsboard_ce_client/thingsboard_ce_client.dart'
    hide Authority, LoginRequest, LoginResponse, RefreshTokenRequest,
         // Hide handwritten alarm query objects; app-local replacements live in
         // lib/modules/alarm/domain/pagination/alarm_query_keys.dart.
         AlarmQueryV2, AlarmCommentsQuery, UsersAssignQuery,
         // Hide client-side Font models that shadow Flutter's built-in types.
         FontWeight, FontStyle, Font,
         // Hide TB NotificationSettings which shadows firebase_messaging's class.
         NotificationSettings;

// Use the handwritten auth models (plain Dart enum + positional-ish LoginRequest).
export 'package:thingsboard_ce_client/src/model/authority_enum.dart'
    show Authority, authorityFromString;
export 'package:thingsboard_ce_client/src/model/login_models.dart'
    show LoginRequest, LoginResponse, RefreshTokenRequest;
