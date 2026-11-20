// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class SKo extends S {
  SKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => '홈';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '장치',
      one: '장치',
    );
    return '$_temp0';
  }

  @override
  String get more => '더보기';

  @override
  String get customers => '고객';

  @override
  String get assets => '자산';

  @override
  String get tenants => '테넌트';

  @override
  String get auditLogs => '감사 로그';

  @override
  String get noCustomersFound => '고객이 없습니다';

  @override
  String get noAssetsFound => '아무 자산도 없습니다';

  @override
  String get noTenantsFound => '테넌트가 없습니다.';

  @override
  String get noDevicesFound => '장치 없음';

  @override
  String get noAuditLogsFound => '감사 로그를 찾을 수 없습니다.';

  @override
  String get logout => '로그아웃';

  @override
  String get login => '로그인';

  @override
  String get logoDefaultValue => 'ThingsBoard 로고';

  @override
  String get loginToYourAccount => '계정에 로그인';

  @override
  String get email => '이메일';

  @override
  String get emailRequireText => '이메일을 입력하세요.';

  @override
  String get emailInvalidText => '잘못된 이메일 형식입니다.';

  @override
  String get username => '사용자 이름';

  @override
  String get password => '비밀번호';

  @override
  String get passwordRequireText => '비밀번호는 필수 항목입니다.';

  @override
  String get passwordForgotText => '비밀번호를 잊으셨습니까?';

  @override
  String get passwordReset => '비밀번호 재설정';

  @override
  String get passwordResetText =>
      '계정에 연결된 이메일을 입력하시면 비밀번호 재설정 링크를 이메일로 보내드립니다.';

  @override
  String get requestPasswordReset => '비밀번호 재설정 요청';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      '비밀번호 재설정 링크를 성공적으로 보냈습니다!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      '이메일 인증 링크를 성공적으로 보냈습니다!';

  @override
  String get or => '또는';

  @override
  String get no => '아니요';

  @override
  String get yes => '예';

  @override
  String get title => '제목';

  @override
  String get country => '국가';

  @override
  String get city => '도시';

  @override
  String get stateOrProvince => '도';

  @override
  String get postalCode => '우편 번호';

  @override
  String get address => '주소';

  @override
  String get address2 => '주소 2';

  @override
  String get phone => '전화번호';

  @override
  String get alarmClearTitle => '알람 해제';

  @override
  String get alarmClearText => '알람을 해제하시겠습니까?';

  @override
  String get alarmAcknowledgeTitle => '알람 확인';

  @override
  String get alarmAcknowledgeText => '알람을 확인하시겠습니까?';

  @override
  String get assetName => '자산 이름';

  @override
  String get type => '유형';

  @override
  String get label => '레이블';

  @override
  String get assignedToCustomer => '할당된 고객';

  @override
  String get auditLogDetails => '감사 로그 세부 사항';

  @override
  String get customerDetails => '고객 상세 정보';

  @override
  String get assetDetails => '자산 세부 정보';

  @override
  String get tenantDetails => '테넌트 상세 정보';

  @override
  String get entityType => '엔티티 유형';

  @override
  String get actionData => '액션 데이터';

  @override
  String get failureDetails => '실패 세부 사항';

  @override
  String get allDevices => '모든 장치';

  @override
  String get active => '활성';

  @override
  String get inactive => '비활성';

  @override
  String get deviceActive => '활성';

  @override
  String get deviceInactive => '비활성';

  @override
  String get activeDevices => '활성';

  @override
  String get inactiveDevices => '비활성';

  @override
  String get alarmStatusActiveAcknowledged => '활성, 확인됨';

  @override
  String get alarmStatusActiveUnacknowledged => '활성, 미확인';

  @override
  String get alarmStatusClearedAcknowledged => '해제됨, 확인됨';

  @override
  String get alarmStatusClearedUnacknowledged => '해제됨, 미확인';

  @override
  String get alarmStatusFilterActive => '활성';

  @override
  String get systemAdministrator => '시스템 관리자';

  @override
  String get tenantAdministrator => '테넌트 관리자';

  @override
  String get customer => '고객';

  @override
  String get changePassword => '비밀번호 변경';

  @override
  String get currentPasswordRequireText => '현재 비밀번호는 필수 항목입니다.';

  @override
  String get currentPassword => '현재 비밀번호';

  @override
  String get newPasswordRequireText => '새 비밀번호는 필수 항목입니다.';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get newPassword2RequireText => '새 비밀번호 확인은 필수 항목입니다.';

  @override
  String get newPassword2 => '새 비밀번호 확인';

  @override
  String get passwordErrorNotification => '입력된 비밀번호는 같아야 합니다!';

  @override
  String get firstNameUpper => '이름';

  @override
  String get lastNameUpper => '성';

  @override
  String get profileSuccessNotification => '프로필이 업데이트되었습니다.';

  @override
  String get passwordSuccessNotification => '비밀번호가 변경되었습니다.';

  @override
  String get notImplemented => '구현되지 않았습니다!';

  @override
  String get listIsEmptyText => '목록이 비어 있습니다.';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get verifyYourIdentity => '신원 확인';

  @override
  String get continueText => '계속';

  @override
  String get resendCode => '코드 재전송';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time초',
      one: '1초',
    );
    return '$_temp0 후 코드 재전송';
  }

  @override
  String get totpAuthDescription => '인증기 앱에서 보안 코드를 입력하세요.';

  @override
  String smsAuthDescription(Object contact) {
    return '보안 코드가 전화번호 $contact(으)로 전송되었습니다.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '보안 코드가 이메일 주소 $contact(으)로 전송되었습니다.';
  }

  @override
  String get backupCodeAuthDescription => '백업 코드 중 하나를 입력하세요.';

  @override
  String get toptAuthPlaceholder => '코드';

  @override
  String get smsAuthPlaceholder => 'SMS 코드';

  @override
  String get emailAuthPlaceholder => '이메일 코드';

  @override
  String get backupCodeAuthPlaceholder => '백업 코드';

  @override
  String get verificationCodeIncorrect => '확인 코드가 올바르지 않습니다.';

  @override
  String get verificationCodeManyRequest => '확인 코드 확인 요청이 너무 많습니다.';

  @override
  String get tryAnotherWay => '다른 방법 시도';

  @override
  String get selectWayToVerify => '확인 방법 선택';

  @override
  String get mfaProviderTopt => '인증기 앱';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => '이메일';

  @override
  String get mfaProviderBackupCode => '백업 코드';

  @override
  String get newUserText => '신규 사용자이십니까?';

  @override
  String get createAccount => '계정 생성';

  @override
  String get emailVerification => '이메일 인증';

  @override
  String get emailVerificationSentText =>
      '인증 세부 정보가 포함된 이메일을 지정한 이메일 주소로 전송했습니다 ';

  @override
  String get emailVerificationInstructionsText =>
      '가입 절차를 완료하려면 이메일에 포함된 지침을 따르세요. 참고: 이메일이 한동안 보이지 않으면 \'스팸\' 폴더를 확인하거나 \'재전송\' 버튼을 클릭하여 이메일을 다시 전송해 보세요.';

  @override
  String get resend => '재전송';

  @override
  String get activatingAccount => '계정 활성화 중...';

  @override
  String get accountActivated => '계정이 성공적으로 활성화되었습니다!';

  @override
  String get emailVerified => '이메일이 확인되었습니다.';

  @override
  String get activatingAccountText => '계정을 활성화하는 중입니다.\n잠시 기다려 주세요...';

  @override
  String accountActivatedText(Object appTitle) {
    return '축하합니다!\n$appTitle 계정이 활성화되었습니다.\n이제 $appTitle 공간에 로그인할 수 있습니다.';
  }

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get cancel => '취소';

  @override
  String get accept => '동의';

  @override
  String get termsOfUse => '이용 약관';

  @override
  String get firstName => '이름';

  @override
  String get firstNameRequireText => '이름은 필수 항목입니다.';

  @override
  String get lastName => '성';

  @override
  String get lastNameRequireText => '성은 필수 항목입니다.';

  @override
  String get createPassword => '비밀번호 생성';

  @override
  String get repeatPassword => '비밀번호 재입력';

  @override
  String get imNotARobot => '저는 로봇이 아닙니다';

  @override
  String get signUp => '회원가입';

  @override
  String get alreadyHaveAnAccount => '이미 계정이 있습니까?';

  @override
  String get signIn => '로그인';

  @override
  String get inactiveUserAlreadyExists => '비활성 사용자가 이미 존재합니다';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      '이메일 주소가 확인되지 않은 등록된 사용자가 이미 있습니다.\n인증 이메일을 다시 전송하려면 \'재전송\' 버튼을 클릭하세요.';

  @override
  String get assignee => '담당자';

  @override
  String get alarmTypes => '알람 유형';

  @override
  String get details => '세부 정보';

  @override
  String get status => '상태';

  @override
  String get severity => '심각도';

  @override
  String get originator => '발생 엔티티';

  @override
  String get startTime => '시작 시간';

  @override
  String get duration => '기간';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value일',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value시간',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value분',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value초',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => '대시보드 보기';

  @override
  String get activity => '활동';

  @override
  String get addCommentMessage => '댓글 추가...';

  @override
  String get selectUser => '사용자 선택';

  @override
  String get assignedToMe => '나에게 할당됨';

  @override
  String get clear => '해제';

  @override
  String get acknowledge => '확인';

  @override
  String get edit => '수정';

  @override
  String get editProfile => '프로필 수정';

  @override
  String get delete => '삭제';

  @override
  String get edited => '수정됨';

  @override
  String get deleteComment => '댓글 삭제';

  @override
  String get areYouSure => '계속하시겠습니까?';

  @override
  String get noResultsFound => '결과를 찾을 수 없습니다';

  @override
  String get tryRefiningYourQuery => '검색어를 수정해 보세요';

  @override
  String get failedToLoadTheList => '목록을 불러오지 못했습니다';

  @override
  String get tryRefreshing => '새로고침해 보세요';

  @override
  String get refresh => '새로고침';

  @override
  String get users => '사용자';

  @override
  String get unassigned => '미할당';

  @override
  String get failedToLoadAlarmDetails => '알람 세부 정보를 불러오지 못했습니다';

  @override
  String get somethingWentWrong => '문제가 발생했습니다';

  @override
  String get chooseRegion => '지역 선택';

  @override
  String get selectRegion => '지역 선택';

  @override
  String get northAmerica => '북미';

  @override
  String get europe => '유럽';

  @override
  String get northAmericaRegionShort => '버지니아 북부';

  @override
  String get europeRegionShort => '프랑크푸르트';

  @override
  String get deviceList => '장치 리스트';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '대시보드',
      one: '대시보드',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => '업데이트 필요';

  @override
  String updateTo(Object version) {
    return '$version(으)로 업데이트';
  }

  @override
  String get next => '다음';

  @override
  String get confirmation => '확인';

  @override
  String get wifiPassword => 'Wi-Fi 비밀번호';

  @override
  String wifiHelpMessage(Object deviceName) {
    return '장치 $deviceName의 설정을 계속하려면 네트워크 자격 증명을 입력하세요.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '$network의 비밀번호를 입력하세요';
  }

  @override
  String get deviceNotFoundMessage =>
      '장치를 찾을 수 없습니다. 휴대폰의 블루투스가 켜져 있고 새 장치의 범위 내에 있는지 확인하세요.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '\"$permissions\"에 대한 권한이 부족하여 계속할 수 없습니다. 필요한 권한을 부여하고 \"다시 시도\"를 탭하세요.';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi 자격 증명 전송 중';

  @override
  String get confirmingWifiConnection => 'Wi-Fi 연결 확인 중';

  @override
  String get provisionedSuccessfully => '장치가 성공적으로 프로비저닝되었습니다';

  @override
  String get returnToDashboard => '대시보드로 돌아가기';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '장치 $deviceName와(과) 세션을 설정할 수 없습니다. 다시 시도하세요';
  }

  @override
  String get claimingDevice => '장치 소유권 등록 중';

  @override
  String get claimingDeviceDone => '장치 소유권 등록 완료';

  @override
  String get claimingMessageSuccess => '장치 소유권 등록이\n성공적으로 완료되었습니다';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '\"$permissions\"에 대한 권한이 부족하여 계속할 수 없습니다. 앱 설정을 열고 권한을 부여한 후 \"다시 시도\"를 탭하세요.';
  }

  @override
  String get scanACode => '코드 스캔';

  @override
  String get allowAccess => '액세스 허용';

  @override
  String get toggleCamera => '카메라 전환';

  @override
  String get toggleFlash => '플래시 전환';

  @override
  String get unableToUseCamera => '카메라를 사용할 수 없습니다';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      '계속하려면 설정을 열고 카메라 액세스를 허용하세요';

  @override
  String get notFound => '찾을 수 없음';

  @override
  String routeNotDefined(Object name) {
    return '경로가 정의되지 않음: $name';
  }

  @override
  String get loginWith => '다음으로 로그인';

  @override
  String get scanQrCode => 'QR 코드 스캔';

  @override
  String get anEmptyRequestDataReceived => '빈 요청 데이터가 수신되었습니다.';

  @override
  String get somethingWentWrongRollback => '문제가 발생했습니다 ... 롤백';

  @override
  String get searchResults => '검색 결과';

  @override
  String get viewAll => '모두 보기';

  @override
  String get requestedEntityDoesNotExists => '요청한 엔티티가 존재하지 않습니다.';

  @override
  String get noAlarmsFound => '아무 알람도 없습니다';

  @override
  String get filters => '필터';

  @override
  String get alarmStatusList => '알람 상태 목록';

  @override
  String get alarmSeverityList => '알람 심각도 목록';

  @override
  String get cleared => '해제됨';

  @override
  String get acknowledged => '확인됨';

  @override
  String get unacknowledged => '미확인';

  @override
  String get critical => '심각';

  @override
  String get major => '주요';

  @override
  String get minor => '경미';

  @override
  String get warning => '경고';

  @override
  String get indeterminate => '알 수 없음';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사용자 검색',
      one: '사용자 검색',
    );
    return '$_temp0';
  }

  @override
  String get reset => '초기화';

  @override
  String get update => '업데이트';

  @override
  String get alarmTypeList => '알람 유형 목록';

  @override
  String get anyType => '모든 유형';

  @override
  String get plusAlarmType => '+ 알람 유형';

  @override
  String get all => '모두';

  @override
  String get allNotifications => '모두';

  @override
  String get unread => '읽지 않음';

  @override
  String get close => '닫기';

  @override
  String get codeVerificationFailed => '코드 확인에 실패했습니다!';

  @override
  String get fatalError => '치명적 오류';

  @override
  String get unknownError => '알 수 없는 오류입니다.';

  @override
  String get sessionExpired => '세션이 만료되었습니다';

  @override
  String get fatalApplicationErrorOccurred => '치명적인 앱 오류가 발생했습니다:';

  @override
  String get connectionError => '연결 오류';

  @override
  String get failedToConnectToServer => '서버 연결에 실패했습니다';

  @override
  String get retry => '재시도';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      '장치 프로필에 모바일 대시보드를 구성해야 합니다!';

  @override
  String get openWifiSettings => 'Wi-Fi 설정 열기';

  @override
  String get connectToTheWifiYouUsuallyUse => '평소 사용하는 Wi-Fi에 연결하세요';

  @override
  String get returnToTheAppAndTapReadyButton => '앱으로 돌아가 \'준비 완료\' 버튼을 탭하세요';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      '다음 단계에 따라\n휴대폰을 평소 사용하는 Wi-Fi에 다시 연결하세요';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      '푸시 알림이 구성되어 있지 않습니다.\n시스템 관리자에게 문의하세요.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase가 구성되어 있지 않습니다.\n 구성 방법은 공식 Firebase 문서를\n 참조하세요.';

  @override
  String get markAllAsRead => '모두 읽음으로 표시';

  @override
  String get profile => '프로필';

  @override
  String cantLaunchUrlLink(String link) {
    return 'URL을 열 수 없습니다: $link';
  }

  @override
  String get noDashboardsFound => '대시보드가 없습니다';

  @override
  String get openAppSettings => '앱 설정 열기';

  @override
  String get connectingToDevice => '장치에 연결하는 중';

  @override
  String get connectToDevice => '장치에 연결';

  @override
  String get selectWifiNetwork => 'Wi-Fi 네트워크 선택';

  @override
  String get deviceProvisioning => '장치 프로비저닝';

  @override
  String get permissions => '권한';

  @override
  String get unableConnectToDevice => '장치에 연결할 수 없습니다';

  @override
  String get deviceNotAbleToFindWifiNearby => '장치가 주변에서 Wi-Fi를 찾을 수 없습니다';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '$name Wi-Fi 네트워크 연결에 실패했습니다.\n휴대폰이 장치의 Wi-Fi 네트워크에 연결되어 있고, 휴대폰 설정에서 이 앱의 로컬 네트워크 액세스가 활성화되어 있는지 확인하세요.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return '장치 $name이(가) 네트워크를 찾지 못해 Wi-Fi에 연결할 수 없습니다';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      '휴대폰을 장치에 연결하려면 다음 단계를 따르세요';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '$wifiName와(과) 유사한 Wi-Fi에 연결';
  }

  @override
  String get ready => '준비 완료';

  @override
  String get exitDeviceProvisioning => '장치 프로비저닝 종료';

  @override
  String get noNotificationsFound => '알림을 찾을 수 없습니다';

  @override
  String get markAsRead => '읽음으로 표시';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => '장치의 QR 코드를 스캔하세요';

  @override
  String get search => '검색';

  @override
  String get tenant => '테넌트';

  @override
  String get tenantProfile => '테넌트 프로필';

  @override
  String get user => '사용자';

  @override
  String get asset => '자산';

  @override
  String get deviceProfile => '장치 프로필';

  @override
  String get assetProfile => '자산 프로필';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '알람',
      one: '알람',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => '규칙 체인';

  @override
  String get ruleNode => '규칙 노드';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => '엔티티 뷰';

  @override
  String get widgetsBundle => '위젯 번들';

  @override
  String get widgetType => '위젯 타입';

  @override
  String get apiUsageState => 'API 사용 상태';

  @override
  String get tbResource => '리소스';

  @override
  String get otaPackage => 'OTA 패키지';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => '큐';

  @override
  String get notificationTarget => '알림 수신자';

  @override
  String get notificationTemplate => '알림 템플릿';

  @override
  String get notificationRequest => '알림 요청';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '알림',
      one: '알림',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => '알림 규칙';

  @override
  String get entityGroup => '엔티티 그룹';

  @override
  String get converter => '변환기';

  @override
  String get integration => '통합';

  @override
  String get schedulerEvent => '스케줄러 이벤트';

  @override
  String get blobEntity => 'Blob 엔티티';

  @override
  String get role => '역할';

  @override
  String get groupPermission => '그룹 권한';

  @override
  String get actionStatusSuccess => '성공';

  @override
  String get actionStatusFailure => '실패';

  @override
  String get actionTypeAdded => '추가됨';

  @override
  String get actionTypeDeleted => '삭제됨';

  @override
  String get actionTypeUpdated => '업데이트됨';

  @override
  String get actionTypeAttributesUpdated => '속성 업데이트됨';

  @override
  String get actionTypeAttributesDeleted => '속성 삭제됨';

  @override
  String get actionTypeRpcCall => 'RPC 호출';

  @override
  String get actionTypeCredentialsUpdated => '자격 증명 업데이트됨';

  @override
  String get actionTypeAssignedToCustomer => '고객에게 할당됨';

  @override
  String get actionTypeUnassignedFromCustomer => '고객 할당 해제됨';

  @override
  String get actionTypeActivated => '활성화됨';

  @override
  String get actionTypeSuspended => '일시 중지됨';

  @override
  String get actionTypeCredentialsRead => '자격 증명 읽음';

  @override
  String get actionTypeAttributesRead => '속성 읽음';

  @override
  String get actionTypeRelationAddOrUpdate => '관계 업데이트됨';

  @override
  String get actionTypeRelationDeleted => '관계 삭제됨';

  @override
  String get actionTypeRelationsDeleted => '모든 관계 삭제됨';

  @override
  String get actionTypeAlarmAck => '알람 확인됨';

  @override
  String get actionTypeAlarmClear => '알람 해제됨';

  @override
  String get actionTypeAlarmDelete => '알람 삭제됨';

  @override
  String get actionTypeAlarmAssigned => '알람 할당됨';

  @override
  String get actionTypeAlarmUnassigned => '알람 할당 해제됨';

  @override
  String get actionTypeLogin => '로그인';

  @override
  String get actionTypeLogout => '로그아웃';

  @override
  String get actionTypeLockout => '잠금';

  @override
  String get actionTypeAssignedFromTenant => '테넌트로부터 할당됨';

  @override
  String get actionTypeAssignedToTenant => '테넌트에 할당됨';

  @override
  String get actionTypeProvisionSuccess => '장치 프로비저닝됨';

  @override
  String get actionTypeProvisionFailure => '장치 프로비저닝 실패';

  @override
  String get actionTypeTimeseriesUpdated => '텔레메트리 수정됨';

  @override
  String get actionTypeTimeseriesDeleted => '텔레메트리 삭제됨';

  @override
  String get actionTypeAssignedToEdge => 'Edge에 할당됨';

  @override
  String get actionTypeUnassignedFromEdge => 'Edge에서 할당 해제됨';

  @override
  String get actionTypeAddedComment => '댓글 추가됨';

  @override
  String get actionTypeUpdatedComment => '댓글 수정됨';

  @override
  String get actionTypeDeletedComment => '댓글 삭제됨';

  @override
  String get actionTypeSmsSent => 'SMS 전송됨';

  @override
  String get actionTypeAddedToEntityGroup => '엔티티 그룹에 추가됨';

  @override
  String get actionTypeRemovedFromEntityGroup => '엔티티 그룹에서 제거됨';

  @override
  String get actionTypeRestApiRuleEngineCall => '규칙 엔진 REST API 호출';

  @override
  String get actionTypeMadePublic => '공개로 설정됨';

  @override
  String get actionTypeMadePrivate => '비공개로 설정됨';

  @override
  String get actionTypeChangeOwner => '소유자 변경됨';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      '이 작업을 수행할 권한이 없습니다!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      '이 작업을 완료하기에 권한이 부족한 것 같습니다';

  @override
  String get isRequiredText => '필드는 필수 항목입니다.';

  @override
  String get no2faProvidersFound => '2FA 제공자를 찾을 수 없습니다';

  @override
  String get pleaseContactYourSystemAdministrator => '시스템 관리자에게 문의하세요';

  @override
  String errorOccured(Object e) {
    return '오류가 발생했습니다: $e';
  }

  @override
  String get unsavedChanges => '저장되지 않은 변경사항';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      '변경 사항을 저장하지 않았습니다. 이 페이지를 나가시겠습니까?';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String accountDeletionDialogBody(Object authority) {
    return '계속하시겠습니까? $authority 계정을 삭제합니다.';
  }

  @override
  String get language => '언어';

  @override
  String get metricUnitSystem => '미터법';

  @override
  String get imperialUnitSystem => '야드파운드법';

  @override
  String get hybridUnitSystem => '하이브리드';

  @override
  String get autoUnitSystem => '자동';

  @override
  String get languageAuto => '자동';

  @override
  String get unitSystem => '단위 시스템';

  @override
  String get selectCountry => '국가를 선택하세요';

  @override
  String get hideHomeDashboardToolbar => '홈 대시보드 도구 모음 숨기기';

  @override
  String get phoneNumberHelperText => 'E.164 형식의 전화번호, 예: +1201550123';

  @override
  String get homeDashboard => '홈 대시보드';

  @override
  String get security => '보안';

  @override
  String get twofactorAuthentication => '2단계 인증';

  @override
  String get verificationRequired => '인증 필요';

  @override
  String get twofactorAuthenticationIsRequired => '2단계 인증이 필요합니다';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      '로그인을 계속하려면 확인 방법을 설정하세요';

  @override
  String get setUpAVerificationMethod => '확인 방법 설정';

  @override
  String get totpSetupSuccessDescription => '다음에 로그인할 때 2단계 인증 코드를 제공해야 합니다';

  @override
  String get smsSetupSuccessDescription =>
      '다음에 로그인할 때 전화번호로 전송될 보안 코드를 입력하라는 메시지가 표시됩니다';

  @override
  String get emailSetupSuccessDescription =>
      '다음에 로그인할 때 이메일 주소로 전송될 보안 코드를 입력하라는 메시지가 표시됩니다';

  @override
  String get backupCodeSetupSuccessDescription =>
      '다음 로그인 시 백업 코드를 사용하여 2단계 인증을 통과할 수 있습니다';

  @override
  String get loginToApp => '앱에 로그인';

  @override
  String get goBack => '뒤로 가기';

  @override
  String get done => '완료';

  @override
  String get thisWillMakeYourAccountLessSecure => '계정의 보안 수준이 낮아집니다';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '$providerName을(를) 비활성화하시겠습니까?';
  }

  @override
  String get yesDeactivate => '예, 비활성화';

  @override
  String get enterAnEmailToUseAsYourAuthenticator => '인증기로 사용할 이메일을 입력하세요.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      '인증기로 사용할 전화번호를 입력하세요';

  @override
  String get sendCode => '코드 전송';

  @override
  String errorSendingCode(String error) {
    return '코드 전송 오류: $error';
  }

  @override
  String get copy => '복사';

  @override
  String get copiedToClipboard => '클립보드에 복사되었습니다.';

  @override
  String get enter6digitsKeyFromYourAppHere => '여기에 6자리 코드를 입력하세요';

  @override
  String digitsCode(int count) {
    return '$count자리 코드';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '32자리 키를 인증기 앱에 복사하거나 아래 QR 코드를 스캔하세요.';

  @override
  String get applyChanges => '변경사항 적용';

  @override
  String get discardChanges => '변경사항 버리기';

  @override
  String get yesDiscard => '예, 버리기';

  @override
  String get thisActionCannotBeUndone => '이 작업은 실행 취소할 수 없습니다.';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      '2단계 인증은 무단 액세스로부터 계정을 보호합니다. 로그인할 때 보안 코드를 입력하기만 하면 됩니다.';

  @override
  String get calculatedField => '계산 필드';

  @override
  String get apiKey => 'API 키';

  @override
  String get aiModel => 'AI 모델';

  @override
  String get adminSettings => '관리자 설정';

  @override
  String get job => '작업';

  @override
  String get mobileAppBundle => '모바일 번들';

  @override
  String get mobileApp => '모바일 앱';

  @override
  String get domain => '도메인';

  @override
  String get oauth2Client => 'OAuth 2.0 클라이언트';

  @override
  String get queueStats => '큐 통계';

  @override
  String get phoneIsRequired => '전화번호는 필수 항목입니다.';

  @override
  String get phoneIsInvalid => '전화번호가 유효하지 않습니다.';

  @override
  String get addVerificationMethod => '확인 방법 추가';

  @override
  String get imageSavedToGallery => '플랫폼 \'이미지 갤러리\'에 저장되었습니다.';

  @override
  String get failedToSaveImage => '이미지 저장에 실패했습니다.';

  @override
  String nSelected(int count) {
    return '$count개 선택됨';
  }

  @override
  String get selectAll => '로드된 항목 모두 선택';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '작업 $count개 실패',
      one: '작업 1개 실패',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '알림 $count개를 삭제하시겠습니까?',
      one: '알림 1개를 삭제하시겠습니까?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '알림 $count개를 읽음으로 표시하시겠습니까?',
      one: '알림 1개를 읽음으로 표시하시겠습니까?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return '호스트 $host에서 데이터를 가져오는 중입니다.';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return '호스트 $host에 로그인하는 중입니다.';
  }

  @override
  String switchingToNewHost(Object host) {
    return '새 호스트 $host(으)로 전환하는 중입니다.';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '$host에서 로그인 토큰을 가져오지 못했습니다. 새 QR 코드를 스캔하세요.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '$host에 연결하지 못했습니다.';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host은(는) ThingsBoard 서버가 아닙니다.';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR 코드 세션이 더 이상 유효하지 않습니다. QR 코드를 새로 고치고 다시 스캔하세요.';

  @override
  String get openThisLinkTitle => '이 링크를 여시겠습니까?';

  @override
  String get linkOpensSignInPage =>
      '이 링크는 이 서버의 로그인 페이지를 엽니다. 현재 서버에서 로그아웃됩니다.';

  @override
  String get linkOpensSignInPageOnly => '이 링크는 이 서버의 로그인 페이지를 엽니다.';

  @override
  String linkSignsInAs(Object email) {
    return '이 링크는 $email(으)로 이 서버에 로그인합니다.';
  }

  @override
  String get linkSignsIn => '이 링크는 이 서버에 로그인합니다.';

  @override
  String get serverConnectionNotSecure => '이 서버는 보안 연결을 사용하지 않습니다.';

  @override
  String get linkToOtherServerNotAllowed =>
      '이 앱은 자체 서버에서만 작동하며 이 링크를 열 수 없습니다.';

  @override
  String get liveTrackingActive => '실시간 위치 추적';

  @override
  String get liveTrackingPaused => '실시간 추적 일시 중지됨';

  @override
  String get liveTrackingFixes => '측위';

  @override
  String get liveTrackingSaved => '저장됨';

  @override
  String get liveTrackingErrors => '오류';

  @override
  String get liveTrackingStop => '정지';

  @override
  String get liveTrackingPause => '일시 중지';

  @override
  String get liveTrackingResume => '재개';

  @override
  String get liveTrackingHide => '숨기기';

  @override
  String get liveTrackingSessionTitle => '실시간 위치 추적';

  @override
  String get liveTrackingTarget => '엔티티에 위치 저장';

  @override
  String get liveTrackingDashboard => '대시보드';

  @override
  String get liveTrackingStatus => '상태';

  @override
  String get liveTrackingStarted => '시작 시간';

  @override
  String get liveTrackingLastFix => '마지막 측위';

  @override
  String get liveTrackingLastError => '마지막 오류';

  @override
  String get liveTrackingErrorTargetNotFound =>
      '이 엔티티에 저장할 수 없습니다 — 더 이상 존재하지 않습니다. 추적은 계속됩니다. 대시보드 액션에서 대상을 업데이트하세요.';

  @override
  String get liveTrackingErrorNoConnection =>
      '서버에 연결할 수 없습니다. 이 위치 데이터는 저장되지 않았으며, 온라인 상태가 되면 저장이 재개됩니다.';

  @override
  String get liveTrackingErrorUnauthorized =>
      '세션이 종료되었습니다. 위치를 계속 저장하려면 다시 로그인하세요.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      '이 엔티티에 저장할 수 없습니다 — 권한이 없습니다. 추적은 계속됩니다. 관리자에게 액세스 권한을 요청하세요.';

  @override
  String get liveTrackingErrorSaveFailed =>
      '이 위치를 서버에 저장할 수 없습니다. 다음 위치와 함께 저장을 재시도합니다.';

  @override
  String get liveTrackingErrorServicesDisabled => '휴대폰에서 위치 서비스가 꺼져 있습니다.';

  @override
  String get liveTrackingErrorPermissionDenied => '위치 권한이 거부되었습니다.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      '위치 권한이 영구적으로 거부되었습니다. 앱 설정에서 활성화하세요.';

  @override
  String get liveTrackingErrorLocation => '위치를 가져올 수 없습니다.';

  @override
  String get liveTrackingMenuTitle => '실시간 위치 추적';

  @override
  String get liveTrackingNoRecord => '활성 추적 및 최근 세션이 없습니다.';

  @override
  String get liveTrackingLastSession => '마지막 세션';

  @override
  String get liveTrackingStartAgain => '다시 시작';

  @override
  String get liveTrackingEnded => '종료 시간';

  @override
  String get liveTrackingEndReason => '종료 사유';

  @override
  String get liveTrackingEndReasonManual => '수동으로 중지됨';

  @override
  String get liveTrackingEndReasonMaxDuration => '최대 지속 시간 도달';

  @override
  String get liveTrackingEndReasonInterrupted => '중단됨';

  @override
  String get serverUpdateRequired => '서버 업데이트 필요';

  @override
  String get backToLogin => '로그인으로 돌아가기';

  @override
  String serverRequiresVersion(String minVersion) {
    return '이 앱은 ThingsBoard $minVersion 이상에서 작동합니다.';
  }

  @override
  String get serverLabel => '서버';

  @override
  String get versionLabel => '버전';

  @override
  String get askAdminToUpdateServer => '서버 관리자에게 서버 업데이트를 요청하세요.';

  @override
  String get deviceClaimFailed => '장치 소유권을 등록할 수 없습니다. 다시 시도하세요.';

  @override
  String get deviceToClaimNotFound => '장치를 찾을 수 없습니다. 장치 공급자에게 문의하세요.';

  @override
  String get enableAuthenticatorApp => '인증기 앱 활성화';

  @override
  String get enableSmsAuthenticator => 'SMS 인증기 활성화';

  @override
  String get enableEmailAuthenticator => '이메일 인증기 활성화';

  @override
  String get getBackupCode => '백업 코드 받기';

  @override
  String get twoFaTotpDescription =>
      '휴대전화에서 Google Authenticator, Authy 또는 Duo와 같은 앱을 사용하여 인증하세요. 로그인할 보안 코드를 생성합니다.';

  @override
  String get twoFaSmsDescription =>
      '휴대전화를 사용하여 인증하세요. 로그인할 때 SMS 메시지로 보안 코드를 보내드립니다.';

  @override
  String get twoFaEmailDescription => '이메일 주소로 전송된 보안 코드를 사용하여 인증하세요.';

  @override
  String get twoFaBackupCodeDescription =>
      '이 인쇄 가능한 일회용 암호는 여행 중처럼 휴대전화를 사용할 수 없을 때 로그인할 수 있도록 해줍니다.';

  @override
  String get openInAuthenticatorApp => '인증기 앱에서 열기';

  @override
  String get noAuthenticatorAppFound => '인증기 앱을 찾을 수 없습니다. 대신 키를 앱에 복사하세요.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider이(가) 활성화됨';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return '관리자가 $email에 대해 2단계 인증을 요구합니다.';
  }

  @override
  String get recommended => '권장';

  @override
  String get addBackupCodesHint => '휴대폰을 분실해도 로그인할 수 있도록 백업 코드도 추가하세요.';

  @override
  String get totpSecretKey => '비밀 키';

  @override
  String get backupCodesDescription =>
      '계정에 로그인할 때 바로 사용할 수 있도록 코드를 인쇄해 두세요. 각 백업 코드는 한 번만 사용할 수 있습니다.';

  @override
  String get backupCodesWarning =>
      '이 페이지를 떠나면 이 코드를 다시 볼 수 없습니다. 아래 옵션을 사용하여 안전하게 보관하세요.';

  @override
  String get downloadTxt => '다운로드 (txt)';
}
