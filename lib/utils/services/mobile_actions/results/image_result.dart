import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class ImageResult extends MobileActionResult {
  String imageUrl;

  ImageResult(this.imageUrl);

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json['imageUrl'] = imageUrl;
    return json;
  }
}
