// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WifiNetworkImpl _$$WifiNetworkImplFromJson(Map<String, dynamic> json) =>
    _$WifiNetworkImpl(
      ssid: json['ssid'] as String,
      rssi: (json['rssi'] as num).toInt(),
      channel: (json['channel'] as num).toInt(),
      auth: json['auth'] as String,
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$$WifiNetworkImplToJson(_$WifiNetworkImpl instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'rssi': instance.rssi,
      'channel': instance.channel,
      'auth': instance.auth,
      'password': instance.password,
    };
