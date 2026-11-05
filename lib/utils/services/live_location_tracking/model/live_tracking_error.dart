import 'dart:async';

import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/utils/utils.dart';

/// Why the session is degraded, as a cause the UI layer can localize.
/// Raw exception text (stack traces, URLs, Angular/Dio wording) must never
/// reach the session screen — details go to the logger only.
enum LiveTrackingError {
  targetNotFound,
  noConnection,
  unauthorized,
  savePermissionDenied,
  saveFailed,
  locationServicesDisabled,
  locationPermissionDenied,
  locationPermissionDeniedForever,
  locationError;

  /// Whether the cause comes from saving to the server rather than from the
  /// GPS stream. A fix proves only that location works again, so it may clear
  /// a location cause but must leave a save cause standing.
  bool get isSaveError => switch (this) {
    targetNotFound ||
    noConnection ||
    unauthorized ||
    savePermissionDenied ||
    saveFailed => true,
    locationServicesDisabled ||
    locationPermissionDenied ||
    locationPermissionDeniedForever ||
    locationError => false,
  };

  /// Classifies a failed save. A deleted target arrives with an empty server
  /// message (`[404: ]`), so causes are derived from status/error code —
  /// server text is never passed through.
  static LiveTrackingError fromSaveException(Object e) {
    // A save that got no answer within its deadline carries no status or
    // error code to classify, and "you are offline" is the actionable read.
    if (e is TimeoutException) {
      return noConnection;
    }
    final error = toThingsboardError(e);
    if (Utils.isConnectionError(error)) {
      return noConnection;
    }
    // The interceptor reports a missing token as a bare 'Unauthorized!'
    // message with no status or error code.
    if (error.status == 401 ||
        error.message == 'Unauthorized!' ||
        error.errorCode == ThingsBoardErrorCode.authentication ||
        error.errorCode == ThingsBoardErrorCode.jwtTokenExpired) {
      return unauthorized;
    }
    if (error.status == 404 ||
        error.errorCode == ThingsBoardErrorCode.itemNotFound) {
      return targetNotFound;
    }
    // A group permission may deny telemetry/attribute writes on the target:
    // unlike a transient save failure, retrying cannot help until access is
    // granted, so it is surfaced as its own cause.
    if (error.status == 403 ||
        error.errorCode == ThingsBoardErrorCode.permissionDenied) {
      return savePermissionDenied;
    }
    return saveFailed;
  }
}
