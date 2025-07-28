import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_endpoint_args.freezed.dart';
part 'switch_endpoint_args.g.dart';

@freezed
abstract class SwitchEndpointArgs with _$SwitchEndpointArgs {
  const factory SwitchEndpointArgs(
      {required String secret,
      String? host,
       String? ttl,
      @JsonKey(fromJson: fromFluroData, toJson: uriToJson)
      required Uri uri}) = _SwitchEndpointArgs;

  factory SwitchEndpointArgs.fromJson(Map<String, dynamic> json) =>
      _$SwitchEndpointArgsFromJson(json);
}
 Uri fromFluroData(dynamic data) {
  if(data is Uri) {
    return data;
  }
return Uri.parse(data.toString());
}
String uriToJson(Uri uri) {
  return uri.toString();
}