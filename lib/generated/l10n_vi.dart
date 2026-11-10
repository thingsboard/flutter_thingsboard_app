// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class SVi extends S {
  SVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Trang chủ';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Thiết bị',
      one: 'Thiết bị',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Thêm';

  @override
  String get customers => 'Khách hàng';

  @override
  String get assets => 'Tài sản';

  @override
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Nhật ký kiểm toán';

  @override
  String get noCustomersFound => 'No customers found';

  @override
  String get noAssetsFound => 'No assets found';

  @override
  String get noTenantsFound => 'No tenants found';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get noAuditLogsFound => 'No audit logs found';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get login => 'Đăng nhập';

  @override
  String get logoDefaultValue => 'Logo ThingsBoard';

  @override
  String get loginToYourAccount => 'Đăng nhập vào tài khoản của bạn';

  @override
  String get email => 'Email';

  @override
  String get emailRequireText => 'Vui lòng nhập email.';

  @override
  String get emailInvalidText => 'Định dạng email không hợp lệ.';

  @override
  String get username => 'tên người dùng';

  @override
  String get password => 'Mật khẩu';

  @override
  String get passwordRequireText => 'Vui lòng nhập mật khẩu.';

  @override
  String get passwordForgotText => 'Quên mật khẩu?';

  @override
  String get passwordReset => 'Đặt lại mật khẩu';

  @override
  String get passwordResetText =>
      'Nhập email được liên kết với tài khoản của bạn và chúng tôi sẽ gửi một email kèm theo liên kết đặt lại mật khẩu';

  @override
  String get requestPasswordReset => 'Yêu cầu đặt lại mật khẩu';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Đã gửi liên kết đặt lại mật khẩu thành công!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Liên kết xác minh email đã được gửi thành công!';

  @override
  String get or => 'HOẶC';

  @override
  String get no => 'Không';

  @override
  String get yes => 'Có';

  @override
  String get title => 'Tiêu đề';

  @override
  String get country => 'Quốc gia';

  @override
  String get city => 'Thành phố';

  @override
  String get stateOrProvince => 'Tiểu bang / Tỉnh';

  @override
  String get postalCode => 'Mã Zip / Mã bưu điện';

  @override
  String get address => 'Địa chỉ';

  @override
  String get address2 => 'Địa chỉ 2';

  @override
  String get phone => 'Điện thoại';

  @override
  String get alarmClearTitle => 'Xóa cảnh báo';

  @override
  String get alarmClearText => 'Bạn có chắc chắn muốn xóa Cảnh báo này không?';

  @override
  String get alarmAcknowledgeTitle => 'Xác nhận cảnh báo';

  @override
  String get alarmAcknowledgeText =>
      'Bạn có chắc chắn muốn xác nhận Cảnh báo này không?';

  @override
  String get assetName => 'Tên tài sản';

  @override
  String get type => 'Loại';

  @override
  String get label => 'Nhãn';

  @override
  String get assignedToCustomer => 'Được gán cho khách hàng';

  @override
  String get auditLogDetails => 'Chi tiết nhật ký kiểm toán';

  @override
  String get entityType => 'Loại thực thể';

  @override
  String get actionData => 'Dữ liệu hành động';

  @override
  String get failureDetails => 'Chi tiết lỗi';

  @override
  String get allDevices => 'Tất cả thiết bị';

  @override
  String get active => 'Hoạt động';

  @override
  String get inactive => 'Không hoạt động';

  @override
  String get systemAdministrator => 'Quản trị viên hệ thống';

  @override
  String get tenantAdministrator => 'Quản trị viên thuê bao';

  @override
  String get customer => 'Khách hàng';

  @override
  String get changePassword => 'Đổi mật khẩu';

  @override
  String get currentPasswordRequireText => 'Vui lòng nhập mật khẩu hiện tại.';

  @override
  String get currentPassword => 'Mật khẩu hiện tại';

  @override
  String get newPasswordRequireText => 'Vui lòng nhập mật khẩu mới.';

  @override
  String get newPassword => 'Mật khẩu mới';

  @override
  String get newPassword2RequireText => 'Vui lòng nhập lại mật khẩu mới.';

  @override
  String get newPassword2 => 'Xác nhận mật khẩu mới';

  @override
  String get passwordErrorNotification => 'Mật khẩu đã nhập phải giống nhau!';

  @override
  String get firstNameUpper => 'Tên';

  @override
  String get lastNameUpper => 'Họ';

  @override
  String get profileSuccessNotification => 'Hồ sơ đã được cập nhật thành công';

  @override
  String get passwordSuccessNotification => 'Đổi mật khẩu thành công';

  @override
  String get notImplemented => 'Chưa được triển khai!';

  @override
  String get listIsEmptyText => 'Danh sách hiện đang trống.';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get verifyYourIdentity => 'Xác minh danh tính của bạn';

  @override
  String get continueText => 'Tiếp tục';

  @override
  String get resendCode => 'Gửi lại mã';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time giây',
    );
    return 'Gửi lại mã sau $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Vui lòng nhập mã bảo mật từ ứng dụng xác thực của bạn.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Mã bảo mật đã được gửi đến điện thoại của bạn tại $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Mã bảo mật đã được gửi đến địa chỉ email của bạn tại $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Vui lòng nhập một trong các mã dự phòng của bạn.';

  @override
  String get verificationCodeInvalid => 'Định dạng mã xác minh không hợp lệ';

  @override
  String get toptAuthPlaceholder => 'Mã';

  @override
  String get smsAuthPlaceholder => 'Mã SMS';

  @override
  String get emailAuthPlaceholder => 'Mã email';

  @override
  String get backupCodeAuthPlaceholder => 'Mã dự phòng';

  @override
  String get verificationCodeIncorrect => 'Mã xác minh không chính xác';

  @override
  String get verificationCodeManyRequest =>
      'Quá nhiều yêu cầu kiểm tra mã xác minh';

  @override
  String get tryAnotherWay => 'Thử cách khác';

  @override
  String get selectWayToVerify => 'Chọn một cách để xác minh';

  @override
  String get mfaProviderTopt => 'Ứng dụng xác thực';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Mã dự phòng';

  @override
  String get newUserText => 'Người dùng mới?';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get emailVerification => 'Xác minh email';

  @override
  String get emailVerificationSentText =>
      'Một email với thông tin xác minh đã được gửi đến địa chỉ email đã cung cấp ';

  @override
  String get emailVerificationInstructionsText =>
      'Vui lòng làm theo hướng dẫn được cung cấp trong email để hoàn tất thủ tục đăng ký. Lưu ý: nếu bạn không thấy email trong một thời gian, vui lòng kiểm tra thư mục \'spam\' hoặc thử gửi lại email bằng cách nhấp vào nút \'Gửi lại\'.';

  @override
  String get resend => 'Gửi lại';

  @override
  String get activatingAccount => 'Đang kích hoạt tài khoản...';

  @override
  String get accountActivated => 'Tài khoản đã được kích hoạt thành công!';

  @override
  String get emailVerified => 'Email đã được xác minh';

  @override
  String get activatingAccountText =>
      'Tài khoản của bạn hiện đang được kích hoạt.\nVui lòng chờ...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Chúc mừng!\nTài khoản $appTitle của bạn đã được kích hoạt.\nBây giờ bạn có thể đăng nhập vào không gian $appTitle của mình.';
  }

  @override
  String get privacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get cancel => 'Hủy';

  @override
  String get accept => 'Chấp nhận';

  @override
  String get termsOfUse => 'Điều khoản sử dụng';

  @override
  String get firstName => 'Tên';

  @override
  String get firstNameRequireText => 'Vui lòng nhập tên.';

  @override
  String get lastName => 'Họ';

  @override
  String get lastNameRequireText => 'Vui lòng nhập họ.';

  @override
  String get createPassword => 'Tạo mật khẩu';

  @override
  String get repeatPassword => 'Nhập lại mật khẩu của bạn';

  @override
  String get imNotARobot => 'Tôi không phải là rô bốt';

  @override
  String get signUp => 'Đăng ký';

  @override
  String get alreadyHaveAnAccount => 'Bạn đã có tài khoản?';

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get inactiveUserAlreadyExists =>
      'Người dùng không hoạt động đã tồn tại';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Đã có người dùng đăng ký với địa chỉ email chưa được xác minh.\nNhấp vào nút \'Gửi lại\' nếu bạn muốn gửi lại email xác minh.';

  @override
  String get assignee => 'Người được giao';

  @override
  String get alarmTypes => 'Các loại cảnh báo';

  @override
  String get details => 'Chi tiết';

  @override
  String get status => 'Trạng thái';

  @override
  String get severity => 'Mức độ nghiêm trọng';

  @override
  String get originator => 'Nguồn gốc';

  @override
  String get startTime => 'Thời gian bắt đầu';

  @override
  String get duration => 'Thời lượng';

  @override
  String get days => 'ngày';

  @override
  String get hours => 'giờ';

  @override
  String get minutes => 'phút';

  @override
  String get seconds => 'giây';

  @override
  String get viewDashboard => 'Xem Bảng điều khiển';

  @override
  String get activity => 'Hoạt động';

  @override
  String get addCommentMessage => 'Thêm bình luận...';

  @override
  String get selectUser => 'Chọn người dùng';

  @override
  String get assignedToMe => 'Được gán cho tôi';

  @override
  String get clear => 'Xóa';

  @override
  String get acknowledge => 'Xác nhận';

  @override
  String get edit => 'Chỉnh sửa';

  @override
  String get delete => 'Xóa';

  @override
  String get edited => 'Đã chỉnh sửa';

  @override
  String get deleteComment => 'Xóa bình luận';

  @override
  String get areYouSure => 'Bạn có chắc chắn?';

  @override
  String get noResultsFound => 'Không tìm thấy kết quả';

  @override
  String get tryRefiningYourQuery => 'Vui lòng thử tinh chỉnh truy vấn của bạn';

  @override
  String get failedToLoadTheList => 'Không thể tải danh sách';

  @override
  String get tryRefreshing => 'Vui lòng thử làm mới';

  @override
  String get refresh => 'Làm mới';

  @override
  String get users => 'Người dùng';

  @override
  String get unassigned => 'Chưa được gán';

  @override
  String get failedToLoadAlarmDetails => 'Không thể tải chi tiết cảnh báo';

  @override
  String get somethingWentWrong => 'Đã xảy ra lỗi';

  @override
  String get chooseRegion => 'Chọn khu vực';

  @override
  String get selectRegion => 'Chọn khu vực';

  @override
  String get northAmerica => 'Bắc Mỹ';

  @override
  String get europe => 'Châu Âu';

  @override
  String get northAmericaRegionShort => 'Bắc Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Danh sách thiết bị';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bảng điều khiển',
      one: 'Bảng điều khiển',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Yêu cầu cập nhật';

  @override
  String updateTo(Object version) {
    return 'Cập nhật lên $version';
  }

  @override
  String get next => 'Tiếp theo';

  @override
  String get confirmation => 'Xác nhận';

  @override
  String get wifiPassword => 'Mật khẩu Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Để tiếp tục thiết lập thiết bị $deviceName của bạn, vui lòng cung cấp thông tin đăng nhập Mạng của bạn.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Nhập mật khẩu cho $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Không tìm thấy thiết bị. Vui lòng đảm bảo rằng Bluetooth trên điện thoại của bạn đã được bật và nằm trong phạm vi của thiết bị mới.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Bạn không có đủ quyền cho \"$permissions\" để tiếp tục. Vui lòng cấp các quyền cần thiết và nhấn \"Thử lại\".';
  }

  @override
  String get sendingWifiCredentials => 'Đang gửi thông tin đăng nhập Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Đang xác nhận kết nối Wi-Fi';

  @override
  String get provisionedSuccessfully => 'Thiết bị đã được cung cấp thành công';

  @override
  String get returnToDashboard => 'Quay lại bảng điều khiển';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Không thể thiết lập phiên với thiết bị $deviceName. Vui lòng thử lại';
  }

  @override
  String get claimingDevice => 'Đang xác nhận quyền sở hữu thiết bị';

  @override
  String get claimingDeviceDone => 'Hoàn tất xác nhận quyền sở hữu thiết bị';

  @override
  String get claimingMessageSuccess =>
      'Đã xác nhận quyền sở hữu\nthiết bị thành công';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Bạn không có đủ quyền cho \"$permissions\" để tiếp tục. Vui lòng mở cài đặt ứng dụng, cấp quyền và nhấn \"Thử lại\".';
  }

  @override
  String get scanACode => 'Quét mã';

  @override
  String get allowAccess => 'Cho phép truy cập';

  @override
  String get toggleCamera => 'Bật/tắt camera';

  @override
  String get toggleFlash => 'Bật/tắt đèn flash';

  @override
  String get unableToUseCamera => 'Không thể sử dụng camera';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Mở cài đặt và cấp quyền truy cập camera để tiếp tục';

  @override
  String get notFound => 'Không tìm thấy';

  @override
  String routeNotDefined(Object name) {
    return 'Lộ trình chưa được xác định: $name';
  }

  @override
  String get loginWith => 'Đăng nhập bằng';

  @override
  String get scanQrCode => 'Quét mã QR';

  @override
  String get anEmptyRequestDataReceived =>
      'Đã nhận được dữ liệu yêu cầu trống.';

  @override
  String get somethingWentWrongRollback => 'Đã xảy ra lỗi ... Hoàn tác';

  @override
  String get searchResults => 'Kết quả tìm kiếm';

  @override
  String get viewAll => 'Xem tất cả';

  @override
  String get requestedEntityDoesNotExists =>
      'Thực thể được yêu cầu không tồn tại.';

  @override
  String get noAlarmsFound => 'Không tìm thấy cảnh báo nào';

  @override
  String get filters => 'Bộ lọc';

  @override
  String get alarmStatusList => 'Danh sách trạng thái cảnh báo';

  @override
  String get alarmSeverityList => 'Danh sách mức độ nghiêm trọng của cảnh báo';

  @override
  String get cleared => 'Đã xóa';

  @override
  String get acknowledged => 'Đã xác nhận';

  @override
  String get unacknowledged => 'Chưa xác nhận';

  @override
  String get critical => 'Nghiêm trọng';

  @override
  String get major => 'Chính';

  @override
  String get minor => 'Thứ yếu';

  @override
  String get warning => 'Cảnh báo';

  @override
  String get indeterminate => 'Không xác định';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tìm kiếm người dùng',
      one: 'Tìm kiếm người dùng',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Đặt lại';

  @override
  String get update => 'Cập nhật';

  @override
  String get alarmTypeList => 'Danh sách loại cảnh báo';

  @override
  String get anyType => 'Bất kỳ loại nào';

  @override
  String get plusAlarmType => '+ Loại cảnh báo';

  @override
  String get all => 'Tất cả';

  @override
  String get unread => 'Chưa đọc';

  @override
  String get close => 'Đóng';

  @override
  String get codeVerificationFailed => 'Xác minh mã thất bại!';

  @override
  String get fatalError => 'Lỗi nghiêm trọng';

  @override
  String get unknownError => 'Lỗi không xác định.';

  @override
  String get sessionExpired => 'Phiên đăng nhập đã hết hạn';

  @override
  String get fatalApplicationErrorOccurred =>
      'Đã xảy ra lỗi ứng dụng nghiêm trọng:';

  @override
  String get connectionError => 'Lỗi kết nối';

  @override
  String get failedToConnectToServer => 'Không thể kết nối đến máy chủ';

  @override
  String get retry => 'Thử lại';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Bảng điều khiển di động phải được cấu hình trong hồ sơ thiết bị!';

  @override
  String get openWifiSettings => 'Mở cài đặt Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Kết nối với Wi-Fi bạn thường sử dụng';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Quay lại ứng dụng và nhấn nút Sẵn sàng';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Vui lòng làm theo các bước tiếp theo để kết nối lại\nđiện thoại của bạn với Wi-Fi thông thường';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Thông báo đẩy chưa được cấu hình.\nVui lòng liên hệ với quản trị viên hệ thống của bạn.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase chưa được cấu hình.\nVui lòng tham khảo tài liệu Firebase chính thức để\n biết hướng dẫn cách thực hiện.';

  @override
  String get markAllAsRead => 'Đánh dấu tất cả là đã đọc';

  @override
  String get profile => 'Hồ sơ';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Không thể mở url: $link';
  }

  @override
  String get noDashboardsFound => 'Không tìm thấy bảng điều khiển nào';

  @override
  String get openAppSettings => 'Mở cài đặt ứng dụng';

  @override
  String get connectingToDevice => 'Đang kết nối với thiết bị';

  @override
  String get connectToDevice => 'Kết nối với thiết bị';

  @override
  String get selectWifiNetwork => 'Chọn mạng Wi-Fi';

  @override
  String get deviceProvisioning => 'Cung cấp thiết bị';

  @override
  String get permissions => 'Quyền';

  @override
  String get unableConnectToDevice => 'Không thể kết nối với thiết bị';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Thiết bị không thể tìm thấy Wi-Fi lân cận';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Kết nối với mạng Wi-Fi $name thất bại.\nVui lòng đảm bảo rằng điện thoại của bạn đã được kết nối với mạng Wi-Fi của thiết bị và quyền truy cập Mạng cục bộ đã được bật cho ứng dụng này trong cài đặt thiết bị của bạn.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Không thể kết nối với Wi-Fi vì thiết bị $name không tìm thấy mạng';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Vui lòng làm theo các bước tiếp theo để kết nối điện thoại của bạn với thiết bị';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Kết nối với Wi-Fi tương tự $wifiName';
  }

  @override
  String get ready => 'Sẵn sàng';

  @override
  String get exitDeviceProvisioning => 'Thoát cung cấp thiết bị';

  @override
  String get noNotificationsFound => 'Không tìm thấy thông báo nào';

  @override
  String get markAsRead => 'Đánh dấu là đã đọc';

  @override
  String get url => 'Url';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Vui lòng quét mã QR trên thiết bị của bạn';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get tenant => 'Người thuê';

  @override
  String get tenantProfile => 'Hồ sơ người thuê';

  @override
  String get user => 'Người dùng';

  @override
  String get asset => 'Tài sản';

  @override
  String get deviceProfile => 'Hồ sơ thiết bị';

  @override
  String get assetProfile => 'Hồ sơ tài sản';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cảnh báo',
      one: 'Cảnh báo',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Chuỗi quy tắc';

  @override
  String get ruleNode => 'Nút quy tắc';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Chế độ xem thực thể';

  @override
  String get widgetsBundle => 'Gói widget';

  @override
  String get widgetType => 'Loại widget';

  @override
  String get apiUsageState => 'Trạng thái sử dụng API';

  @override
  String get tbResource => 'Tài nguyên';

  @override
  String get otaPackage => 'Gói OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Hàng đợi';

  @override
  String get notificationTarget => 'Mục tiêu thông báo';

  @override
  String get notificationTemplate => 'Mẫu thông báo';

  @override
  String get notificationRequest => 'Yêu cầu thông báo';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Thông báo',
      one: 'Thông báo',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Quy tắc thông báo';

  @override
  String get entityGroup => 'Nhóm thực thể';

  @override
  String get converter => 'Bộ chuyển đổi';

  @override
  String get integration => 'Tích hợp';

  @override
  String get schedulerEvent => 'Sự kiện lập lịch';

  @override
  String get blobEntity => 'Thực thể Blob';

  @override
  String get role => 'Vai trò';

  @override
  String get groupPermission => 'Quyền nhóm';

  @override
  String get actionStatusSuccess => 'Thành công';

  @override
  String get actionStatusFailure => 'Thất bại';

  @override
  String get actionTypeAdded => 'Đã thêm';

  @override
  String get actionTypeDeleted => 'Đã xóa';

  @override
  String get actionTypeUpdated => 'Đã cập nhật';

  @override
  String get actionTypeAttributesUpdated => 'Thuộc tính đã được cập nhật';

  @override
  String get actionTypeAttributesDeleted => 'Thuộc tính đã bị xóa';

  @override
  String get actionTypeRpcCall => 'Gọi RPC';

  @override
  String get actionTypeCredentialsUpdated =>
      'Thông tin đăng nhập đã được cập nhật';

  @override
  String get actionTypeAssignedToCustomer => 'Đã gán cho Khách hàng';

  @override
  String get actionTypeUnassignedFromCustomer => 'Đã hủy gán khỏi Khách hàng';

  @override
  String get actionTypeActivated => 'Đã kích hoạt';

  @override
  String get actionTypeSuspended => 'Đã đình chỉ';

  @override
  String get actionTypeCredentialsRead => 'Đã đọc thông tin đăng nhập';

  @override
  String get actionTypeAttributesRead => 'Đã đọc thuộc tính';

  @override
  String get actionTypeRelationAddOrUpdate => 'Mối quan hệ đã được cập nhật';

  @override
  String get actionTypeRelationDeleted => 'Mối quan hệ đã bị xóa';

  @override
  String get actionTypeRelationsDeleted => 'Tất cả mối quan hệ đã bị xóa';

  @override
  String get actionTypeAlarmAck => 'Đã xác nhận';

  @override
  String get actionTypeAlarmClear => 'Đã xóa';

  @override
  String get actionTypeAlarmDelete => 'Cảnh báo đã bị xóa';

  @override
  String get actionTypeAlarmAssigned => 'Cảnh báo đã được gán';

  @override
  String get actionTypeAlarmUnassigned => 'Cảnh báo đã bị hủy gán';

  @override
  String get actionTypeLogin => 'Đăng nhập';

  @override
  String get actionTypeLogout => 'Đăng xuất';

  @override
  String get actionTypeLockout => 'Khóa';

  @override
  String get actionTypeAssignedFromTenant => 'Được gán từ Người thuê';

  @override
  String get actionTypeAssignedToTenant => 'Được gán cho Người thuê';

  @override
  String get actionTypeProvisionSuccess => 'Thiết bị đã được cung cấp';

  @override
  String get actionTypeProvisionFailure => 'Cung cấp thiết bị thất bại';

  @override
  String get actionTypeTimeseriesUpdated => 'Dữ liệu đo từ xa đã được cập nhật';

  @override
  String get actionTypeTimeseriesDeleted => 'Dữ liệu đo từ xa đã bị xóa';

  @override
  String get actionTypeAssignedToEdge => 'Đã gán cho Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Đã hủy gán khỏi Edge';

  @override
  String get actionTypeAddedComment => 'Đã thêm Bình luận';

  @override
  String get actionTypeUpdatedComment => 'Bình luận đã được cập nhật';

  @override
  String get actionTypeDeletedComment => 'Bình luận đã bị xóa';

  @override
  String get actionTypeSmsSent => 'Đã gửi SMS';

  @override
  String get actionTypeAddedToEntityGroup => 'Đã thêm vào nhóm thực thể';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Đã xóa khỏi nhóm thực thể';

  @override
  String get actionTypeRestApiRuleEngineCall => 'Gọi công cụ quy tắc REST API';

  @override
  String get actionTypeMadePublic => 'Đã chuyển sang công khai';

  @override
  String get actionTypeMadePrivate => 'Đã chuyển sang riêng tư';

  @override
  String get actionTypeChangeOwner => 'Đã thay đổi chủ sở hữu';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Bạn không có quyền để thực hiện thao tác này!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Có vẻ như quyền của bạn không đủ để hoàn thành thao tác này';

  @override
  String get isRequiredText => 'là bắt buộc.';

  @override
  String get no2faProvidersFound => 'Không tìm thấy nhà cung cấp 2FA nào';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Vui lòng liên hệ với quản trị viên hệ thống của bạn';

  @override
  String errorOccured(Object e) {
    return 'Đã xảy ra lỗi: $e';
  }

  @override
  String get unsavedChanges => 'Thay đổi chưa được lưu';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Bạn có những thay đổi chưa được lưu. Bạn có chắc chắn muốn rời khỏi trang này không?';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Bạn có chắc chắn? Bạn sẽ xóa tài khoản $authority của mình.';
  }

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get metricUnitSystem => 'Hệ mét';

  @override
  String get imperialUnitSystem => 'Hệ đo lường Anh';

  @override
  String get hybridUnitSystem => 'Hệ hỗn hợp';

  @override
  String get autoUnitSystem => 'Tự động';

  @override
  String get languageAuto => 'Tự động';

  @override
  String get unitSystem => 'Hệ thống đơn vị';

  @override
  String get selectCountry => 'Chọn quốc gia';

  @override
  String get hideHomeDashboardToolbar =>
      'Ẩn thanh công cụ bảng điều khiển trang chủ';

  @override
  String get phoneNumberHelperText =>
      'Số điện thoại theo định dạng E.164, ví dụ: +1201550123';

  @override
  String get homeDashboard => 'Bảng điều khiển trang chủ';

  @override
  String get security => 'Bảo mật';

  @override
  String get twofactorAuthentication => 'Xác thực hai yếu tố';

  @override
  String get verificationRequired => 'Yêu cầu xác minh';

  @override
  String get twofactorAuthenticationIsRequired => 'Yêu cầu xác thực hai yếu tố';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Thiết lập một phương thức xác minh để tiếp tục đăng nhập';

  @override
  String get setUpAVerificationMethod => 'Thiết lập một phương thức xác minh';

  @override
  String get totpSetupSuccessDescription =>
      'Lần tiếp theo bạn đăng nhập, bạn sẽ cần cung cấp mã xác thực hai yếu tố';

  @override
  String get smsSetupSuccessDescription =>
      'Lần tiếp theo bạn đăng nhập, bạn sẽ được yêu cầu nhập mã bảo mật được gửi đến số điện thoại';

  @override
  String get emailSetupSuccessDescription =>
      'Lần tiếp theo bạn đăng nhập, bạn sẽ được yêu cầu nhập mã bảo mật được gửi đến địa chỉ email của bạn';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Lần tiếp theo bạn đăng nhập, bạn sẽ có thể sử dụng mã dự phòng để vượt qua xác thực hai yếu tố';

  @override
  String get loginToApp => 'Đăng nhập vào ứng dụng';

  @override
  String get goBack => 'Quay lại';

  @override
  String get done => 'Hoàn tất';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Điều này sẽ làm tài khoản của bạn kém an toàn hơn';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Bạn có chắc chắn muốn hủy kích hoạt $providerName?';
  }

  @override
  String get yesDeactivate => 'Có, hủy kích hoạt';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Nhập một email để sử dụng làm trình xác thực của bạn.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Nhập một số điện thoại để sử dụng làm trình xác thực của bạn';

  @override
  String get sendCode => 'Gửi mã';

  @override
  String errorSendingCode(String error) {
    return 'Lỗi khi gửi mã: $error';
  }

  @override
  String get copy => 'Sao chép';

  @override
  String get copiedToClipboard => 'Đã sao chép vào khay nhớ tạm';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Nhập khóa 6 chữ số từ ứng dụng của bạn vào đây:';

  @override
  String digitsCode(int count) {
    return 'Mã $count chữ số';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Sao chép khóa 32 chữ số vào ứng dụng xác thực của bạn hoặc quét mã QR bên dưới';

  @override
  String get applyChanges => 'Áp dụng thay đổi';

  @override
  String get discardChanges => 'Hủy thay đổi';

  @override
  String get yesDiscard => 'Có, hủy';

  @override
  String get thisActionCannotBeUndone => 'Hành động này không thể hoàn tác';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Xác thực hai yếu tố bảo vệ tài khoản của bạn khỏi bị truy cập trái phép. Tất cả những gì bạn phải làm là nhập mã bảo mật khi đăng nhập.';

  @override
  String get calculatedField => 'Trường được tính toán';

  @override
  String get apiKey => 'Khóa API';

  @override
  String get aiModel => 'Mô hình AI';

  @override
  String get adminSettings => 'Cài đặt quản trị';

  @override
  String get job => 'Công việc';

  @override
  String get mobileAppBundle => 'Gói ứng dụng di động';

  @override
  String get mobileApp => 'Ứng dụng di động';

  @override
  String get domain => 'Tên miền';

  @override
  String get oauth2Client => 'Máy khách Oauth2';

  @override
  String get queueStats => 'Số liệu thống kê hàng đợi';

  @override
  String get phoneIsRequired => 'Vui lòng nhập số điện thoại';

  @override
  String get phoneIsInvalid => 'Số điện thoại không hợp lệ';

  @override
  String get addVerificationMethod => 'Thêm phương thức xác minh';

  @override
  String get imageSavedToGallery => 'Đã lưu vào \'Thư viện ảnh\'';

  @override
  String get failedToSaveImage => 'Không thể lưu ảnh';

  @override
  String nSelected(int count) {
    return '$count đã chọn';
  }

  @override
  String get selectAll => 'Chọn tất cả đã tải';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thao tác thất bại',
      one: '1 thao tác thất bại',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xóa $count thông báo?',
      one: 'Xóa 1 thông báo?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đánh dấu $count thông báo đã đọc?',
      one: 'Đánh dấu 1 thông báo đã đọc?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Getting data from your host $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Logging you into the host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Switching you to the new host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Failed to obtain a login token from $host. Please scan a new QR code.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Failed to connect to $host';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'The QR code session is no longer valid. Please refresh the QR code and scan again.';

  @override
  String get liveTrackingActive => 'Theo dõi vị trí trực tiếp';

  @override
  String get liveTrackingPaused => 'Đã tạm dừng theo dõi trực tiếp';

  @override
  String get liveTrackingFixes => 'Vị trí';

  @override
  String get liveTrackingSaved => 'Đã lưu';

  @override
  String get liveTrackingErrors => 'Lỗi';

  @override
  String get liveTrackingStop => 'Dừng';

  @override
  String get liveTrackingPause => 'Tạm dừng';

  @override
  String get liveTrackingResume => 'Tiếp tục';

  @override
  String get liveTrackingHide => 'Ẩn';

  @override
  String get liveTrackingSessionTitle => 'Theo dõi vị trí trực tiếp';

  @override
  String get liveTrackingTarget => 'Lưu vị trí vào thực thể';

  @override
  String get liveTrackingDashboard => 'Bảng điều khiển';

  @override
  String get liveTrackingStatus => 'Trạng thái';

  @override
  String get liveTrackingStarted => 'Thời gian bắt đầu';

  @override
  String get liveTrackingLastFix => 'Vị trí gần nhất';

  @override
  String get liveTrackingLastError => 'Lỗi gần nhất';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Không thể lưu vào thực thể này vì thực thể không còn tồn tại. Việc theo dõi vẫn tiếp tục; hãy cập nhật đích trong hành động của bảng điều khiển.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Không có kết nối tới máy chủ. Các vị trí này chưa được lưu; việc lưu sẽ tiếp tục khi bạn trực tuyến trở lại.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Phiên của bạn đã kết thúc. Hãy đăng nhập lại để tiếp tục lưu vị trí.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Không thể lưu vào thực thể này vì bạn không có quyền. Việc theo dõi vẫn tiếp tục; hãy đề nghị quản trị viên cấp quyền.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Không thể lưu vị trí này lên máy chủ. Sẽ thử lại với vị trí tiếp theo.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Dịch vụ định vị đang tắt trên thiết bị này.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Quyền truy cập vị trí đã bị từ chối.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Quyền truy cập vị trí đã bị từ chối vĩnh viễn. Hãy bật trong phần cài đặt của ứng dụng.';

  @override
  String get liveTrackingErrorLocation => 'Không thể xác định vị trí.';

  @override
  String get liveTrackingMenuTitle => 'Theo dõi vị trí trực tiếp';

  @override
  String get liveTrackingNoRecord =>
      'Không có phiên theo dõi đang hoạt động hoặc gần đây.';

  @override
  String get liveTrackingLastSession => 'Phiên gần nhất';

  @override
  String get liveTrackingStartAgain => 'Bắt đầu lại';

  @override
  String get liveTrackingEnded => 'Thời gian kết thúc';

  @override
  String get liveTrackingEndReason => 'Lý do kết thúc';

  @override
  String get liveTrackingEndReasonManual => 'Đã dừng thủ công';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Đã đạt thời lượng tối đa';

  @override
  String get liveTrackingEndReasonInterrupted => 'Bị gián đoạn';

  @override
  String get serverUpdateRequired => 'Cần cập nhật máy chủ';

  @override
  String get backToLogin => 'Quay lại đăng nhập';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Ứng dụng này hoạt động với ThingsBoard $minVersion trở lên.';
  }

  @override
  String get serverLabel => 'Máy chủ';

  @override
  String get versionLabel => 'Phiên bản';

  @override
  String get askAdminToUpdateServer =>
      'Hãy yêu cầu quản trị viên máy chủ cập nhật máy chủ.';

  @override
  String get deviceClaimFailed => 'Không thể nhận thiết bị. Vui lòng thử lại.';

  @override
  String get deviceToClaimNotFound =>
      'Không tìm thấy thiết bị. Vui lòng liên hệ nhà cung cấp thiết bị.';
}
