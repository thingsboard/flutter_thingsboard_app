// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WifiNetwork _$WifiNetworkFromJson(Map<String, dynamic> json) => _WifiNetwork(
  ssid: json['ssid'] as String,
  rssi: (json['rssi'] as num).toInt(),
  channel: (json['channel'] as num).toInt(),
  auth: json['auth'] as String,
  password: json['password'] as String? ?? '',
);

Map<String, dynamic> _$WifiNetworkToJson(_WifiNetwork instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'rssi': instance.rssi,
      'channel': instance.channel,
      'auth': instance.auth,
      'password': instance.password,
    };
