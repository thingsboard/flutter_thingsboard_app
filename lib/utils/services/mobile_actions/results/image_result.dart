import 'package:thingsboard_app/utils/services/mobile_actions/mobile_action_result.dart';

class ImageResult extends MobileActionResult {

  ImageResult(this.imageUrl);
  String imageUrl;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['imageUrl'] = imageUrl;
    return json;
  }
}
