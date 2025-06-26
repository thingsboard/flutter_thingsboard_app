
import 'package:image_picker/image_picker.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/actions/take_picture_from_gallery_action.dart';
import 'package:thingsboard_app/utils/services/mobile_actions/widget_mobile_action_type.dart';

class TakePhotoAction extends TakePictureFromGalleryAction {
@override
  ImageSource get imageSource => ImageSource.camera;
  @override
  WidgetMobileActionType get type => WidgetMobileActionType.takePhoto;
}