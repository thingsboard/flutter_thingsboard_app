// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardArgumentsEntity _$DashboardArgumentsEntityFromJson(
  Map<String, dynamic> json,
) => _DashboardArgumentsEntity(
  id: json['id'] as String,
  title: json['title'] as String?,
  state: json['state'] as String?,
  hideToolbar: json['hideToolbar'] as bool?,
  animate: json['animate'] as bool? ?? true,
);

Map<String, dynamic> _$DashboardArgumentsEntityToJson(
  _DashboardArgumentsEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'state': instance.state,
  'hideToolbar': instance.hideToolbar,
  'animate': instance.animate,
};
