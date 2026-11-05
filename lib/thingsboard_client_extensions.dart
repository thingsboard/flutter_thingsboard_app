import 'package:thingsboard_app/thingsboard_client.dart';

/// Extension that restores the old `hasGenericPermission()` / `hasReadGenericPermission()`
/// helpers on the new built_value [AllowedPermissionsInfo] model.
///
/// The new client stores merged generic permissions in
/// `userPermissions.genericPermissions: BuiltMap<String, BuiltSet<Operation>>`.
/// The key is the resource name string (e.g. `'ALARM'`), mirroring the
/// old `Map<Resource, Set<Operation>>` but JSON-serialised.
///
/// The web UI symbols named below (`hasGenericAllPermission`,
/// `isResourceAllowed`, `hasSharedReadGroupsPermission`) live in ui-ngx
/// `src/app/core/http/user-permissions.service.ts`.
extension AllowedPermissionsInfoExt on AllowedPermissionsInfo {
  bool hasGenericPermission(Resource resource, Operation operation) {
    final genericPerms = userPermissions?.genericPermissions;
    if (genericPerms == null) return false;

    final ops = genericPerms[resource.name];
    if (ops != null &&
        (ops.contains(Operation.ALL) || ops.contains(operation))) {
      return true;
    }
    // The `Resource.ALL` wildcard entry applies only to resources allowed for
    // the user's authority — same as `hasGenericAllPermission` in the web UI.
    if (!_isResourceAllowed(resource)) return false;
    final allOps = genericPerms[Resource.ALL.name];
    return allOps != null &&
        (allOps.contains(Operation.ALL) || allOps.contains(operation));
  }

  bool hasReadGenericPermission(Resource resource) =>
      hasGenericPermission(resource, Operation.READ);

  /// Mirrors `hasSharedReadGroupsPermission` in the web UI: the user has at
  /// least one entity group of [entityType] shared via a group role.
  ///
  /// `hasGenericRead` is intentionally ignored here — it reflects the generic
  /// group-resource permission (e.g. "Customer group"), which only unlocks the
  /// group-browsing UI that exists on the web but not in the mobile app; the
  /// `/api/user/*` list endpoints ignore it too.
  bool hasSharedReadGroupsPermission(EntityType entityType) {
    final info = userPermissions?.readGroupPermissions?[entityType.name];
    return info?.entityGroupIds?.isNotEmpty ?? false;
  }

  /// The user can list entities of [resource]: either through a generic READ
  /// permission or because at least one group of [entityType] is shared with
  /// them via a group role. This is what the `/api/user/*` list endpoints
  /// resolve data by, so it is the right gate for list pages.
  bool hasReadGenericOrSharedGroupsPermission(
    Resource resource,
    EntityType entityType,
  ) =>
      hasReadGenericPermission(resource) ||
      hasSharedReadGroupsPermission(entityType);

  /// A null `allowedResources` means the authority is unrestricted — same as
  /// `isResourceAllowed` in the web UI.
  bool _isResourceAllowed(Resource resource) {
    final allowed = allowedResources;
    return allowed == null || allowed.contains(resource);
  }
}

/// Typed access to the fields the app reads from an [AlarmCommentInfo]'s
/// free-form `comment` payload (a [JsonObject] in the generated model;
/// system-generated activity entries may have none).
extension AlarmCommentInfoExt on AlarmCommentInfo {
  Map<String, Object?>? get _commentJson =>
      comment?.isMap ?? false ? comment!.asMap.cast<String, Object?>() : null;

  String? get commentText => _commentJson?['text'] as String?;

  /// The server sets `edited` only on comments that were edited.
  bool get commentEdited => _commentJson?['edited'] != null;
}
