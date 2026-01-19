
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_arguments.freezed.dart';
part 'dashboard_arguments.g.dart';

/// This class represents the arguments a user can pass to open a dashboard
@freezed
abstract class DashboardArgumentsEntity with _$DashboardArgumentsEntity {
  const factory DashboardArgumentsEntity({
    required String id,
    String? title,
    String? state,
    bool? hideToolbar,
   @Default(true) bool animate,
  }) = _DashboardArgumentsEntity;
    factory DashboardArgumentsEntity.fromJson(Map<String, dynamic> json) =>
      _$DashboardArgumentsEntityFromJson(json);
}
