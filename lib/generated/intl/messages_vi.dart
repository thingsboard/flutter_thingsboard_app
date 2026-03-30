// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(appTitle) =>
      "Chúc mừng!\nTài khoản ${appTitle} của bạn đã được kích hoạt.\nBây giờ bạn có thể đăng nhập vào không gian ${appTitle} của mình.";

  static String m1(authority) =>
      "Bạn có chắc chắn? Bạn sẽ xóa tài khoản ${authority} của mình.";

  static String m2(count) =>
      "${Intl.plural(count, one: 'Cảnh báo', other: 'Cảnh báo')}";

  static String m3(providerName) =>
      "Bạn có chắc chắn muốn hủy kích hoạt ${providerName}?";

  static String m4(deviceName) =>
      "Không thể thiết lập phiên với thiết bị ${deviceName}. Vui lòng thử lại";

  static String m5(link) => "Không thể mở url: ${link}";

  static String m6(wifiName) => "Kết nối với Wi-Fi tương tự ${wifiName}";

  static String m7(name) =>
      "Kết nối với mạng Wi-Fi ${name} thất bại.\nVui lòng đảm bảo rằng điện thoại của bạn đã được kết nối với mạng Wi-Fi của thiết bị và quyền truy cập Mạng cục bộ đã được bật cho ứng dụng này trong cài đặt thiết bị của bạn.";

  static String m8(count) =>
      "${Intl.plural(count, one: 'Bảng điều khiển', other: 'Bảng điều khiển')}";

  static String m9(count) =>
      "${Intl.plural(count, one: 'Thiết bị', other: 'Thiết bị')}";

  static String m10(count) => "Mã ${count} chữ số";

  static String m11(contact) =>
      "Mã bảo mật đã được gửi đến địa chỉ email của bạn tại ${contact}.";

  static String m12(e) => "Đã xảy ra lỗi: ${e}";

  static String m25(error) => "Lỗi khi gửi mã: ${error}";

  static String m13(count) =>
      "${Intl.plural(count, one: 'Thông báo', other: 'Thông báo')}";

  static String m14(permissions) =>
      "Bạn không có đủ quyền cho \"${permissions}\" để tiếp tục. Vui lòng mở cài đặt ứng dụng, cấp quyền và nhấn \"Thử lại\".";

  static String m15(permissions) =>
      "Bạn không có đủ quyền cho \"${permissions}\" để tiếp tục. Vui lòng cấp các quyền cần thiết và nhấn \"Thử lại\".";

  static String m16(deviceName) =>
      "Nhập mã PIN của ${deviceName} để xác nhận bằng chứng sở hữu";

  static String m17(time) =>
      "Gửi lại mã sau ${Intl.plural(time, one: '1 giây', other: '${time} giây')}";

  static String m18(name) => "Lộ trình chưa được xác định: ${name}";

  static String m19(count) =>
      "${Intl.plural(count, one: 'Tìm kiếm người dùng', other: 'Tìm kiếm người dùng')}";

  static String m20(contact) =>
      "Mã bảo mật đã được gửi đến điện thoại của bạn tại ${contact}.";

  static String m21(name) =>
      "Không thể kết nối với Wi-Fi vì thiết bị ${name} không tìm thấy mạng";

  static String m22(version) => "Cập nhật lên ${version}";

  static String m23(deviceName) =>
      "Để tiếp tục thiết lập thiết bị ${deviceName} của bạn, vui lòng cung cấp thông tin đăng nhập Mạng của bạn.";

  static String m24(network) => "Nhập mật khẩu cho ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Chấp nhận"),
        "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
          "Bạn phải chấp nhận Chính sách quyền riêng tư của chúng tôi",
        ),
        "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
          "Bạn phải chấp nhận Điều khoản sử dụng của chúng tôi",
        ),
        "accountActivated": MessageLookupByLibrary.simpleMessage(
          "Tài khoản đã được kích hoạt thành công!",
        ),
        "accountActivatedText": m0,
        "accountDeletionDialogBody": m1,
        "acknowledge": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "acknowledged": MessageLookupByLibrary.simpleMessage("Đã xác nhận"),
        "actionData": MessageLookupByLibrary.simpleMessage("Dữ liệu hành động"),
        "actionStatusFailure": MessageLookupByLibrary.simpleMessage("Thất bại"),
        "actionStatusSuccess": MessageLookupByLibrary.simpleMessage(
          "Thành công",
        ),
        "actionTypeActivated": MessageLookupByLibrary.simpleMessage(
          "Đã kích hoạt",
        ),
        "actionTypeAdded": MessageLookupByLibrary.simpleMessage("Đã thêm"),
        "actionTypeAddedComment": MessageLookupByLibrary.simpleMessage(
          "Đã thêm Bình luận",
        ),
        "actionTypeAlarmAck": MessageLookupByLibrary.simpleMessage(
          "Đã xác nhận",
        ),
        "actionTypeAlarmAssigned": MessageLookupByLibrary.simpleMessage(
          "Cảnh báo đã được gán",
        ),
        "actionTypeAlarmClear": MessageLookupByLibrary.simpleMessage("Đã xóa"),
        "actionTypeAlarmDelete": MessageLookupByLibrary.simpleMessage(
          "Cảnh báo đã bị xóa",
        ),
        "actionTypeAlarmUnassigned": MessageLookupByLibrary.simpleMessage(
          "Cảnh báo đã bị hủy gán",
        ),
        "actionTypeAssignedFromTenant": MessageLookupByLibrary.simpleMessage(
          "Được gán từ Người thuê",
        ),
        "actionTypeAssignedToCustomer": MessageLookupByLibrary.simpleMessage(
          "Đã gán cho Khách hàng",
        ),
        "actionTypeAssignedToEdge": MessageLookupByLibrary.simpleMessage(
          "Đã gán cho Edge",
        ),
        "actionTypeAssignedToTenant": MessageLookupByLibrary.simpleMessage(
          "Được gán cho Người thuê",
        ),
        "actionTypeAttributesDeleted": MessageLookupByLibrary.simpleMessage(
          "Thuộc tính đã bị xóa",
        ),
        "actionTypeAttributesRead": MessageLookupByLibrary.simpleMessage(
          "Đã đọc thuộc tính",
        ),
        "actionTypeAttributesUpdated": MessageLookupByLibrary.simpleMessage(
          "Thuộc tính đã được cập nhật",
        ),
        "actionTypeCredentialsRead": MessageLookupByLibrary.simpleMessage(
          "Đã đọc thông tin đăng nhập",
        ),
        "actionTypeCredentialsUpdated": MessageLookupByLibrary.simpleMessage(
          "Thông tin đăng nhập đã được cập nhật",
        ),
        "actionTypeDeleted": MessageLookupByLibrary.simpleMessage("Đã xóa"),
        "actionTypeDeletedComment": MessageLookupByLibrary.simpleMessage(
          "Bình luận đã bị xóa",
        ),
        "actionTypeLockout": MessageLookupByLibrary.simpleMessage("Khóa"),
        "actionTypeLogin": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "actionTypeLogout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "actionTypeProvisionFailure": MessageLookupByLibrary.simpleMessage(
          "Cung cấp thiết bị thất bại",
        ),
        "actionTypeProvisionSuccess": MessageLookupByLibrary.simpleMessage(
          "Thiết bị đã được cung cấp",
        ),
        "actionTypeRelationAddOrUpdate": MessageLookupByLibrary.simpleMessage(
          "Mối quan hệ đã được cập nhật",
        ),
        "actionTypeRelationDeleted": MessageLookupByLibrary.simpleMessage(
          "Mối quan hệ đã bị xóa",
        ),
        "actionTypeRelationsDeleted": MessageLookupByLibrary.simpleMessage(
          "Tất cả mối quan hệ đã bị xóa",
        ),
        "actionTypeRpcCall": MessageLookupByLibrary.simpleMessage("Gọi RPC"),
        "actionTypeSmsSent": MessageLookupByLibrary.simpleMessage(
          "Đã gửi SMS",
        ),
        "actionTypeSuspended": MessageLookupByLibrary.simpleMessage(
          "Đã đình chỉ",
        ),
        "actionTypeTimeseriesDeleted": MessageLookupByLibrary.simpleMessage(
          "Dữ liệu đo từ xa đã bị xóa",
        ),
        "actionTypeTimeseriesUpdated": MessageLookupByLibrary.simpleMessage(
          "Dữ liệu đo từ xa đã được cập nhật",
        ),
        "actionTypeUnassignedFromCustomer":
            MessageLookupByLibrary.simpleMessage(
              "Đã hủy gán khỏi Khách hàng",
            ),
        "actionTypeUnassignedFromEdge": MessageLookupByLibrary.simpleMessage(
          "Đã hủy gán khỏi Edge",
        ),
        "actionTypeUpdated": MessageLookupByLibrary.simpleMessage(
          "Đã cập nhật",
        ),
        "actionTypeUpdatedComment": MessageLookupByLibrary.simpleMessage(
          "Bình luận đã được cập nhật",
        ),
        "activatingAccount": MessageLookupByLibrary.simpleMessage(
          "Đang kích hoạt tài khoản...",
        ),
        "activatingAccountText": MessageLookupByLibrary.simpleMessage(
          "Tài khoản của bạn hiện đang được kích hoạt.\nVui lòng chờ...",
        ),
        "active": MessageLookupByLibrary.simpleMessage("Hoạt động"),
        "activity": MessageLookupByLibrary.simpleMessage("Hoạt động"),
        "addCommentMessage": MessageLookupByLibrary.simpleMessage(
          "Thêm bình luận...",
        ),
        "addVerificationMethod": MessageLookupByLibrary.simpleMessage(
          "Thêm phương thức xác minh",
        ),
        "address": MessageLookupByLibrary.simpleMessage("Địa chỉ"),
        "address2": MessageLookupByLibrary.simpleMessage("Địa chỉ 2"),
        "adminSettings": MessageLookupByLibrary.simpleMessage(
          "Cài đặt quản trị",
        ),
        "aiModel": MessageLookupByLibrary.simpleMessage("Mô hình AI"),
        "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
          "Bạn có chắc chắn muốn xác nhận Cảnh báo này không?",
        ),
        "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
          "Xác nhận cảnh báo",
        ),
        "alarmClearText": MessageLookupByLibrary.simpleMessage(
          "Bạn có chắc chắn muốn xóa Cảnh báo này không?",
        ),
        "alarmClearTitle": MessageLookupByLibrary.simpleMessage(
          "Xóa cảnh báo",
        ),
        "alarmSeverityList": MessageLookupByLibrary.simpleMessage(
          "Danh sách mức độ nghiêm trọng của cảnh báo",
        ),
        "alarmStatusList": MessageLookupByLibrary.simpleMessage(
          "Danh sách trạng thái cảnh báo",
        ),
        "alarmTypeList": MessageLookupByLibrary.simpleMessage(
          "Danh sách loại cảnh báo",
        ),
        "alarmTypes": MessageLookupByLibrary.simpleMessage(
          "Các loại cảnh báo",
        ),
        "alarms": m2,
        "all": MessageLookupByLibrary.simpleMessage("Tất cả"),
        "allDevices": MessageLookupByLibrary.simpleMessage("Tất cả thiết bị"),
        "allowAccess": MessageLookupByLibrary.simpleMessage(
          "Cho phép truy cập",
        ),
        "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
          "Bạn đã có tài khoản?",
        ),
        "anEmptyRequestDataReceived": MessageLookupByLibrary.simpleMessage(
          "Đã nhận được dữ liệu yêu cầu trống.",
        ),
        "anyType": MessageLookupByLibrary.simpleMessage("Bất kỳ loại nào"),
        "apiKey": MessageLookupByLibrary.simpleMessage("Khóa API"),
        "apiUsageState": MessageLookupByLibrary.simpleMessage(
          "Trạng thái sử dụng API",
        ),
        "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
        "applyChanges": MessageLookupByLibrary.simpleMessage(
          "Áp dụng thay đổi",
        ),
        "areYouSure": MessageLookupByLibrary.simpleMessage("Bạn có chắc chắn?"),
        "areYouSureYouWantToDeactivate": m3,
        "areYouSureYouWantToExit": MessageLookupByLibrary.simpleMessage(
          "Bạn có chắc chắn muốn thoát?",
        ),
        "asset": MessageLookupByLibrary.simpleMessage("Tài sản"),
        "assetName": MessageLookupByLibrary.simpleMessage("Tên tài sản"),
        "assetProfile": MessageLookupByLibrary.simpleMessage("Hồ sơ tài sản"),
        "assets": MessageLookupByLibrary.simpleMessage("Tài sản"),
        "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
          "Được gán cho khách hàng",
        ),
        "assignedToMe": MessageLookupByLibrary.simpleMessage(
          "Được gán cho tôi",
        ),
        "assignee": MessageLookupByLibrary.simpleMessage("Người được giao"),
        "auditLogDetails": MessageLookupByLibrary.simpleMessage(
          "Chi tiết nhật ký kiểm toán",
        ),
        "auditLogs": MessageLookupByLibrary.simpleMessage(
          "Nhật ký kiểm toán",
        ),
        "autoUnitSystem": MessageLookupByLibrary.simpleMessage("Tự động"),
        "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập một trong các mã dự phòng của bạn.",
        ),
        "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
          "Mã dự phòng",
        ),
        "backupCodeSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
          "Lần tiếp theo bạn đăng nhập, bạn sẽ có thể sử dụng mã dự phòng để vượt qua xác thực hai yếu tố",
        ),
        "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
          "Để cung cấp thiết bị mới của bạn, vui lòng đảm bảo rằng Bluetooth trên điện thoại của bạn đã được bật và nằm trong phạm vi của thiết bị mới.",
        ),
        "calculatedField": MessageLookupByLibrary.simpleMessage(
          "Trường được tính toán",
        ),
        "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
        "cannotEstablishSession": m4,
        "cantDeleteUserAccount": MessageLookupByLibrary.simpleMessage(
          "Không thể xóa tài khoản người dùng",
        ),
        "cantLaunchUrlLink": m5,
        "changePassword": MessageLookupByLibrary.simpleMessage(
          "Đổi mật khẩu",
        ),
        "chooseRegion": MessageLookupByLibrary.simpleMessage(
          "Chọn khu vực",
        ),
        "city": MessageLookupByLibrary.simpleMessage("Thành phố"),
        "claimingDevice": MessageLookupByLibrary.simpleMessage(
          "Đang xác nhận quyền sở hữu thiết bị",
        ),
        "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
          "Hoàn tất xác nhận quyền sở hữu thiết bị",
        ),
        "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
          "Đã xác nhận quyền sở hữu\nthiết bị thành công",
        ),
        "clear": MessageLookupByLibrary.simpleMessage("Xóa"),
        "cleared": MessageLookupByLibrary.simpleMessage("Đã xóa"),
        "close": MessageLookupByLibrary.simpleMessage("Đóng"),
        "codeVerificationFailed": MessageLookupByLibrary.simpleMessage(
          "Xác minh mã thất bại!",
        ),
        "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
          "Bạn phải xác nhận rằng bạn không phải là rô bốt",
        ),
        "confirmToCloseTheApp": MessageLookupByLibrary.simpleMessage(
          "Xác nhận để đóng ứng dụng",
        ),
        "confirmation": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
          "Đang xác nhận kết nối Wi-Fi",
        ),
        "connectToDevice": MessageLookupByLibrary.simpleMessage(
          "Kết nối với thiết bị",
        ),
        "connectToTheWifiYouUsuallyUse": MessageLookupByLibrary.simpleMessage(
          "Kết nối với Wi-Fi bạn thường sử dụng",
        ),
        "connectToWifiSimilarToWifiname": m6,
        "connectingToDevice": MessageLookupByLibrary.simpleMessage(
          "Đang kết nối với thiết bị",
        ),
        "connectionError": MessageLookupByLibrary.simpleMessage(
          "Lỗi kết nối",
        ),
        "connectionToTheWifiNetworkFailednpleaseEnsureThatYour": m7,
        "continueText": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
          "Đã sao chép vào khay nhớ tạm",
        ),
        "copy": MessageLookupByLibrary.simpleMessage("Sao chép"),
        "copy32digitsKeyToYourAuthenticationAppOrScanQrcode":
            MessageLookupByLibrary.simpleMessage(
              "Sao chép khóa 32 chữ số vào ứng dụng xác thực của bạn hoặc quét mã QR bên dưới",
            ),
        "country": MessageLookupByLibrary.simpleMessage("Quốc gia"),
        "createAccount": MessageLookupByLibrary.simpleMessage(
          "Tạo tài khoản",
        ),
        "createPassword": MessageLookupByLibrary.simpleMessage(
          "Tạo mật khẩu",
        ),
        "critical": MessageLookupByLibrary.simpleMessage("Nghiêm trọng"),
        "currentPassword": MessageLookupByLibrary.simpleMessage(
          "Mật khẩu hiện tại",
        ),
        "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập mật khẩu hiện tại.",
        ),
        "customer": MessageLookupByLibrary.simpleMessage("Khách hàng"),
        "customers": MessageLookupByLibrary.simpleMessage("Khách hàng"),
        "dashboards": m8,
        "days": MessageLookupByLibrary.simpleMessage("ngày"),
        "delete": MessageLookupByLibrary.simpleMessage("Xóa"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage(
          "Xóa tài khoản",
        ),
        "deleteComment": MessageLookupByLibrary.simpleMessage(
          "Xóa bình luận",
        ),
        "details": MessageLookupByLibrary.simpleMessage("Chi tiết"),
        "deviceList": MessageLookupByLibrary.simpleMessage(
          "Danh sách thiết bị",
        ),
        "deviceNotAbleToFindWifiNearby": MessageLookupByLibrary.simpleMessage(
          "Thiết bị không thể tìm thấy Wi-Fi lân cận",
        ),
        "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy thiết bị. Vui lòng đảm bảo rằng Bluetooth trên điện thoại của bạn đã được bật và nằm trong phạm vi của thiết bị mới.",
        ),
        "deviceProfile": MessageLookupByLibrary.simpleMessage(
          "Hồ sơ thiết bị",
        ),
        "deviceProvisioning": MessageLookupByLibrary.simpleMessage(
          "Cung cấp thiết bị",
        ),
        "devices": m9,
        "digitsCode": m10,
        "discardChanges": MessageLookupByLibrary.simpleMessage(
          "Hủy thay đổi",
        ),
        "domain": MessageLookupByLibrary.simpleMessage("Tên miền"),
        "done": MessageLookupByLibrary.simpleMessage("Hoàn tất"),
        "duration": MessageLookupByLibrary.simpleMessage("Thời lượng"),
        "edge": MessageLookupByLibrary.simpleMessage("Edge"),
        "edit": MessageLookupByLibrary.simpleMessage("Chỉnh sửa"),
        "edited": MessageLookupByLibrary.simpleMessage("Đã chỉnh sửa"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAuthDescription": m11,
        "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
          "Mã email",
        ),
        "emailInvalidText": MessageLookupByLibrary.simpleMessage(
          "Định dạng email không hợp lệ.",
        ),
        "emailRequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập email.",
        ),
        "emailSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
          "Lần tiếp theo bạn đăng nhập, bạn sẽ được yêu cầu nhập mã bảo mật được gửi đến địa chỉ email của bạn",
        ),
        "emailVerification": MessageLookupByLibrary.simpleMessage(
          "Xác minh email",
        ),
        "emailVerificationInstructionsText":
            MessageLookupByLibrary.simpleMessage(
              "Vui lòng làm theo hướng dẫn được cung cấp trong email để hoàn tất thủ tục đăng ký. Lưu ý: nếu bạn không thấy email trong một thời gian, vui lòng kiểm tra thư mục 'spam' hoặc thử gửi lại email bằng cách nhấp vào nút 'Gửi lại'.",
            ),
        "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
          "Một email với thông tin xác minh đã được gửi đến địa chỉ email đã cung cấp ",
        ),
        "emailVerified": MessageLookupByLibrary.simpleMessage(
          "Email đã được xác minh",
        ),
        "enter6digitsKeyFromYourAppHere": MessageLookupByLibrary.simpleMessage(
          "Nhập khóa 6 chữ số từ ứng dụng của bạn vào đây:",
        ),
        "enterAPhoneNumberToUseAsYourAuthenticator":
            MessageLookupByLibrary.simpleMessage(
              "Nhập một số điện thoại để sử dụng làm trình xác thực của bạn",
            ),
        "enterAnEmailToUseAsYourAuthenticator":
            MessageLookupByLibrary.simpleMessage(
              "Nhập một email để sử dụng làm trình xác thực của bạn.",
            ),
        "entityType": MessageLookupByLibrary.simpleMessage("Loại thực thể"),
        "entityView": MessageLookupByLibrary.simpleMessage(
          "Chế độ xem thực thể",
        ),
        "errorOccured": m12,
        "errorSendingCode": m25,
        "europe": MessageLookupByLibrary.simpleMessage("Châu Âu"),
        "europeRegionShort": MessageLookupByLibrary.simpleMessage("Frankfurt"),
        "exitDeviceProvisioning": MessageLookupByLibrary.simpleMessage(
          "Thoát cung cấp thiết bị",
        ),
        "failedToConnectToServer": MessageLookupByLibrary.simpleMessage(
          "Không thể kết nối đến máy chủ",
        ),
        "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
          "Không thể tải chi tiết cảnh báo",
        ),
        "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
          "Không thể tải danh sách",
        ),
        "failureDetails": MessageLookupByLibrary.simpleMessage("Chi tiết lỗi"),
        "fatalApplicationErrorOccurred": MessageLookupByLibrary.simpleMessage(
          "Đã xảy ra lỗi ứng dụng nghiêm trọng:",
        ),
        "fatalError": MessageLookupByLibrary.simpleMessage("Lỗi nghiêm trọng"),
        "filters": MessageLookupByLibrary.simpleMessage("Bộ lọc"),
        "firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase":
            MessageLookupByLibrary.simpleMessage(
              "Firebase chưa được cấu hình.\nVui lòng tham khảo tài liệu Firebase chính thức để\n biết hướng dẫn cách thực hiện.",
            ),
        "firstName": MessageLookupByLibrary.simpleMessage("Tên"),
        "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập tên.",
        ),
        "firstNameUpper": MessageLookupByLibrary.simpleMessage("Tên"),
        "goBack": MessageLookupByLibrary.simpleMessage("Quay lại"),
        "hideHomeDashboardToolbar": MessageLookupByLibrary.simpleMessage(
          "Ẩn thanh công cụ bảng điều khiển trang chủ",
        ),
        "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
        "homeDashboard": MessageLookupByLibrary.simpleMessage(
          "Bảng điều khiển trang chủ",
        ),
        "hours": MessageLookupByLibrary.simpleMessage("giờ"),
        "hybridUnitSystem": MessageLookupByLibrary.simpleMessage(
          "Hệ hỗn hợp",
        ),
        "imNotARobot": MessageLookupByLibrary.simpleMessage(
          "Tôi không phải là rô bốt",
        ),
        "imperialUnitSystem": MessageLookupByLibrary.simpleMessage(
          "Hệ đo lường Anh",
        ),
        "inactive": MessageLookupByLibrary.simpleMessage("Không hoạt động"),
        "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
          "Người dùng không hoạt động đã tồn tại",
        ),
        "inactiveUserAlreadyExistsMessage":
            MessageLookupByLibrary.simpleMessage(
              "Đã có người dùng đăng ký với địa chỉ email chưa được xác minh.\nNhấp vào nút 'Gửi lại' nếu bạn muốn gửi lại email xác minh.",
            ),
        "indeterminate": MessageLookupByLibrary.simpleMessage(
          "Không xác định",
        ),
        "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
          "Mật khẩu của bạn phải có ít nhất 6 ký tự",
        ),
        "isRequiredText": MessageLookupByLibrary.simpleMessage("là bắt buộc."),
        "job": MessageLookupByLibrary.simpleMessage("Công việc"),
        "label": MessageLookupByLibrary.simpleMessage("Nhãn"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "lastName": MessageLookupByLibrary.simpleMessage("Họ"),
        "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập họ.",
        ),
        "lastNameUpper": MessageLookupByLibrary.simpleMessage("Họ"),
        "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
          "Danh sách hiện đang trống.",
        ),
        "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "loginToApp": MessageLookupByLibrary.simpleMessage(
          "Đăng nhập vào ứng dụng",
        ),
        "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
          "Đăng nhập vào tài khoản của bạn",
        ),
        "loginWith": MessageLookupByLibrary.simpleMessage("Đăng nhập bằng"),
        "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
          "Logo ThingsBoard",
        ),
        "logout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "major": MessageLookupByLibrary.simpleMessage("Chính"),
        "markAllAsRead": MessageLookupByLibrary.simpleMessage(
          "Đánh dấu tất cả là đã đọc",
        ),
        "markAsRead": MessageLookupByLibrary.simpleMessage(
          "Đánh dấu là đã đọc",
        ),
        "metricUnitSystem": MessageLookupByLibrary.simpleMessage("Hệ mét"),
        "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
          "Mã dự phòng",
        ),
        "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
        "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
          "Ứng dụng xác thực",
        ),
        "minor": MessageLookupByLibrary.simpleMessage("Thứ yếu"),
        "minutes": MessageLookupByLibrary.simpleMessage("phút"),
        "mobileApp": MessageLookupByLibrary.simpleMessage("Ứng dụng di động"),
        "mobileAppBundle": MessageLookupByLibrary.simpleMessage(
          "Gói ứng dụng di động",
        ),
        "mobileDashboardShouldBeConfiguredInDeviceProfile":
            MessageLookupByLibrary.simpleMessage(
              "Bảng điều khiển di động phải được cấu hình trong hồ sơ thiết bị!",
            ),
        "more": MessageLookupByLibrary.simpleMessage("Thêm"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Mật khẩu mới"),
        "newPassword2": MessageLookupByLibrary.simpleMessage(
          "Xác nhận mật khẩu mới",
        ),
        "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập lại mật khẩu mới.",
        ),
        "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập mật khẩu mới.",
        ),
        "newUserText": MessageLookupByLibrary.simpleMessage("Người dùng mới?"),
        "next": MessageLookupByLibrary.simpleMessage("Tiếp theo"),
        "no": MessageLookupByLibrary.simpleMessage("Không"),
        "no2faProvidersFound": MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy nhà cung cấp 2FA nào",
        ),
        "noAlarmsFound": MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy cảnh báo nào",
        ),
        "noDashboardsFound": MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy bảng điều khiển nào",
        ),
        "noNotificationsFound": MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy thông báo nào",
        ),
        "noResultsFound": MessageLookupByLibrary.simpleMessage(
          "Không tìm thấy kết quả",
        ),
        "northAmerica": MessageLookupByLibrary.simpleMessage("Bắc Mỹ"),
        "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
          "Bắc Virginia",
        ),
        "notFound": MessageLookupByLibrary.simpleMessage("Không tìm thấy"),
        "notImplemented": MessageLookupByLibrary.simpleMessage(
          "Chưa được triển khai!",
        ),
        "notificationRequest": MessageLookupByLibrary.simpleMessage(
          "Yêu cầu thông báo",
        ),
        "notificationRule": MessageLookupByLibrary.simpleMessage(
          "Quy tắc thông báo",
        ),
        "notificationTarget": MessageLookupByLibrary.simpleMessage(
          "Mục tiêu thông báo",
        ),
        "notificationTemplate": MessageLookupByLibrary.simpleMessage(
          "Mẫu thông báo",
        ),
        "notifications": m13,
        "oauth2Client": MessageLookupByLibrary.simpleMessage(
          "Máy khách Oauth2",
        ),
        "openAppSettings": MessageLookupByLibrary.simpleMessage(
          "Mở cài đặt ứng dụng",
        ),
        "openAppSettingsToGrantPermissionMessage": m14,
        "openSettingsAndGrantAccessToCameraToContinue":
            MessageLookupByLibrary.simpleMessage(
              "Mở cài đặt và cấp quyền truy cập camera để tiếp tục",
            ),
        "openWifiSettings": MessageLookupByLibrary.simpleMessage(
          "Mở cài đặt Wi-Fi",
        ),
        "or": MessageLookupByLibrary.simpleMessage("HOẶC"),
        "originator": MessageLookupByLibrary.simpleMessage("Nguồn gốc"),
        "otaPackage": MessageLookupByLibrary.simpleMessage("Gói OTA"),
        "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
          "Mật khẩu đã nhập phải giống nhau!",
        ),
        "passwordForgotText": MessageLookupByLibrary.simpleMessage(
          "Quên mật khẩu?",
        ),
        "passwordRequireText": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập mật khẩu.",
        ),
        "passwordReset": MessageLookupByLibrary.simpleMessage(
          "Đặt lại mật khẩu",
        ),
        "passwordResetLinkSuccessfullySentNotification":
            MessageLookupByLibrary.simpleMessage(
              "Đã gửi liên kết đặt lại mật khẩu thành công!",
            ),
        "passwordResetText": MessageLookupByLibrary.simpleMessage(
          "Nhập email được liên kết với tài khoản của bạn và chúng tôi sẽ gửi một email kèm theo liên kết đặt lại mật khẩu",
        ),
        "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
          "Đổi mật khẩu thành công",
        ),
        "permissions": MessageLookupByLibrary.simpleMessage("Quyền"),
        "permissionsNotEnoughMessage": m15,
        "phone": MessageLookupByLibrary.simpleMessage("Điện thoại"),
        "phoneIsInvalid": MessageLookupByLibrary.simpleMessage(
          "Số điện thoại không hợp lệ",
        ),
        "phoneIsRequired": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập số điện thoại",
        ),
        "phoneNumberHelperText": MessageLookupByLibrary.simpleMessage(
          "Số điện thoại theo định dạng E.164, ví dụ: +1201550123",
        ),
        "pleaseContactYourSystemAdministrator":
            MessageLookupByLibrary.simpleMessage(
              "Vui lòng liên hệ với quản trị viên hệ thống của bạn",
            ),
        "pleaseFollowTheNextStepsToConnectYourPhoneTo":
            MessageLookupByLibrary.simpleMessage(
              "Vui lòng làm theo các bước tiếp theo để kết nối điện thoại của bạn với thiết bị",
            ),
        "pleaseFollowTheNextStepsToReconnectnyourPhoneToYour":
            MessageLookupByLibrary.simpleMessage(
              "Vui lòng làm theo các bước tiếp theo để kết nối lại\nđiện thoại của bạn với Wi-Fi thông thường",
            ),
        "pleaseScanQrCodeOnYourDevice": MessageLookupByLibrary.simpleMessage(
          "Vui lòng quét mã QR trên thiết bị của bạn",
        ),
        "plusAlarmType": MessageLookupByLibrary.simpleMessage(
          "+ Loại cảnh báo",
        ),
        "popTitle": m16,
        "postalCode": MessageLookupByLibrary.simpleMessage(
          "Mã Zip / Mã bưu điện",
        ),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage(
          "Chính sách quyền riêng tư",
        ),
        "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
        "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
          "Hồ sơ đã được cập nhật thành công",
        ),
        "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
          "Thiết bị đã được cung cấp thành công",
        ),
        "pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator":
            MessageLookupByLibrary.simpleMessage(
              "Thông báo đẩy chưa được cấu hình.\nVui lòng liên hệ với quản trị viên hệ thống của bạn.",
            ),
        "queue": MessageLookupByLibrary.simpleMessage("Hàng đợi"),
        "queueStats": MessageLookupByLibrary.simpleMessage(
          "Số liệu thống kê hàng đợi",
        ),
        "ready": MessageLookupByLibrary.simpleMessage("Sẵn sàng"),
        "refresh": MessageLookupByLibrary.simpleMessage("Làm mới"),
        "repeatPassword": MessageLookupByLibrary.simpleMessage(
          "Nhập lại mật khẩu của bạn",
        ),
        "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
          "Yêu cầu đặt lại mật khẩu",
        ),
        "requestedEntityDoesNotExists": MessageLookupByLibrary.simpleMessage(
          "Thực thể được yêu cầu không tồn tại.",
        ),
        "resend": MessageLookupByLibrary.simpleMessage("Gửi lại"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Gửi lại mã"),
        "resendCodeWait": m17,
        "reset": MessageLookupByLibrary.simpleMessage("Đặt lại"),
        "retry": MessageLookupByLibrary.simpleMessage("Thử lại"),
        "returnToDashboard": MessageLookupByLibrary.simpleMessage(
          "Quay lại bảng điều khiển",
        ),
        "returnToTheAppAndTapReadyButton": MessageLookupByLibrary.simpleMessage(
          "Quay lại ứng dụng và nhấn nút Sẵn sàng",
        ),
        "routeNotDefined": m18,
        "rpc": MessageLookupByLibrary.simpleMessage("RPC"),
        "ruleChain": MessageLookupByLibrary.simpleMessage("Chuỗi quy tắc"),
        "ruleNode": MessageLookupByLibrary.simpleMessage("Nút quy tắc"),
        "scanACode": MessageLookupByLibrary.simpleMessage("Quét mã"),
        "scanQrCode": MessageLookupByLibrary.simpleMessage("Quét mã QR"),
        "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
        "searchResults": MessageLookupByLibrary.simpleMessage(
          "Kết quả tìm kiếm",
        ),
        "searchUsers": m19,
        "seconds": MessageLookupByLibrary.simpleMessage("giây"),
        "security": MessageLookupByLibrary.simpleMessage("Bảo mật"),
        "selectCountry": MessageLookupByLibrary.simpleMessage(
          "Chọn quốc gia",
        ),
        "selectRegion": MessageLookupByLibrary.simpleMessage("Chọn khu vực"),
        "selectUser": MessageLookupByLibrary.simpleMessage(
          "Chọn người dùng",
        ),
        "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
          "Chọn một cách để xác minh",
        ),
        "selectWifiNetwork": MessageLookupByLibrary.simpleMessage(
          "Chọn mạng Wi-Fi",
        ),
        "sendCode": MessageLookupByLibrary.simpleMessage("Gửi mã"),
        "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
          "Đang gửi thông tin đăng nhập Wi-Fi",
        ),
        "setUpAVerificationMethod": MessageLookupByLibrary.simpleMessage(
          "Thiết lập một phương thức xác minh",
        ),
        "setUpAVerificationMethodToContinueWithYourLogin":
            MessageLookupByLibrary.simpleMessage(
              "Thiết lập một phương thức xác minh để tiếp tục đăng nhập",
            ),
        "severity": MessageLookupByLibrary.simpleMessage(
          "Mức độ nghiêm trọng",
        ),
        "signIn": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "signUp": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "smsAuthDescription": m20,
        "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
          "Mã SMS",
        ),
        "smsSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
          "Lần tiếp theo bạn đăng nhập, bạn sẽ được yêu cầu nhập mã bảo mật được gửi đến số điện thoại",
        ),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
          "Đã xảy ra lỗi",
        ),
        "somethingWentWrongRollback": MessageLookupByLibrary.simpleMessage(
          "Đã xảy ra lỗi ... Hoàn tác",
        ),
        "startTime": MessageLookupByLibrary.simpleMessage("Thời gian bắt đầu"),
        "stateOrProvince": MessageLookupByLibrary.simpleMessage(
          "Tiểu bang / Tỉnh",
        ),
        "status": MessageLookupByLibrary.simpleMessage("Trạng thái"),
        "systemAdministrator": MessageLookupByLibrary.simpleMessage(
          "Quản trị viên hệ thống",
        ),
        "tbResource": MessageLookupByLibrary.simpleMessage("Tài nguyên"),
        "tenant": MessageLookupByLibrary.simpleMessage("Người thuê"),
        "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
          "Quản trị viên thuê bao",
        ),
        "tenantProfile": MessageLookupByLibrary.simpleMessage(
          "Hồ sơ người thuê",
        ),
        "termsOfUse": MessageLookupByLibrary.simpleMessage(
          "Điều khoản sử dụng",
        ),
        "thisActionCannotBeUndone": MessageLookupByLibrary.simpleMessage(
          "Hành động này không thể hoàn tác",
        ),
        "thisWillMakeYourAccountLessSecure":
            MessageLookupByLibrary.simpleMessage(
              "Điều này sẽ làm tài khoản của bạn kém an toàn hơn",
            ),
        "title": MessageLookupByLibrary.simpleMessage("Tiêu đề"),
        "toggleCamera": MessageLookupByLibrary.simpleMessage(
          "Bật/tắt camera",
        ),
        "toggleFlash": MessageLookupByLibrary.simpleMessage(
          "Bật/tắt đèn flash",
        ),
        "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Mã"),
        "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
          "Vui lòng nhập mã bảo mật từ ứng dụng xác thực của bạn.",
        ),
        "totpSetupSuccessDescription": MessageLookupByLibrary.simpleMessage(
          "Lần tiếp theo bạn đăng nhập, bạn sẽ cần cung cấp mã xác thực hai yếu tố",
        ),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Thử lại"),
        "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
          "Thử cách khác",
        ),
        "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
          "Vui lòng thử tinh chỉnh truy vấn của bạn",
        ),
        "tryRefreshing": MessageLookupByLibrary.simpleMessage(
          "Vui lòng thử làm mới",
        ),
        "twofactorAuthentication": MessageLookupByLibrary.simpleMessage(
          "Xác thực hai yếu tố",
        ),
        "twofactorAuthenticationIsRequired":
            MessageLookupByLibrary.simpleMessage(
              "Yêu cầu xác thực hai yếu tố",
            ),
        "twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou":
            MessageLookupByLibrary.simpleMessage(
              "Xác thực hai yếu tố bảo vệ tài khoản của bạn khỏi bị truy cập trái phép. Tất cả những gì bạn phải làm là nhập mã bảo mật khi đăng nhập.",
            ),
        "type": MessageLookupByLibrary.simpleMessage("Loại"),
        "unableConnectToDevice": MessageLookupByLibrary.simpleMessage(
          "Không thể kết nối với thiết bị",
        ),
        "unableConnectToWifiBecauseNetworksWasntFoundByDevice": m21,
        "unableToUseCamera": MessageLookupByLibrary.simpleMessage(
          "Không thể sử dụng camera",
        ),
        "unacknowledged": MessageLookupByLibrary.simpleMessage(
          "Chưa xác nhận",
        ),
        "unassigned": MessageLookupByLibrary.simpleMessage("Chưa được gán"),
        "unitSystem": MessageLookupByLibrary.simpleMessage(
          "Hệ thống đơn vị",
        ),
        "unknownError": MessageLookupByLibrary.simpleMessage(
          "Lỗi không xác định.",
        ),
        "unread": MessageLookupByLibrary.simpleMessage("Chưa đọc"),
        "unsavedChanges": MessageLookupByLibrary.simpleMessage(
          "Thay đổi chưa được lưu",
        ),
        "update": MessageLookupByLibrary.simpleMessage("Cập nhật"),
        "updateRequired": MessageLookupByLibrary.simpleMessage(
          "Yêu cầu cập nhật",
        ),
        "updateTo": m22,
        "url": MessageLookupByLibrary.simpleMessage("Url"),
        "user": MessageLookupByLibrary.simpleMessage("Người dùng"),
        "username": MessageLookupByLibrary.simpleMessage("tên người dùng"),
        "users": MessageLookupByLibrary.simpleMessage("Người dùng"),
        "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
          "Mã xác minh không chính xác",
        ),
        "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
          "Định dạng mã xác minh không hợp lệ",
        ),
        "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
          "Quá nhiều yêu cầu kiểm tra mã xác minh",
        ),
        "verificationRequired": MessageLookupByLibrary.simpleMessage(
          "Yêu cầu xác minh",
        ),
        "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
          "Xác minh danh tính của bạn",
        ),
        "viewAll": MessageLookupByLibrary.simpleMessage("Xem tất cả"),
        "viewDashboard": MessageLookupByLibrary.simpleMessage(
          "Xem Bảng điều khiển",
        ),
        "warning": MessageLookupByLibrary.simpleMessage("Cảnh báo"),
        "widgetType": MessageLookupByLibrary.simpleMessage("Loại widget"),
        "widgetsBundle": MessageLookupByLibrary.simpleMessage("Gói widget"),
        "wifiHelpMessage": m23,
        "wifiPassword": MessageLookupByLibrary.simpleMessage(
          "Mật khẩu Wi-Fi",
        ),
        "wifiPasswordMessage": m24,
        "yes": MessageLookupByLibrary.simpleMessage("Có"),
        "yesDeactivate": MessageLookupByLibrary.simpleMessage(
          "Có, hủy kích hoạt",
        ),
        "yesDiscard": MessageLookupByLibrary.simpleMessage("Có, hủy"),
        "youHaveUnsavedChangesAreYouSureYouWantTo":
            MessageLookupByLibrary.simpleMessage(
              "Bạn có những thay đổi chưa được lưu. Bạn có chắc chắn muốn rời khỏi trang này không?",
            ),
      };
}