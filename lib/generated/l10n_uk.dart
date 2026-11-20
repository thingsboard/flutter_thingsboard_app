// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class SUk extends S {
  SUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Головна';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Пристрої',
      one: 'Пристрій',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Більше';

  @override
  String get customers => 'Клієнти';

  @override
  String get assets => 'Активи';

  @override
  String get tenants => 'Орендарі';

  @override
  String get auditLogs => 'Журнали аудиту';

  @override
  String get noCustomersFound => 'Клієнтів не знайдено';

  @override
  String get noAssetsFound => 'Активів не знайдено';

  @override
  String get noTenantsFound => 'Орендарів не знайдено';

  @override
  String get noDevicesFound => 'Пристроїв не знайдено';

  @override
  String get noAuditLogsFound => 'Журналів аудиту не знайдено';

  @override
  String get logout => 'Вийти';

  @override
  String get login => 'Увійти';

  @override
  String get loginToYourAccount => 'Вхід в обліковий запис';

  @override
  String get email => 'Email';

  @override
  String get emailInvalidText => 'Некоректний формат email.';

  @override
  String get username => 'ім’я користувача';

  @override
  String get password => 'Пароль';

  @override
  String get passwordForgotText => 'Забули пароль?';

  @override
  String get passwordReset => 'Скинути пароль';

  @override
  String get passwordResetText =>
      'Введіть email, пов’язаний з вашим обліковим записом, і ми надішлемо посилання для скидання пароля';

  @override
  String get requestPasswordReset => 'Запросити скидання пароля';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Посилання для підтвердження Email успішно надіслано!';

  @override
  String get or => 'або';

  @override
  String get no => 'Ні';

  @override
  String get yes => 'Так';

  @override
  String get title => 'Заголовок';

  @override
  String get country => 'Країна';

  @override
  String get city => 'Місто';

  @override
  String get stateOrProvince => 'Регіон / Провінція';

  @override
  String get postalCode => 'Zip / Поштовий індекс';

  @override
  String get address => 'Адреса';

  @override
  String get address2 => 'Адреса 2';

  @override
  String get phone => 'Телефон';

  @override
  String get alarmClearTitle => 'Зняти тривогу';

  @override
  String get alarmClearText => 'Ви впевнені, що хочете зняти тривогу?';

  @override
  String get alarmAcknowledgeTitle => 'Підтвердити тривогу';

  @override
  String get alarmAcknowledgeText =>
      'Ви впевнені, що хочете підтвердити тривогу?';

  @override
  String get assetName => 'Назва активу';

  @override
  String get type => 'Тип';

  @override
  String get label => 'Маркування';

  @override
  String get auditLogDetails => 'Деталі журналу аудиту';

  @override
  String get customerDetails => 'Деталі клієнта';

  @override
  String get assetDetails => 'Деталі активу';

  @override
  String get tenantDetails => 'Деталі орендаря';

  @override
  String get entityType => 'Тип сутності';

  @override
  String get actionData => 'Дані дії';

  @override
  String get failureDetails => 'Деталі помилки';

  @override
  String get allDevices => 'Усі пристрої';

  @override
  String get active => 'Активний';

  @override
  String get inactive => 'Неактивний';

  @override
  String get deviceActive => 'Активний';

  @override
  String get deviceInactive => 'Неактивний';

  @override
  String get activeDevices => 'Активні';

  @override
  String get inactiveDevices => 'Неактивні';

  @override
  String get alarmStatusActiveAcknowledged => 'Активна підтверджена';

  @override
  String get alarmStatusActiveUnacknowledged => 'Активна непідтверджена';

  @override
  String get alarmStatusClearedAcknowledged => 'Знята підтверджена';

  @override
  String get alarmStatusClearedUnacknowledged => 'Знята непідтверджена';

  @override
  String get alarmStatusFilterActive => 'Активна';

  @override
  String get systemAdministrator => 'Системний адміністратор';

  @override
  String get tenantAdministrator => 'Адміністратор орендаря';

  @override
  String get customer => 'Клієнт';

  @override
  String get changePassword => 'Змінити пароль';

  @override
  String get currentPasswordRequireText => 'Потрібно вказати поточний пароль.';

  @override
  String get currentPassword => 'Поточний пароль';

  @override
  String get newPasswordRequireText => 'Потрібно вказати новий пароль.';

  @override
  String get newPassword => 'Новий пароль';

  @override
  String get newPassword2RequireText =>
      'Потрібно повторно вказати новий пароль.';

  @override
  String get newPassword2 => 'Підтвердити новий пароль';

  @override
  String get passwordErrorNotification => 'Введені паролі мають збігатися!';

  @override
  String get profileSuccessNotification => 'Профіль успішно оновлено';

  @override
  String get passwordSuccessNotification => 'Пароль успішно змінено';

  @override
  String get notImplemented => 'Не реалізовано!';

  @override
  String get listIsEmptyText => 'Список наразі порожній.';

  @override
  String get tryAgain => 'Спробувати ще раз';

  @override
  String get verifyYourIdentity => 'Підтвердити вашу особу';

  @override
  String get continueText => 'Продовжити';

  @override
  String get resendCode => 'Повторно надіслати код';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time секунди',
      many: '$time секунд',
      one: '$time секунду',
    );
    return 'Повторно надіслати код через $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Будь ласка, введіть код безпеки з вашого застосунку автентифікації.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Код безпеки було надіслано на ваш телефон: $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Код безпеки було надіслано на вашу адресу email: $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Будь ласка, введіть один із ваших резервних кодів.';

  @override
  String get toptAuthPlaceholder => 'Код';

  @override
  String get smsAuthPlaceholder => 'SMS код';

  @override
  String get emailAuthPlaceholder => 'Email код';

  @override
  String get backupCodeAuthPlaceholder => 'Резервний код';

  @override
  String get verificationCodeIncorrect => 'Код підтвердження неправильний';

  @override
  String get verificationCodeManyRequest =>
      'Забагато запитів на перевірку коду підтвердження';

  @override
  String get tryAnotherWay => 'Спробувати інший спосіб';

  @override
  String get selectWayToVerify => 'Виберіть спосіб підтвердження';

  @override
  String get mfaProviderTopt => 'Застосунок автентифікації';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Резервний код';

  @override
  String get newUserText => 'Новий користувач?';

  @override
  String get createAccount => 'Створити обліковий запис';

  @override
  String get emailVerification => 'Підтвердження Email';

  @override
  String get emailVerificationSentText =>
      'Лист із деталями підтвердження надіслано на вказану адресу email ';

  @override
  String get emailVerificationInstructionsText =>
      'Будь ласка, дотримуйтесь інструкцій у листі, щоб завершити процедуру реєстрації. Примітка: якщо ви деякий час не бачите листа, перевірте папку «Спам» або спробуйте надіслати лист повторно, натиснувши кнопку «Надіслати повторно».';

  @override
  String get resend => 'Надіслати повторно';

  @override
  String get activatingAccount => 'Активація облікового запису...';

  @override
  String get accountActivated => 'Обліковий запис успішно активовано!';

  @override
  String get emailVerified => 'Email підтверджено';

  @override
  String get activatingAccountText =>
      'Ваш обліковий запис наразі активується.\nБудь ласка, зачекайте...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Вітаємо!\nВаш обліковий запис $appTitle активовано.\nТепер ви можете увійти у свій простір $appTitle.';
  }

  @override
  String get privacyPolicy => 'Політика конфіденційності';

  @override
  String get cancel => 'Скасувати';

  @override
  String get accept => 'Прийняти';

  @override
  String get termsOfUse => 'Умови використання';

  @override
  String get firstName => 'Ім’я';

  @override
  String get lastName => 'Прізвище';

  @override
  String get imNotARobot => 'Я не робот';

  @override
  String get signUp => 'Зареєструватися';

  @override
  String get alreadyHaveAnAccount => 'Вже маєте обліковий запис?';

  @override
  String get signIn => 'Увійти';

  @override
  String get inactiveUserAlreadyExists => 'Неактивний користувач уже існує';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Вже існує зареєстрований користувач із непідтвердженою адресою email.\nНатисніть кнопку «Надіслати повторно», якщо хочете повторно надіслати лист для підтвердження.';

  @override
  String get assignee => 'Призначений';

  @override
  String get alarmTypes => 'Типи тривог';

  @override
  String get details => 'Деталі';

  @override
  String get status => 'Статус';

  @override
  String get severity => 'Серйозність';

  @override
  String get originator => 'Ініціатор';

  @override
  String get startTime => 'Час початку';

  @override
  String get duration => 'Тривалість';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value дня',
      many: '$value днів',
      few: '$value дні',
      one: '$value день',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value години',
      many: '$value годин',
      one: '$value година',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value хвилини',
      many: '$value хвилин',
      one: '$value хвилина',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value секунди',
      many: '$value секунд',
      one: '$value секунда',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Переглянути дашборд';

  @override
  String get activity => 'Активність';

  @override
  String get addCommentMessage => 'Додати коментар...';

  @override
  String get clear => 'Зняти';

  @override
  String get acknowledge => 'Підтвердити';

  @override
  String get edit => 'Редагувати';

  @override
  String get editProfile => 'Редагувати профіль';

  @override
  String get delete => 'Видалити';

  @override
  String get edited => 'Відредаговано';

  @override
  String get deleteComment => 'Видалити коментар';

  @override
  String get areYouSure => 'Ви впевнені?';

  @override
  String get noResultsFound => 'Нічого не знайдено';

  @override
  String get tryRefiningYourQuery => 'Спробуйте уточнити запит';

  @override
  String get failedToLoadTheList => 'Не вдалося завантажити список';

  @override
  String get tryRefreshing => 'Спробуйте оновити';

  @override
  String get refresh => 'Оновити';

  @override
  String get users => 'Користувачі';

  @override
  String get unassigned => 'Не призначено';

  @override
  String get failedToLoadAlarmDetails =>
      'Не вдалося завантажити деталі тривоги';

  @override
  String get somethingWentWrong => 'Щось пішло не так';

  @override
  String get chooseRegion => 'Оберіть регіон';

  @override
  String get regions => 'Регіони';

  @override
  String get selectRegion => 'Виберіть регіон';

  @override
  String get northAmerica => 'Північна Америка';

  @override
  String get europe => 'Європа';

  @override
  String get northAmericaRegionShort => 'Пн. Вірджинія';

  @override
  String get europeRegionShort => 'Франкфурт';

  @override
  String get deviceList => 'Список пристроїв';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Дашборди',
      one: 'Дашборд',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Потрібне оновлення';

  @override
  String updateTo(Object version) {
    return 'Оновити до $version';
  }

  @override
  String get next => 'Далі';

  @override
  String get confirmation => 'Підтвердження';

  @override
  String get wifiPassword => 'Пароль Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Щоб продовжити налаштування пристрою $deviceName, вкажіть облікові дані вашої мережі.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Введіть пароль для $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Недостатньо дозволів для «$permissions», щоб продовжити. Надайте потрібні дозволи та натисніть «Спробувати ще раз».';
  }

  @override
  String get sendingWifiCredentials => 'Надсилання облікових даних Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Підтвердження підключення Wi-Fi';

  @override
  String get provisionedSuccessfully => 'Пристрій успішно підготовлено';

  @override
  String get returnToDashboard => 'Повернутися до дашборду';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Не вдалося встановити сеанс із пристроєм $deviceName. Спробуйте ще раз';
  }

  @override
  String get claimingDevice => 'Прив’язування пристрою';

  @override
  String get claimingMessageSuccess => 'Пристрій\nуспішно прив’язано';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Недостатньо дозволів для «$permissions», щоб продовжити. Відкрийте налаштування застосунку, надайте дозволи й натисніть «Спробувати ще раз».';
  }

  @override
  String get scanACode => 'Сканувати код';

  @override
  String get allowAccess => 'Дозволити доступ';

  @override
  String get toggleCamera => 'Перемкнути камеру';

  @override
  String get toggleFlash => 'Перемкнути спалах';

  @override
  String get unableToUseCamera => 'Не вдалося використати камеру';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Відкрийте налаштування та надайте доступ до камери, щоб продовжити';

  @override
  String get notFound => 'Не знайдено';

  @override
  String routeNotDefined(Object name) {
    return 'Маршрут не визначено: $name';
  }

  @override
  String get loginWith => 'УВІЙТИ ЧЕРЕЗ';

  @override
  String get scanQrCode => 'Сканувати QR-код';

  @override
  String get searchResults => 'Результати пошуку';

  @override
  String get viewAll => 'Переглянути все';

  @override
  String get requestedEntityDoesNotExists => 'Запитувана сутність не існує.';

  @override
  String get noAlarmsFound => 'Тривог не знайдено';

  @override
  String get filters => 'Фільтри';

  @override
  String get alarmStatusList => 'Список статусів тривог';

  @override
  String get alarmSeverityList => 'Список рівнів серйозності тривоги';

  @override
  String get cleared => 'Знята';

  @override
  String get acknowledged => 'Підтверджена';

  @override
  String get unacknowledged => 'Непідтверджена';

  @override
  String get critical => 'Критична';

  @override
  String get major => 'Висока';

  @override
  String get minor => 'Низька';

  @override
  String get warning => 'Попередження';

  @override
  String get indeterminate => 'Невизначена';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Пошук користувачів',
      one: 'Пошук користувача',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Скинути';

  @override
  String get update => 'Оновити';

  @override
  String get alarmTypeList => 'Список типів тривог';

  @override
  String get anyType => 'Будь-який тип';

  @override
  String get plusAlarmType => '+ Тип тривоги';

  @override
  String get all => 'Усі';

  @override
  String get allNotifications => 'Усі';

  @override
  String get unread => 'Непрочитані';

  @override
  String get close => 'Закрити';

  @override
  String get fatalError => 'Фатальна помилка';

  @override
  String get unknownError => 'Невідома помилка.';

  @override
  String get sessionExpired => 'Термін дії сеансу минув';

  @override
  String get fatalApplicationErrorOccurred =>
      'Сталася фатальна помилка застосунку:';

  @override
  String get connectionError => 'Помилка з’єднання';

  @override
  String get failedToConnectToServer => 'Не вдалося підключитися до сервера';

  @override
  String get retry => 'Повторити';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Мобільний дашборд потрібно налаштувати у профілі пристрою!';

  @override
  String get openWifiSettings => 'Відкрити налаштування Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Підключіться до Wi-Fi, яким зазвичай користуєтеся';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Поверніться до застосунку й натисніть кнопку «Готово»';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Виконайте наступні кроки, щоб знову підключити\nтелефон до звичного Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push-сповіщення не налаштовано.\nЗверніться до системного адміністратора.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase не налаштовано.\n Зверніться до офіційної документації Firebase\n за інструкціями.';

  @override
  String get markAllAsRead => 'Позначити все як прочитане';

  @override
  String get profile => 'Профіль';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Не вдається відкрити посилання: $link';
  }

  @override
  String get noDashboardsFound => 'Дашбордів не знайдено';

  @override
  String get openAppSettings => 'Відкрити налаштування застосунку';

  @override
  String get connectingToDevice => 'Підключення до пристрою';

  @override
  String get connectToDevice => 'Підключитися до пристрою';

  @override
  String get selectWifiNetwork => 'Виберіть мережу Wi-Fi';

  @override
  String get deviceProvisioning => 'Підготовка пристрою';

  @override
  String get permissions => 'Дозволи';

  @override
  String get unableConnectToDevice => 'Не вдається підключитися до пристрою';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Пристрій не знаходить Wi-Fi поблизу';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Не вдалося підключитися до Wi-Fi мережі $name.\nПереконайтеся, що ваш телефон підключений до Wi-Fi мережі пристрою та що для цього застосунку увімкнено доступ до локальної мережі в налаштуваннях пристрою.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Не вдалося підключитися до Wi-Fi, оскільки пристрій $name не знайшов мереж';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Виконайте наступні кроки, щоб підключити телефон до пристрою';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Підключіться до Wi-Fi на кшталт $wifiName';
  }

  @override
  String get ready => 'Готово';

  @override
  String get exitDeviceProvisioning => 'Вийти з підготовки пристрою';

  @override
  String get noNotificationsFound => 'Сповіщень не знайдено';

  @override
  String get markAsRead => 'Позначити як прочитане';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Відскануйте QR-код на вашому пристрої';

  @override
  String get search => 'Пошук';

  @override
  String get tenant => 'Орендар';

  @override
  String get tenantProfile => 'Профіль орендаря';

  @override
  String get user => 'Користувач';

  @override
  String get asset => 'Актив';

  @override
  String get deviceProfile => 'Профіль пристрою';

  @override
  String get assetProfile => 'Профіль активу';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Тривоги',
      one: 'Тривога',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Ланцюг правил';

  @override
  String get ruleNode => 'Вузол правил';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Фрагмент сутності';

  @override
  String get widgetsBundle => 'Набір віджетів';

  @override
  String get widgetType => 'Тип віджета';

  @override
  String get apiUsageState => 'Стан використання API';

  @override
  String get tbResource => 'Ресурс';

  @override
  String get otaPackage => 'Пакет OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Черга';

  @override
  String get notificationTarget => 'Отримувач сповіщення';

  @override
  String get notificationTemplate => 'Шаблон сповіщення';

  @override
  String get notificationRequest => 'Запит сповіщення';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сповіщення',
      one: 'Сповіщення',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Правило сповіщення';

  @override
  String get entityGroup => 'Група сутностей';

  @override
  String get converter => 'Конвертер';

  @override
  String get integration => 'Інтеграція';

  @override
  String get schedulerEvent => 'Подія планувальника';

  @override
  String get blobEntity => 'Blob-сутність';

  @override
  String get role => 'Роль';

  @override
  String get groupPermission => 'Дозвіл групи';

  @override
  String get actionStatusSuccess => 'Успішно';

  @override
  String get actionStatusFailure => 'Неуспішно';

  @override
  String get actionTypeAdded => 'Додано';

  @override
  String get actionTypeDeleted => 'Видалено';

  @override
  String get actionTypeUpdated => 'Оновлено';

  @override
  String get actionTypeAttributesUpdated => 'Атрибути оновлено';

  @override
  String get actionTypeAttributesDeleted => 'Атрибути видалено';

  @override
  String get actionTypeRpcCall => 'Виклик RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Облікові дані оновлено';

  @override
  String get actionTypeAssignedToCustomer => 'Призначено клієнту';

  @override
  String get actionTypeUnassignedFromCustomer => 'Знято призначення з клієнта';

  @override
  String get actionTypeActivated => 'Активовано';

  @override
  String get actionTypeSuspended => 'Призупинено';

  @override
  String get actionTypeCredentialsRead => 'Облікові дані прочитано';

  @override
  String get actionTypeAttributesRead => 'Атрибути прочитано';

  @override
  String get actionTypeRelationAddOrUpdate => 'Зв’язок оновлено';

  @override
  String get actionTypeRelationDeleted => 'Зв’язок видалено';

  @override
  String get actionTypeRelationsDeleted => 'Усі зв’язки видалено';

  @override
  String get actionTypeAlarmAck => 'Тривогу підтверджено';

  @override
  String get actionTypeAlarmClear => 'Тривогу знято';

  @override
  String get actionTypeAlarmDelete => 'Тривогу видалено';

  @override
  String get actionTypeAlarmAssigned => 'Тривогу призначено';

  @override
  String get actionTypeAlarmUnassigned => 'Знято призначення тривоги';

  @override
  String get actionTypeLogin => 'Вхід';

  @override
  String get actionTypeLogout => 'Вихід';

  @override
  String get actionTypeLockout => 'Блокування';

  @override
  String get actionTypeAssignedFromTenant => 'Призначено від орендаря';

  @override
  String get actionTypeAssignedToTenant => 'Призначено орендарю';

  @override
  String get actionTypeProvisionSuccess => 'Пристрій підготовлено';

  @override
  String get actionTypeProvisionFailure => 'Не вдалося підготувати пристрій';

  @override
  String get actionTypeTimeseriesUpdated => 'Телеметрію оновлено';

  @override
  String get actionTypeTimeseriesDeleted => 'Телеметрію видалено';

  @override
  String get actionTypeAssignedToEdge => 'Призначено Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Знято призначення з Edge';

  @override
  String get actionTypeAddedComment => 'Коментар додано';

  @override
  String get actionTypeUpdatedComment => 'Коментар оновлено';

  @override
  String get actionTypeDeletedComment => 'Коментар видалено';

  @override
  String get actionTypeSmsSent => 'SMS надіслано';

  @override
  String get actionTypeAddedToEntityGroup => 'Додано до групи сутностей';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Вилучено з групи сутностей';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Виклик REST API механізму правил';

  @override
  String get actionTypeMadePublic => 'Зроблено публічним';

  @override
  String get actionTypeMadePrivate => 'Зроблено приватним';

  @override
  String get actionTypeChangeOwner => 'Власника змінено';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'У вас немає дозволів для виконання цієї операції!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Схоже, ваших дозволів недостатньо для виконання цієї операції';

  @override
  String fieldIsRequired(String field) {
    return '$field — обов’язкове поле.';
  }

  @override
  String get no2faProvidersFound => 'Провайдерів 2FA не знайдено';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Будь ласка, зверніться до системного адміністратора';

  @override
  String errorOccured(Object e) {
    return 'Сталася помилка: $e';
  }

  @override
  String get unsavedChanges => 'Незбережені зміни';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'У вас є незбережені зміни. Ви впевнені, що хочете покинути цю сторінку?';

  @override
  String get deleteAccount => 'Видалити обліковий запис';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Ви впевнені? Ви збираєтеся видалити свій обліковий запис $authority.';
  }

  @override
  String get language => 'Мова';

  @override
  String get metricUnitSystem => 'Метрична';

  @override
  String get imperialUnitSystem => 'Імперська';

  @override
  String get hybridUnitSystem => 'Гібридна';

  @override
  String get autoUnitSystem => 'Авто';

  @override
  String get languageAuto => 'Авто';

  @override
  String get unitSystem => 'Система одиниць';

  @override
  String get selectCountry => 'Виберіть країну';

  @override
  String get hideHomeDashboardToolbar =>
      'Приховувати панель інструментів домашнього дашборду';

  @override
  String get phoneNumberHelperText =>
      'Номер телефону у форматі E.164, напр. +1201550123';

  @override
  String get homeDashboard => 'Домашній дашборд';

  @override
  String get security => 'Безпека';

  @override
  String get twofactorAuthentication => 'Двофакторна автентифікація';

  @override
  String get verificationRequired => 'Потрібне підтвердження';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Потрібна двофакторна автентифікація';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Налаштуйте метод підтвердження, щоб продовжити вхід';

  @override
  String get setUpAVerificationMethod => 'Налаштувати метод підтвердження';

  @override
  String get totpSetupSuccessDescription =>
      'Наступного разу під час входу вам потрібно буде надати код двофакторної автентифікації';

  @override
  String get smsSetupSuccessDescription =>
      'Наступного разу під час входу вам буде запропоновано ввести код безпеки, який буде надіслано на номер телефону';

  @override
  String get emailSetupSuccessDescription =>
      'Наступного разу під час входу вам буде запропоновано ввести код безпеки, який буде надіслано на вашу email-адресу';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Наступного разу під час входу ви зможете використати резервні коди для проходження двофакторної автентифікації';

  @override
  String get loginToApp => 'Вхід до застосунку';

  @override
  String get goBack => 'Назад';

  @override
  String get done => 'Готово';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Це зробить ваш обліковий запис менш захищеним';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Ви впевнені, що хочете деактивувати «$providerName»?';
  }

  @override
  String get yesDeactivate => 'Так, деактивувати';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Введіть email, щоб використовувати його як ваш автентифікатор.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Введіть номер телефону для використання як автентифікатора';

  @override
  String get sendCode => 'Надіслати код';

  @override
  String get copy => 'Копіювати';

  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Введіть 6-значний код тут';

  @override
  String digitsCode(int count) {
    return 'Код з $count цифр';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Скопіюйте 32-символьний ключ у ваш застосунок автентифікації або відскануйте QR-код нижче';

  @override
  String get applyChanges => 'Застосувати зміни';

  @override
  String get discardChanges => 'Відхилити зміни';

  @override
  String get yesDiscard => 'Так, відхилити';

  @override
  String get thisActionCannotBeUndone => 'Цю дію не можна скасувати';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Двофакторна автентифікація захищає ваш обліковий запис від несанкціонованого доступу. Все, що вам потрібно зробити, — ввести код безпеки під час входу.';

  @override
  String get calculatedField => 'Розрахункове поле';

  @override
  String get apiKey => 'API-ключ';

  @override
  String get aiModel => 'Модель ШІ';

  @override
  String get adminSettings => 'Налаштування адміністратора';

  @override
  String get job => 'Завдання';

  @override
  String get mobileAppBundle => 'Пакет мобільного застосунку';

  @override
  String get mobileApp => 'Мобільний застосунок';

  @override
  String get domain => 'Домен';

  @override
  String get oauth2Client => 'Клієнт OAuth2';

  @override
  String get queueStats => 'Статистика черги';

  @override
  String get phoneIsRequired => 'Потрібно вказати номер телефону';

  @override
  String get phoneIsInvalid => 'Некоректний номер телефону';

  @override
  String get addVerificationMethod => 'Додати метод підтвердження';

  @override
  String get imageSavedToGallery => 'Збережено в «Галерею зображень» платформи';

  @override
  String get failedToSaveImage => 'Не вдалося зберегти зображення';

  @override
  String nSelected(int count) {
    return 'Вибрано: $count';
  }

  @override
  String get selectAll => 'Вибрати всі завантажені';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не вдалося виконати $count операції',
      many: 'Не вдалося виконати $count операцій',
      few: 'Не вдалося виконати $count операції',
      one: 'Не вдалося виконати $count операцію',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Видалити $count сповіщення?',
      many: 'Видалити $count сповіщень?',
      few: 'Видалити $count сповіщення?',
      one: 'Видалити $count сповіщення?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Позначити $count сповіщення як прочитані?',
      many: 'Позначити $count сповіщень як прочитані?',
      few: 'Позначити $count сповіщення як прочитані?',
      one: 'Позначити $count сповіщення як прочитане?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Отримання даних з вашого хоста $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Вхід на хост $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Перемикання на новий хост $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Не вдалося отримати токен входу з $host. Відскануйте новий QR-код.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Не вдалося підключитися до $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host не є сервером ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Сеанс QR-коду більше не дійсний. Оновіть QR-код і відскануйте ще раз.';

  @override
  String get openThisLinkTitle => 'Відкрити це посилання?';

  @override
  String get linkOpensSignInPage =>
      'Це посилання відкриває сторінку входу цього сервера. Вас буде виведено з поточного сервера.';

  @override
  String get linkOpensSignInPageOnly =>
      'Це посилання відкриває сторінку входу цього сервера.';

  @override
  String linkSignsInAs(Object email) {
    return 'Це посилання виконує вхід на цей сервер як $email.';
  }

  @override
  String get linkSignsIn => 'Це посилання виконує вхід на цей сервер.';

  @override
  String get serverConnectionNotSecure =>
      'Цей сервер не використовує захищене з’єднання.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Цей застосунок працює лише зі своїм сервером і не може відкрити це посилання.';

  @override
  String get liveTrackingActive =>
      'Відстеження місцезнаходження в реальному часі';

  @override
  String get liveTrackingPaused => 'Відстеження призупинено';

  @override
  String get liveTrackingFixes => 'Фіксації';

  @override
  String get liveTrackingSaved => 'Збережено';

  @override
  String get liveTrackingErrors => 'Помилки';

  @override
  String get liveTrackingStop => 'Зупинити';

  @override
  String get liveTrackingPause => 'Призупинити';

  @override
  String get liveTrackingResume => 'Відновити';

  @override
  String get liveTrackingHide => 'Приховати';

  @override
  String get liveTrackingSessionTitle =>
      'Відстеження місцезнаходження в реальному часі';

  @override
  String get liveTrackingTarget => 'Зберігати місцезнаходження в сутність';

  @override
  String get liveTrackingDashboard => 'Дашборд';

  @override
  String get liveTrackingStatus => 'Статус';

  @override
  String get liveTrackingStarted => 'Час початку';

  @override
  String get liveTrackingLastFix => 'Остання фіксація';

  @override
  String get liveTrackingLastError => 'Остання помилка';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Не вдається зберегти до цієї сутності — її більше не існує. Відстеження триває; оновіть ціль у дії дашборду.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Немає з’єднання із сервером. Ці фіксації не збережено — збереження відновиться, коли ви знову будете онлайн.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Ваш сеанс завершився. Увійдіть знову, щоб продовжити збереження місцезнаходження.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Не вдається зберегти до цієї сутності — у вас немає дозволу. Відстеження триває; попросіть адміністратора надати доступ.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Не вдалося зберегти цю фіксацію на сервері. Збереження повториться з наступною фіксацією.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Служби місцезнаходження вимкнено на цьому пристрої.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Дозвіл на доступ до місцезнаходження відхилено.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Дозвіл на доступ до місцезнаходження остаточно відхилено. Увімкніть його в налаштуваннях застосунку.';

  @override
  String get liveTrackingErrorLocation =>
      'Не вдалося визначити місцезнаходження.';

  @override
  String get liveTrackingMenuTitle =>
      'Відстеження місцезнаходження в реальному часі';

  @override
  String get liveTrackingNoRecord =>
      'Немає активного відстеження та нещодавніх сеансів.';

  @override
  String get liveTrackingLastSession => 'Останній сеанс';

  @override
  String get liveTrackingStartAgain => 'Почати знову';

  @override
  String get liveTrackingEnded => 'Час завершення';

  @override
  String get liveTrackingEndReason => 'Причина завершення';

  @override
  String get liveTrackingEndReasonManual => 'Зупинено вручну';

  @override
  String get liveTrackingEndReasonMaxDuration =>
      'Досягнуто максимальної тривалості';

  @override
  String get liveTrackingEndReasonInterrupted => 'Перервано';

  @override
  String get serverUpdateRequired => 'Потрібне оновлення сервера';

  @override
  String get backToLogin => 'Повернутися до входу';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Цей застосунок працює з ThingsBoard версії $minVersion або новішої.';
  }

  @override
  String get serverLabel => 'Сервер';

  @override
  String get versionLabel => 'Версія';

  @override
  String get askAdminToUpdateServer =>
      'Зверніться до адміністратора сервера з проханням оновити сервер.';

  @override
  String get deviceClaimFailed =>
      'Не вдалося прив’язати пристрій. Спробуйте ще раз.';

  @override
  String get deviceToClaimNotFound =>
      'Пристрій не знайдено. Зверніться до постачальника пристрою.';

  @override
  String get enableAuthenticatorApp => 'Увімкнути застосунок автентифікації';

  @override
  String get enableSmsAuthenticator => 'Увімкнути SMS-автентифікатор';

  @override
  String get enableEmailAuthenticator => 'Увімкнути email-автентифікатор';

  @override
  String get getBackupCode => 'Отримати резервний код';

  @override
  String get twoFaTotpDescription =>
      'Використовуйте застосунки, такі як Google Authenticator, Authy або Duo на вашому телефоні для автентифікації. Вони генерують код безпеки для входу.';

  @override
  String get twoFaSmsDescription =>
      'Використовуйте свій телефон для автентифікації. Ми надішлемо вам код безпеки через SMS-повідомлення під час входу.';

  @override
  String get twoFaEmailDescription =>
      'Використовуйте код безпеки, надісланий на вашу email-адресу, для автентифікації.';

  @override
  String get twoFaBackupCodeDescription =>
      'Ці друковані одноразові коди дозволяють увійти в систему, коли ви не маєте доступу до телефону, наприклад, під час подорожей.';

  @override
  String get openInAuthenticatorApp => 'Відкрити в застосунку автентифікації';

  @override
  String get noAuthenticatorAppFound =>
      'Застосунок автентифікації не знайдено. Скопіюйте ключ у свій застосунок.';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$provider увімкнено';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Ваш адміністратор вимагає двофакторну автентифікацію для $email.';
  }

  @override
  String get recommended => 'Рекомендовано';

  @override
  String get addBackupCodesHint =>
      'Додайте також резервні коди, щоб мати змогу входити, якщо втратите телефон.';

  @override
  String get totpSecretKey => 'Секретний ключ';

  @override
  String get backupCodesDescription =>
      'Роздрукуйте коди, щоб вони були під рукою, коли вам потрібно буде використати їх для входу у ваш обліковий запис. Ви можете використати кожен резервний код один раз.';

  @override
  String get backupCodesWarning =>
      'Щойно ви покинете цю сторінку, ці коди не можна буде показати знову. Зберігайте їх безпечно, використовуючи варіанти нижче.';

  @override
  String get downloadTxt => 'Завантажити (txt)';
}
