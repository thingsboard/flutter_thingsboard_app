// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class STr extends S {
  STr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Ana sayfa';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cihazlar',
      one: 'Cihaz',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Daha fazla';

  @override
  String get customers => 'Müşteriler';

  @override
  String get assets => 'Varlıklar';

  @override
  String get tenants => 'Kiracılar';

  @override
  String get auditLogs => 'Denetim günlükleri';

  @override
  String get noCustomersFound => 'Hiç müşteri bulunamadı';

  @override
  String get noAssetsFound => 'Varlık bulunamadı';

  @override
  String get noTenantsFound => 'Hiçbir kiracı bulunamadı';

  @override
  String get noDevicesFound => 'Hiçbir cihaz bulunamadı';

  @override
  String get noAuditLogsFound => 'Denetim günlüğü bulunamadı';

  @override
  String get logout => 'Çıkış yap';

  @override
  String get login => 'Giriş yap';

  @override
  String get logoDefaultValue => 'ThingsBoard logosu';

  @override
  String get loginToYourAccount => 'Hesabınıza giriş yapın';

  @override
  String get email => 'E-posta';

  @override
  String get emailRequireText => 'E-posta gereklidir.';

  @override
  String get emailInvalidText => 'Geçersiz e-posta formatı.';

  @override
  String get username => 'kullanıcı adı';

  @override
  String get password => 'Parola';

  @override
  String get passwordRequireText => 'Parola gereklidir.';

  @override
  String get passwordForgotText => 'Parolanızı mı unuttunuz?';

  @override
  String get passwordReset => 'Parolayı Sıfırla';

  @override
  String get passwordResetText =>
      'Hesabınızla ilişkili e-posta adresini girin, size parola sıfırlama bağlantısı içeren bir e-posta gönderelim';

  @override
  String get requestPasswordReset => 'Parola sıfırlama iste';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Parola sıfırlama bağlantısı başarıyla gönderildi!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'E-posta doğrulama bağlantısı başarıyla gönderildi!';

  @override
  String get or => 'VEYA';

  @override
  String get no => 'Hayır';

  @override
  String get yes => 'Evet';

  @override
  String get title => 'Başlık';

  @override
  String get country => 'Ülke';

  @override
  String get city => 'Şehir';

  @override
  String get stateOrProvince => 'Eyalet / İl';

  @override
  String get postalCode => 'Posta Kodu';

  @override
  String get address => 'Adres';

  @override
  String get address2 => 'Adres 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Alarmı Temizle';

  @override
  String get alarmClearText => 'Alarmı temizlemek istediğinizden emin misiniz?';

  @override
  String get alarmAcknowledgeTitle => 'Alarmı Onayla';

  @override
  String get alarmAcknowledgeText =>
      'Alarmı onaylamak istediğinizden emin misiniz?';

  @override
  String get assetName => 'Varlık adı';

  @override
  String get type => 'Tür';

  @override
  String get label => 'Etiket';

  @override
  String get assignedToCustomer => 'Müşteriye atanmış';

  @override
  String get auditLogDetails => 'Denetim günlüğü ayrıntıları';

  @override
  String get customerDetails => 'Müşteri ayrıntıları';

  @override
  String get assetDetails => 'Varlık ayrıntıları';

  @override
  String get tenantDetails => 'Kiracı ayrıntıları';

  @override
  String get entityType => 'Öğe türü';

  @override
  String get actionData => 'İşlem verisi';

  @override
  String get failureDetails => 'Hata ayrıntıları';

  @override
  String get allDevices => 'Tüm cihazlar';

  @override
  String get active => 'Aktif';

  @override
  String get inactive => 'Pasif';

  @override
  String get deviceActive => 'Aktif';

  @override
  String get deviceInactive => 'Pasif';

  @override
  String get activeDevices => 'Aktif';

  @override
  String get inactiveDevices => 'Pasif';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktif, onaylandı';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktif, onaylanmadı';

  @override
  String get alarmStatusClearedAcknowledged => 'Temizlendi, onaylandı';

  @override
  String get alarmStatusClearedUnacknowledged => 'Temizlendi, onaylanmadı';

  @override
  String get alarmStatusFilterActive => 'Aktif';

  @override
  String get systemAdministrator => 'Sistem yöneticisi';

  @override
  String get tenantAdministrator => 'Kiracı yöneticisi';

  @override
  String get customer => 'Müşteri';

  @override
  String get changePassword => 'Parolayı Değiştir';

  @override
  String get currentPasswordRequireText => 'Mevcut parola gereklidir.';

  @override
  String get currentPassword => 'Mevcut parola';

  @override
  String get newPasswordRequireText => 'Yeni parola gereklidir.';

  @override
  String get newPassword => 'Yeni parola';

  @override
  String get newPassword2RequireText => 'Yeni parola tekrarı gereklidir.';

  @override
  String get newPassword2 => 'Yeni parolayı onayla';

  @override
  String get passwordErrorNotification => 'Girilen parolalar aynı olmalıdır!';

  @override
  String get firstNameUpper => 'Ad';

  @override
  String get lastNameUpper => 'Soyad';

  @override
  String get profileSuccessNotification => 'Profil başarıyla güncellendi';

  @override
  String get passwordSuccessNotification => 'Parola başarıyla değiştirildi';

  @override
  String get notImplemented => 'Uygulanmadı!';

  @override
  String get listIsEmptyText => 'Liste şu anda boş.';

  @override
  String get tryAgain => 'Tekrar dene';

  @override
  String get verifyYourIdentity => 'Kimliğinizi doğrulayın';

  @override
  String get continueText => 'Devam et';

  @override
  String get resendCode => 'Kodu yeniden gönder';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time saniye',
      one: '1 saniye',
    );
    return 'Kodu $_temp0 sonra yeniden gönderebilirsiniz';
  }

  @override
  String get totpAuthDescription =>
      'Lütfen kimlik doğrulayıcı uygulamanızdaki güvenlik kodunu girin.';

  @override
  String smsAuthDescription(Object contact) {
    return '$contact numaralı telefonunuza bir güvenlik kodu gönderildi.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return '$contact e-posta adresinize bir güvenlik kodu gönderildi.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Lütfen yedek kodlarınızdan birini girin.';

  @override
  String get toptAuthPlaceholder => 'Kod';

  @override
  String get smsAuthPlaceholder => 'SMS kodu';

  @override
  String get emailAuthPlaceholder => 'E-posta kodu';

  @override
  String get backupCodeAuthPlaceholder => 'Yedek kod';

  @override
  String get verificationCodeIncorrect => 'Doğrulama kodu yanlış';

  @override
  String get verificationCodeManyRequest =>
      'Doğrulama kodu kontrolü için çok fazla istek';

  @override
  String get tryAnotherWay => 'Başka bir yol deneyin';

  @override
  String get selectWayToVerify => 'Doğrulama yöntemi seçin';

  @override
  String get mfaProviderTopt => 'Kimlik doğrulayıcı uygulama';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-posta';

  @override
  String get mfaProviderBackupCode => 'Yedek kod';

  @override
  String get newUserText => 'Yeni kullanıcı mısınız?';

  @override
  String get createAccount => 'Hesap oluştur';

  @override
  String get emailVerification => 'E-posta doğrulama';

  @override
  String get emailVerificationSentText =>
      'Belirtilen e-posta adresine doğrulama ayrıntılarını içeren bir e-posta gönderildi ';

  @override
  String get emailVerificationInstructionsText =>
      'Kayıt işleminizi tamamlamak için lütfen e-postadaki talimatları izleyin. Not: E-postayı bir süredir görmüyorsanız, lütfen \'spam\' klasörünüzü kontrol edin veya \'Yeniden Gönder\' düğmesine tıklayarak e-postayı yeniden göndermeyi deneyin.';

  @override
  String get resend => 'Yeniden Gönder';

  @override
  String get activatingAccount => 'Hesap aktifleştiriliyor...';

  @override
  String get accountActivated => 'Hesabınız başarıyla aktifleştirildi!';

  @override
  String get emailVerified => 'E-posta doğrulandı';

  @override
  String get activatingAccountText =>
      'Hesabınız şu anda aktifleştiriliyor.\nLütfen bekleyin...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Tebrikler!\n$appTitle hesabınız aktifleştirildi.\nArtık $appTitle alanınıza giriş yapabilirsiniz.';
  }

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get cancel => 'İptal';

  @override
  String get accept => 'Kabul et';

  @override
  String get termsOfUse => 'Kullanım Şartları';

  @override
  String get firstName => 'Ad';

  @override
  String get firstNameRequireText => 'Ad gereklidir.';

  @override
  String get lastName => 'Soyad';

  @override
  String get lastNameRequireText => 'Soyad gereklidir.';

  @override
  String get createPassword => 'Parola oluştur';

  @override
  String get repeatPassword => 'Parolanızı tekrar girin';

  @override
  String get imNotARobot => 'Ben robot değilim';

  @override
  String get signUp => 'Kayıt ol';

  @override
  String get alreadyHaveAnAccount => 'Zaten bir hesabınız var mı?';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get inactiveUserAlreadyExists =>
      'Aktif olmayan kullanıcı zaten mevcut';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Doğrulanmamış e-posta adresine sahip kayıtlı bir kullanıcı zaten var.\nDoğrulama e-postasını yeniden göndermek istiyorsanız \'Yeniden Gönder\' düğmesine tıklayın.';

  @override
  String get assignee => 'Atanan kişi';

  @override
  String get alarmTypes => 'Alarm türleri';

  @override
  String get details => 'Ayrıntılar';

  @override
  String get status => 'Durum';

  @override
  String get severity => 'Önem derecesi';

  @override
  String get originator => 'Başlatan';

  @override
  String get startTime => 'Başlangıç zamanı';

  @override
  String get duration => 'Süre';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value gün',
      one: '$value gün',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value saat',
      one: '$value saat',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dakika',
      one: '$value dakika',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value saniye',
      one: '$value saniye',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Panoyu görüntüle';

  @override
  String get activity => 'Aktivite';

  @override
  String get addCommentMessage => 'Yorum ekle...';

  @override
  String get selectUser => 'Kullanıcıları seç';

  @override
  String get assignedToMe => 'Bana atanan';

  @override
  String get clear => 'Temizle';

  @override
  String get acknowledge => 'Onayla';

  @override
  String get edit => 'Düzenle';

  @override
  String get editProfile => 'Profili düzenle';

  @override
  String get delete => 'Sil';

  @override
  String get edited => 'Düzenlendi';

  @override
  String get deleteComment => 'Yorumu sil';

  @override
  String get areYouSure => 'Emin misiniz?';

  @override
  String get noResultsFound => 'Sonuç bulunamadı';

  @override
  String get tryRefiningYourQuery => 'Lütfen sorgunuzu daraltmayı deneyin';

  @override
  String get failedToLoadTheList => 'Liste yüklenemedi';

  @override
  String get tryRefreshing => 'Lütfen yenilemeyi deneyin';

  @override
  String get refresh => 'Yenile';

  @override
  String get users => 'Kullanıcılar';

  @override
  String get unassigned => 'Atanmamış';

  @override
  String get failedToLoadAlarmDetails => 'Alarm ayrıntıları yüklenemedi';

  @override
  String get somethingWentWrong => 'Bir şeyler ters gitti';

  @override
  String get chooseRegion => 'Bölge seçin';

  @override
  String get selectRegion => 'Bölge seçin';

  @override
  String get northAmerica => 'Kuzey Amerika';

  @override
  String get europe => 'Avrupa';

  @override
  String get northAmericaRegionShort => 'K. Virginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Cihaz listesi';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Panolar',
      one: 'Pano',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Güncelleme gerekli';

  @override
  String updateTo(Object version) {
    return '$version sürümüne güncelle';
  }

  @override
  String get next => 'İleri';

  @override
  String get confirmation => 'Onay';

  @override
  String get wifiPassword => 'Wi-Fi parolası';

  @override
  String wifiHelpMessage(Object deviceName) {
    return '$deviceName cihazınızın kurulumuna devam etmek için lütfen ağ kimlik bilgilerinizi girin.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '$network ağı için parolayı girin';
  }

  @override
  String get deviceNotFoundMessage =>
      'Cihaz bulunamadı. Lütfen telefonunuzun Bluetooth özelliğinin açık olduğundan ve yeni cihazınızın kapsama alanı içinde olduğundan emin olun.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Devam etmek için \"$permissions\" izinleri yeterli değil. Lütfen gerekli izinleri verin ve \"Tekrar dene\" seçeneğine dokunun.';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi kimlik bilgileri gönderiliyor';

  @override
  String get confirmingWifiConnection => 'Wi-Fi bağlantısı doğrulanıyor';

  @override
  String get provisionedSuccessfully => 'Cihaz başarıyla sağlandı';

  @override
  String get returnToDashboard => 'Panoya dön';

  @override
  String cannotEstablishSession(Object deviceName) {
    return '$deviceName adlı cihaz ile oturum kurulamıyor. Lütfen tekrar deneyin';
  }

  @override
  String get claimingDevice => 'Cihaz talep ediliyor';

  @override
  String get claimingDeviceDone => 'Cihaz talebi tamamlandı';

  @override
  String get claimingMessageSuccess => 'Cihaz başarıyla\ntalep edildi';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Devam etmek için \"$permissions\" izinleri yeterli değil. Lütfen uygulama ayarlarını açın, izinleri verin ve \"Tekrar dene\" seçeneğine dokunun.';
  }

  @override
  String get scanACode => 'Kod tarayın';

  @override
  String get allowAccess => 'Erişime izin ver';

  @override
  String get toggleCamera => 'Kamerayı değiştir';

  @override
  String get toggleFlash => 'Flaşı aç/kapat';

  @override
  String get unableToUseCamera => 'Kamera kullanılamıyor';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Devam etmek için ayarları açın ve kameraya erişim izni verin';

  @override
  String get notFound => 'Bulunamadı';

  @override
  String routeNotDefined(Object name) {
    return 'Rota tanımlı değil: $name';
  }

  @override
  String get loginWith => 'Şununla oturum aç';

  @override
  String get scanQrCode => 'QR kodu tara';

  @override
  String get anEmptyRequestDataReceived => 'Boş istek verisi alındı.';

  @override
  String get somethingWentWrongRollback =>
      'Bir şeyler ters gitti ... Geri alınıyor';

  @override
  String get searchResults => 'Arama sonuçları';

  @override
  String get viewAll => 'Tümünü görüntüle';

  @override
  String get requestedEntityDoesNotExists => 'İstenen öğe mevcut değil.';

  @override
  String get noAlarmsFound => 'Alarm bulunamadı';

  @override
  String get filters => 'Filtreler';

  @override
  String get alarmStatusList => 'Alarm durumu listesi';

  @override
  String get alarmSeverityList => 'Alarm önem derecesi listesi';

  @override
  String get cleared => 'Temizlendi';

  @override
  String get acknowledged => 'Onaylandı';

  @override
  String get unacknowledged => 'Onaylanmadı';

  @override
  String get critical => 'Kritik';

  @override
  String get major => 'Majör';

  @override
  String get minor => 'Minör';

  @override
  String get warning => 'Uyarı';

  @override
  String get indeterminate => 'Belirsiz';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kullanıcı ara',
      one: 'Kullanıcı ara',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Sıfırla';

  @override
  String get update => 'Güncelle';

  @override
  String get alarmTypeList => 'Alarm türü listesi';

  @override
  String get anyType => 'Herhangi bir tür';

  @override
  String get plusAlarmType => '+ Alarm türü';

  @override
  String get all => 'Tümü';

  @override
  String get allNotifications => 'Tümü';

  @override
  String get unread => 'Okunmamış';

  @override
  String get close => 'Kapat';

  @override
  String get codeVerificationFailed => 'Kod doğrulama başarısız!';

  @override
  String get fatalError => 'Kritik hata';

  @override
  String get unknownError => 'Bilinmeyen hata.';

  @override
  String get sessionExpired => 'Oturum süresi doldu';

  @override
  String get fatalApplicationErrorOccurred => 'Kritik uygulama hatası oluştu:';

  @override
  String get connectionError => 'Bağlantı hatası';

  @override
  String get failedToConnectToServer => 'Sunucuya bağlanılamadı';

  @override
  String get retry => 'Yeniden dene';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobil pano cihaz profilinde yapılandırılmalıdır!';

  @override
  String get openWifiSettings => 'Wi-Fi ayarlarını aç';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Normalde kullandığınız Wi-Fi ağına bağlanın';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Uygulamaya dönün ve Hazır düğmesine dokunun';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Telefonunuzu olağan Wi-Fi ağınıza yeniden bağlamak için\nsonraki adımları izleyin';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Anlık bildirimler yapılandırılmamış.\nLütfen sistem yöneticinizle iletişime geçin.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase yapılandırılmamış.\n Bunun nasıl yapılacağı hakkında yönlendirme için\n lütfen resmi Firebase belgelerine bakın.';

  @override
  String get markAllAsRead => 'Tümünü okundu olarak işaretle';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'URL açılamıyor: $link';
  }

  @override
  String get noDashboardsFound => 'Pano bulunamadı';

  @override
  String get openAppSettings => 'Uygulama ayarlarını aç';

  @override
  String get connectingToDevice => 'Cihaza bağlanılıyor';

  @override
  String get connectToDevice => 'Cihaza bağlan';

  @override
  String get selectWifiNetwork => 'Wi-Fi ağı seçin';

  @override
  String get deviceProvisioning => 'Cihaz sağlama';

  @override
  String get permissions => 'İzinler';

  @override
  String get unableConnectToDevice => 'Cihaza bağlanılamıyor';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Cihaz yakınlarda Wi-Fi ağı bulamıyor';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '$name Wi-Fi ağına bağlantı başarısız oldu.\nLütfen telefonunuzun cihazın Wi-Fi ağına bağlı olduğundan ve bu uygulama için telefonunuzun ayarlarında Yerel Ağ erişiminin etkin olduğundan emin olun.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return '$name cihazı ağları bulamadığı için Wi-Fi\'ye bağlanılamıyor';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Telefonunuzu cihaza bağlamak için lütfen sonraki adımları izleyin';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '$wifiName benzeri bir Wi-Fi ağına bağlanın';
  }

  @override
  String get ready => 'Hazır';

  @override
  String get exitDeviceProvisioning => 'Cihaz sağlama işleminden çık';

  @override
  String get noNotificationsFound => 'Bildirim bulunamadı';

  @override
  String get markAsRead => 'Okundu olarak işaretle';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Lütfen cihazınızdaki QR kodunu tarayın';

  @override
  String get search => 'Ara';

  @override
  String get tenant => 'Kiracı';

  @override
  String get tenantProfile => 'Kiracı profili';

  @override
  String get user => 'Kullanıcı';

  @override
  String get asset => 'Varlık';

  @override
  String get deviceProfile => 'Cihaz profili';

  @override
  String get assetProfile => 'Varlık profili';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmlar',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Kural zinciri';

  @override
  String get ruleNode => 'Kural düğümü';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Öğe görünümü';

  @override
  String get widgetsBundle => 'Widget paketi';

  @override
  String get widgetType => 'Widget türü';

  @override
  String get apiUsageState => 'API Kullanım Durumu';

  @override
  String get tbResource => 'Kaynak';

  @override
  String get otaPackage => 'OTA paketi';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Kuyruk';

  @override
  String get notificationTarget => 'Bildirim alıcısı';

  @override
  String get notificationTemplate => 'Bildirim şablonu';

  @override
  String get notificationRequest => 'Bildirim isteği';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bildirimler',
      one: 'Bildirim',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Bildirim kuralı';

  @override
  String get entityGroup => 'Öğe Grubu';

  @override
  String get converter => 'Dönüştürücü';

  @override
  String get integration => 'Entegrasyon';

  @override
  String get schedulerEvent => 'Zamanlayıcı Olayı';

  @override
  String get blobEntity => 'Blob Öğesi';

  @override
  String get role => 'Rol';

  @override
  String get groupPermission => 'Grup İzni';

  @override
  String get actionStatusSuccess => 'Başarılı';

  @override
  String get actionStatusFailure => 'Başarısız';

  @override
  String get actionTypeAdded => 'Eklendi';

  @override
  String get actionTypeDeleted => 'Silindi';

  @override
  String get actionTypeUpdated => 'Güncellendi';

  @override
  String get actionTypeAttributesUpdated => 'Öznitelikler Güncellendi';

  @override
  String get actionTypeAttributesDeleted => 'Öznitelikler Silindi';

  @override
  String get actionTypeRpcCall => 'RPC Çağrısı';

  @override
  String get actionTypeCredentialsUpdated => 'Kimlik Bilgileri Güncellendi';

  @override
  String get actionTypeAssignedToCustomer => 'Müşteriye atandı';

  @override
  String get actionTypeUnassignedFromCustomer =>
      'Müşteriden ataması kaldırıldı';

  @override
  String get actionTypeActivated => 'Etkinleştirildi';

  @override
  String get actionTypeSuspended => 'Askıya alındı';

  @override
  String get actionTypeCredentialsRead => 'Kimlik bilgileri okundu';

  @override
  String get actionTypeAttributesRead => 'Öznitelikler okundu';

  @override
  String get actionTypeRelationAddOrUpdate => 'İlişki güncellendi';

  @override
  String get actionTypeRelationDeleted => 'İlişki silindi';

  @override
  String get actionTypeRelationsDeleted => 'Tüm ilişkiler silindi';

  @override
  String get actionTypeAlarmAck => 'Onaylandı';

  @override
  String get actionTypeAlarmClear => 'Temizlendi';

  @override
  String get actionTypeAlarmDelete => 'Alarm silindi';

  @override
  String get actionTypeAlarmAssigned => 'Alarm Atandı';

  @override
  String get actionTypeAlarmUnassigned => 'Alarm ataması kaldırıldı';

  @override
  String get actionTypeLogin => 'Giriş';

  @override
  String get actionTypeLogout => 'Çıkış';

  @override
  String get actionTypeLockout => 'Kilitleme';

  @override
  String get actionTypeAssignedFromTenant => 'Kiracıdan atandı';

  @override
  String get actionTypeAssignedToTenant => 'Kiracıya atandı';

  @override
  String get actionTypeProvisionSuccess => 'Cihaz sağlandı';

  @override
  String get actionTypeProvisionFailure =>
      'Cihaz sağlama işlemi başarısız oldu';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetri güncellendi';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetri silindi';

  @override
  String get actionTypeAssignedToEdge => 'Edge\'e atandı';

  @override
  String get actionTypeUnassignedFromEdge => 'Edge\'den ataması kaldırıldı';

  @override
  String get actionTypeAddedComment => 'Yorum eklendi';

  @override
  String get actionTypeUpdatedComment => 'Yorum güncellendi';

  @override
  String get actionTypeDeletedComment => 'Yorum silindi';

  @override
  String get actionTypeSmsSent => 'SMS gönderildi';

  @override
  String get actionTypeAddedToEntityGroup => 'Öğe Grubuna Eklendi';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Öğe Grubundan Kaldırıldı';

  @override
  String get actionTypeRestApiRuleEngineCall => 'Kural motoru REST API çağrısı';

  @override
  String get actionTypeMadePublic => 'Herkese açık yapıldı';

  @override
  String get actionTypeMadePrivate => 'Özel yapıldı';

  @override
  String get actionTypeChangeOwner => 'Sahip değiştirildi';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Bu işlemi gerçekleştirmek için izniniz yok!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Bu işlemi tamamlamak için izinleriniz yeterli görünmüyor';

  @override
  String get isRequiredText => 'gereklidir.';

  @override
  String get no2faProvidersFound => '2FA sağlayıcısı bulunamadı';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Lütfen sistem yöneticinizle iletişime geçin';

  @override
  String errorOccured(Object e) {
    return 'Hata oluştu: $e';
  }

  @override
  String get unsavedChanges => 'Kaydedilmemiş değişiklikler';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Kaydedilmemiş değişiklikleriniz var. Bu sayfadan ayrılmak istediğinizden emin misiniz?';

  @override
  String get deleteAccount => 'Hesabı sil';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Emin misiniz? $authority hesabınızı silmek üzeresiniz.';
  }

  @override
  String get language => 'Dil';

  @override
  String get metricUnitSystem => 'Metrik';

  @override
  String get imperialUnitSystem => 'İngiliz ölçü sistemi';

  @override
  String get hybridUnitSystem => 'Hibrit';

  @override
  String get autoUnitSystem => 'Otomatik';

  @override
  String get languageAuto => 'Otomatik';

  @override
  String get unitSystem => 'Birim sistemi';

  @override
  String get selectCountry => 'Ülke seçin';

  @override
  String get hideHomeDashboardToolbar => 'Ana pano araç çubuğunu gizle';

  @override
  String get phoneNumberHelperText =>
      'E.164 formatında telefon numarası, ör. +1201550123';

  @override
  String get homeDashboard => 'Ana pano';

  @override
  String get security => 'Güvenlik';

  @override
  String get twofactorAuthentication => 'İki faktörlü kimlik doğrulama';

  @override
  String get verificationRequired => 'Doğrulama gerekli';

  @override
  String get twofactorAuthenticationIsRequired =>
      'İki faktörlü kimlik doğrulama gereklidir';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Oturum açmaya devam etmek için bir doğrulama yöntemi ayarlayın';

  @override
  String get setUpAVerificationMethod => 'Bir doğrulama yöntemi ayarlayın';

  @override
  String get totpSetupSuccessDescription =>
      'Bir dahaki sefere giriş yaptığınızda, iki faktörlü kimlik doğrulama kodu girmeniz gerekecek';

  @override
  String get smsSetupSuccessDescription =>
      'Bir dahaki sefere giriş yaptığınızda, telefon numarasına gönderilecek güvenlik kodunu girmeniz istenecektir';

  @override
  String get emailSetupSuccessDescription =>
      'Bir dahaki sefere giriş yaptığınızda, e-posta adresinize gönderilecek güvenlik kodunu girmeniz istenecektir';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Bir dahaki sefere giriş yaptığınızda, iki faktörlü kimlik doğrulamayı geçmek için yedek kodları kullanabileceksiniz';

  @override
  String get loginToApp => 'Uygulamaya giriş yap';

  @override
  String get goBack => 'Geri dön';

  @override
  String get done => 'Tamam';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Bu, hesabınızın güvenliğini azaltacaktır';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '$providerName sağlayıcısını devre dışı bırakmak istediğinizden emin misiniz?';
  }

  @override
  String get yesDeactivate => 'Evet, devre dışı bırak';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Kimlik doğrulayıcı olarak kullanılacak bir e-posta girin.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Kimlik doğrulayıcı olarak kullanılacak bir telefon numarası girin';

  @override
  String get sendCode => 'Kodu gönder';

  @override
  String errorSendingCode(String error) {
    return 'Kod gönderilirken hata: $error';
  }

  @override
  String get copy => 'Kopyala';

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get enter6digitsKeyFromYourAppHere => '6 haneli kodu buraya girin';

  @override
  String digitsCode(int count) {
    return '$count haneli kod';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '32 karakterli anahtarı kimlik doğrulayıcı uygulamanıza kopyalayın veya aşağıdaki QR kodunu tarayın';

  @override
  String get applyChanges => 'Değişiklikleri uygula';

  @override
  String get discardChanges => 'Değişiklikleri at';

  @override
  String get yesDiscard => 'Evet, at';

  @override
  String get thisActionCannotBeUndone => 'Bu işlem geri alınamaz';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'İki faktörlü kimlik doğrulama, hesabınızı yetkisiz erişime karşı korur. Tek yapmanız gereken giriş yaparken bir güvenlik kodu girmektir.';

  @override
  String get calculatedField => 'Hesaplanmış alan';

  @override
  String get apiKey => 'API anahtarı';

  @override
  String get aiModel => 'Yapay zeka modeli';

  @override
  String get adminSettings => 'Yönetici ayarları';

  @override
  String get job => 'Görev';

  @override
  String get mobileAppBundle => 'Mobil paket';

  @override
  String get mobileApp => 'Mobil uygulama';

  @override
  String get domain => 'Alan adı';

  @override
  String get oauth2Client => 'OAuth 2.0 istemcisi';

  @override
  String get queueStats => 'Kuyruk istatistikleri';

  @override
  String get phoneIsRequired => 'Telefon gereklidir.';

  @override
  String get phoneIsInvalid => 'Telefon geçersiz.';

  @override
  String get addVerificationMethod => 'Doğrulama yöntemi ekle';

  @override
  String get imageSavedToGallery =>
      'Platformun \'Görsel Galerisi\'ne kaydedildi';

  @override
  String get failedToSaveImage => 'Görsel kaydedilemedi';

  @override
  String nSelected(int count) {
    return '$count seçildi';
  }

  @override
  String get selectAll => 'Yüklenenlerin tümünü seç';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count işlem başarısız oldu',
      one: '1 işlem başarısız oldu',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildirim silinsin mi?',
      one: '1 bildirim silinsin mi?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildirim okundu olarak işaretlensin mi?',
      one: '1 bildirim okundu olarak işaretlensin mi?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return '$host sunucunuzdan veriler alınıyor';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return '$host sunucusunda oturumunuz açılıyor';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Yeni $host sunucusuna geçiliyor';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '$host sunucusundan oturum açma belirteci alınamadı. Lütfen yeni bir QR kod tarayın.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '$host sunucusuna bağlanılamadı';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host bir ThingsBoard sunucusu değil';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QR kod oturumu artık geçerli değil. Lütfen QR kodu yenileyip yeniden tarayın.';

  @override
  String get openThisLinkTitle => 'Bu bağlantı açılsın mı?';

  @override
  String get linkOpensSignInPage =>
      'Bu bağlantı, bu sunucunun oturum açma sayfasını açar. Mevcut sunucunuzdaki oturumunuz kapatılacaktır.';

  @override
  String get linkOpensSignInPageOnly =>
      'Bu bağlantı, bu sunucunun oturum açma sayfasını açar.';

  @override
  String linkSignsInAs(Object email) {
    return 'Bu bağlantı, bu sunucuda sizi $email olarak oturum açtırır.';
  }

  @override
  String get linkSignsIn => 'Bu bağlantı, bu sunucuda oturumunuzu açar.';

  @override
  String get serverConnectionNotSecure =>
      'Bu sunucu güvenli bağlantı kullanmıyor.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Bu uygulama yalnızca kendi sunucusuyla çalışır ve bu bağlantıyı açamaz.';

  @override
  String get liveTrackingActive => 'Canlı konum takibi';

  @override
  String get liveTrackingPaused => 'Canlı takip duraklatıldı';

  @override
  String get liveTrackingFixes => 'Alınan konumlar';

  @override
  String get liveTrackingSaved => 'Kaydedildi';

  @override
  String get liveTrackingErrors => 'Hatalar';

  @override
  String get liveTrackingStop => 'Durdur';

  @override
  String get liveTrackingPause => 'Duraklat';

  @override
  String get liveTrackingResume => 'Devam et';

  @override
  String get liveTrackingHide => 'Gizle';

  @override
  String get liveTrackingSessionTitle => 'Canlı konum takibi';

  @override
  String get liveTrackingTarget => 'Konumu öğeye kaydet';

  @override
  String get liveTrackingDashboard => 'Pano';

  @override
  String get liveTrackingStatus => 'Durum';

  @override
  String get liveTrackingStarted => 'Başlangıç zamanı';

  @override
  String get liveTrackingLastFix => 'Son konum';

  @override
  String get liveTrackingLastError => 'Son hata';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Bu öğeye kaydedilemiyor — artık mevcut değil. Takip devam ediyor; hedefi pano eyleminde güncelleyin.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Sunucuya bağlantı yok. Bu konumlar kaydedilmedi — çevrimiçi olduğunuzda kaydetme devam eder.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Oturumunuz sona erdi. Konumu kaydetmeye devam etmek için tekrar oturum açın.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Bu öğeye kaydedilemiyor — izniniz yok. Takip devam ediyor; erişim için yöneticinize başvurun.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Bu konum sunucuya kaydedilemedi. Kaydetme bir sonraki konumda yeniden denenir.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Konum hizmetleri bu cihazda kapalı.';

  @override
  String get liveTrackingErrorPermissionDenied => 'Konum izni reddedildi.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Konum izni kalıcı olarak reddedildi. Uygulama ayarlarından etkinleştirin.';

  @override
  String get liveTrackingErrorLocation => 'Konum alınamadı.';

  @override
  String get liveTrackingMenuTitle => 'Canlı konum takibi';

  @override
  String get liveTrackingNoRecord => 'Aktif takip ve yakın zamanlı oturum yok.';

  @override
  String get liveTrackingLastSession => 'Son oturum';

  @override
  String get liveTrackingStartAgain => 'Yeniden başlat';

  @override
  String get liveTrackingEnded => 'Bitiş zamanı';

  @override
  String get liveTrackingEndReason => 'Bitiş nedeni';

  @override
  String get liveTrackingEndReasonManual => 'Elle durduruldu';

  @override
  String get liveTrackingEndReasonMaxDuration => 'Maksimum süreye ulaşıldı';

  @override
  String get liveTrackingEndReasonInterrupted => 'Kesintiye uğradı';

  @override
  String get serverUpdateRequired => 'Sunucu güncellemesi gerekli';

  @override
  String get backToLogin => 'Girişe dön';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Bu uygulama ThingsBoard $minVersion veya üzeri ile çalışır.';
  }

  @override
  String get serverLabel => 'Sunucu';

  @override
  String get versionLabel => 'Sürüm';

  @override
  String get askAdminToUpdateServer =>
      'Sunucuyu güncellemesi için sunucu yöneticinize başvurun.';

  @override
  String get deviceClaimFailed =>
      'Cihaz talep edilemedi. Lütfen tekrar deneyin.';

  @override
  String get deviceToClaimNotFound =>
      'Cihaz bulunamadı. Lütfen cihaz sağlayıcısıyla iletişime geçin.';

  @override
  String get enableAuthenticatorApp =>
      'Kimlik doğrulayıcı uygulamasını etkinleştir';

  @override
  String get enableSmsAuthenticator => 'SMS kimlik doğrulayıcıyı etkinleştir';

  @override
  String get enableEmailAuthenticator =>
      'E-posta kimlik doğrulayıcıyı etkinleştir';

  @override
  String get getBackupCode => 'Yedek kodu al';

  @override
  String get twoFaTotpDescription =>
      'Google Authenticator, Authy veya Duo gibi uygulamaları telefonunuzda kullanarak kimlik doğrulama yapın. Giriş yapmak için bir güvenlik kodu üretir.';

  @override
  String get twoFaSmsDescription =>
      'Kimlik doğrulamak için telefonunuzu kullanın. Giriş yaptığınızda size SMS ile bir güvenlik kodu göndereceğiz.';

  @override
  String get twoFaEmailDescription =>
      'Kimlik doğrulamak için e-posta adresinize gönderilen bir güvenlik kodunu kullanın.';

  @override
  String get twoFaBackupCodeDescription =>
      'Bu yazdırılabilir tek kullanımlık kodlar, seyahatteyken veya telefonunuza erişiminiz olmadığında oturum açmanıza olanak tanır.';

  @override
  String get openInAuthenticatorApp => 'Kimlik doğrulayıcı uygulamada aç';

  @override
  String get noAuthenticatorAppFound =>
      'Kimlik doğrulayıcı uygulama bulunamadı. Bunun yerine anahtarı uygulamanıza kopyalayın.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider etkin';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Yöneticiniz $email için iki faktörlü kimlik doğrulama gerektiriyor.';
  }

  @override
  String get recommended => 'Önerilen';

  @override
  String get addBackupCodesHint =>
      'Telefonunuzu kaybetmeniz durumunda da oturum açabilmek için yedek kodlar da ekleyin.';

  @override
  String get totpSecretKey => 'Gizli anahtar';

  @override
  String get backupCodesDescription =>
      'Kodları yazdırın; böylece hesabınıza giriş yapmanız gerektiğinde elinizin altında olur. Her yedek kod yalnızca bir kez kullanılabilir.';

  @override
  String get backupCodesWarning =>
      'Bu sayfadan ayrıldığınızda, bu kodlar tekrar gösterilemez. Aşağıdaki seçenekleri kullanarak güvenli bir şekilde saklayın.';

  @override
  String get downloadTxt => 'İndir (txt)';
}
