// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_endpoint_args.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SwitchEndpointArgs _$SwitchEndpointArgsFromJson(Map<String, dynamic> json) =>
    _SwitchEndpointArgs(
      secret: json['secret'] as String,
      host: json['host'] as String?,
      ttl: json['ttl'] as String?,
      uri: fromFluroData(json['uri']),
    );

Map<String, dynamic> _$SwitchEndpointArgsToJson(_SwitchEndpointArgs instance) =>
    <String, dynamic>{
      'secret': instance.secret,
      'host': instance.host,
      'ttl': instance.ttl,
      'uri': uriToJson(instance.uri),
    };
