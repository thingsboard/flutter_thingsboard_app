// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class SPl extends S {
  SPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Strona główna';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Urządzenia',
      one: 'Urządzenie',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Więcej';

  @override
  String get customers => 'Klienci';

  @override
  String get assets => 'Zasoby';

  @override
  String get tenants => 'Tenanty';

  @override
  String get auditLogs => 'Dzienniki audytu';

  @override
  String get noCustomersFound => 'Nie znaleziono żadnych klientów';

  @override
  String get noAssetsFound => 'Nie znaleziono żadnych zasobów';

  @override
  String get noTenantsFound => 'Nie znaleziono tenantów';

  @override
  String get noDevicesFound => 'Nie znaleziono urządzeń';

  @override
  String get noAuditLogsFound => 'Nie znaleziono dzienników audytu';

  @override
  String get logout => 'Wyloguj';

  @override
  String get login => 'Zaloguj się';

  @override
  String get logoDefaultValue => 'Logo ThingsBoard';

  @override
  String get loginToYourAccount => 'Zaloguj się do swojego konta';

  @override
  String get email => 'E-mail';

  @override
  String get emailRequireText => 'E-mail jest wymagany.';

  @override
  String get emailInvalidText => 'Nieprawidłowy format adresu e-mail.';

  @override
  String get username => 'nazwa użytkownika';

  @override
  String get password => 'Hasło';

  @override
  String get passwordRequireText => 'Hasło jest wymagane.';

  @override
  String get passwordForgotText => 'Nie pamiętasz hasła?';

  @override
  String get passwordReset => 'Zresetuj hasło';

  @override
  String get passwordResetText =>
      'Wprowadź adres e-mail powiązany z Twoim kontem, a wyślemy wiadomość z linkiem do resetowania hasła';

  @override
  String get requestPasswordReset => 'Poproś o zresetowanie hasła';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Link do resetowania hasła został pomyślnie wysłany!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Link do weryfikacji adresu e-mail został pomyślnie wysłany!';

  @override
  String get or => 'LUB';

  @override
  String get no => 'Nie';

  @override
  String get yes => 'Tak';

  @override
  String get title => 'Tytuł';

  @override
  String get country => 'Kraj';

  @override
  String get city => 'Miasto';

  @override
  String get stateOrProvince => 'Stan/prowincja';

  @override
  String get postalCode => 'Kod pocztowy';

  @override
  String get address => 'Adres';

  @override
  String get address2 => 'Adres 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Wyczyść alarm';

  @override
  String get alarmClearText => 'Czy na pewno chcesz wyczyścić ten alarm?';

  @override
  String get alarmAcknowledgeTitle => 'Potwierdź alarm';

  @override
  String get alarmAcknowledgeText =>
      'Czy na pewno chcesz potwierdzić ten alarm?';

  @override
  String get assetName => 'Nazwa zasobu';

  @override
  String get type => 'Typ';

  @override
  String get label => 'Etykieta';

  @override
  String get assignedToCustomer => 'Przypisany do klienta';

  @override
  String get auditLogDetails => 'Szczegóły dziennika audytu';

  @override
  String get customerDetails => 'Szczegóły klienta';

  @override
  String get assetDetails => 'Szczegóły zasobu';

  @override
  String get tenantDetails => 'Dane tenanta';

  @override
  String get entityType => 'Typ obiektu';

  @override
  String get actionData => 'Dane akcji';

  @override
  String get failureDetails => 'Szczegóły błędu';

  @override
  String get allDevices => 'Wszystkie urządzenia';

  @override
  String get active => 'Aktywna';

  @override
  String get inactive => 'Nieaktywna';

  @override
  String get deviceActive => 'Aktywne';

  @override
  String get deviceInactive => 'Nieaktywne';

  @override
  String get activeDevices => 'Aktywne';

  @override
  String get inactiveDevices => 'Nieaktywne';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktywny, potwierdzony';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktywny, niepotwierdzony';

  @override
  String get alarmStatusClearedAcknowledged => 'Wyczyszczony, potwierdzony';

  @override
  String get alarmStatusClearedUnacknowledged =>
      'Wyczyszczony, niepotwierdzony';

  @override
  String get alarmStatusFilterActive => 'Aktywny';

  @override
  String get systemAdministrator => 'Administrator systemu';

  @override
  String get tenantAdministrator => 'Administrator tenanta';

  @override
  String get customer => 'Klient';

  @override
  String get changePassword => 'Zmień hasło';

  @override
  String get currentPasswordRequireText => 'Bieżące hasło jest wymagane.';

  @override
  String get currentPassword => 'Bieżące hasło';

  @override
  String get newPasswordRequireText => 'Nowe hasło jest wymagane.';

  @override
  String get newPassword => 'Nowe hasło';

  @override
  String get newPassword2RequireText =>
      'Powtórzenie nowego hasła jest wymagane.';

  @override
  String get newPassword2 => 'Potwierdź nowe hasło';

  @override
  String get passwordErrorNotification => 'Wpisane hasła muszą być takie same!';

  @override
  String get firstNameUpper => 'Imię';

  @override
  String get lastNameUpper => 'Nazwisko';

  @override
  String get profileSuccessNotification =>
      'Profil został pomyślnie zaktualizowany';

  @override
  String get passwordSuccessNotification => 'Hasło zostało pomyślnie zmienione';

  @override
  String get notImplemented => 'Nie zaimplementowano!';

  @override
  String get listIsEmptyText => 'Lista jest obecnie pusta.';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get verifyYourIdentity => 'Zweryfikuj swoją tożsamość';

  @override
  String get continueText => 'Kontynuuj';

  @override
  String get resendCode => 'Wyślij kod ponownie';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time sekundy',
      many: '$time sekund',
      few: '$time sekundy',
      one: '$time sekundę',
    );
    return 'Wyślij kod ponownie za $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Wprowadź kod zabezpieczający z aplikacji uwierzytelniającej.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Kod zabezpieczający został wysłany na Twój numer telefonu $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Kod zabezpieczający został wysłany na Twój adres e-mail $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Wprowadź jeden ze swoich kodów zapasowych.';

  @override
  String get toptAuthPlaceholder => 'Kod';

  @override
  String get smsAuthPlaceholder => 'Kod SMS';

  @override
  String get emailAuthPlaceholder => 'Kod e-mail';

  @override
  String get backupCodeAuthPlaceholder => 'Kod zapasowy';

  @override
  String get verificationCodeIncorrect =>
      'Kod weryfikacyjny jest nieprawidłowy';

  @override
  String get verificationCodeManyRequest =>
      'Zbyt wiele żądań sprawdzenia kodu weryfikacyjnego';

  @override
  String get tryAnotherWay => 'Spróbuj w inny sposób';

  @override
  String get selectWayToVerify => 'Wybierz sposób weryfikacji';

  @override
  String get mfaProviderTopt => 'Aplikacja uwierzytelniająca';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-mail';

  @override
  String get mfaProviderBackupCode => 'Kod zapasowy';

  @override
  String get newUserText => 'Nowy użytkownik?';

  @override
  String get createAccount => 'Utwórz konto';

  @override
  String get emailVerification => 'Weryfikacja adresu e-mail';

  @override
  String get emailVerificationSentText =>
      'Na podany adres e-mail wysłano wiadomość ze szczegółami weryfikacji ';

  @override
  String get emailVerificationInstructionsText =>
      'Postępuj zgodnie z instrukcjami podanymi w wiadomości e-mail, aby dokończyć procedurę rejestracji. Uwaga: jeśli od dłuższego czasu nie widzisz wiadomości, sprawdź folder „spam” lub spróbuj wysłać wiadomość ponownie, klikając przycisk „Wyślij ponownie”.';

  @override
  String get resend => 'Wyślij ponownie';

  @override
  String get activatingAccount => 'Aktywowanie konta...';

  @override
  String get accountActivated => 'Konto zostało pomyślnie aktywowane!';

  @override
  String get emailVerified => 'E-mail zweryfikowany';

  @override
  String get activatingAccountText =>
      'Trwa aktywacja Twojego konta.\nCzekaj...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Gratulacje!\nTwoje konto $appTitle zostało aktywowane.\nMożesz teraz zalogować się do swojej przestrzeni $appTitle.';
  }

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get cancel => 'Anuluj';

  @override
  String get accept => 'Akceptuj';

  @override
  String get termsOfUse => 'Warunki użytkowania';

  @override
  String get firstName => 'Imię';

  @override
  String get firstNameRequireText => 'Imię jest wymagane.';

  @override
  String get lastName => 'Nazwisko';

  @override
  String get lastNameRequireText => 'Nazwisko jest wymagane.';

  @override
  String get createPassword => 'Utwórz hasło';

  @override
  String get repeatPassword => 'Powtórz swoje hasło';

  @override
  String get imNotARobot => 'Nie jestem robotem';

  @override
  String get signUp => 'Zarejestruj się';

  @override
  String get alreadyHaveAnAccount => 'Posiadasz już konto?';

  @override
  String get signIn => 'Zaloguj się';

  @override
  String get inactiveUserAlreadyExists => 'Nieaktywny użytkownik już istnieje';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Istnieje już zarejestrowany użytkownik z niezweryfikowanym adresem e-mail.\nKliknij przycisk „Wyślij ponownie”, jeśli chcesz ponownie wysłać wiadomość weryfikacyjną.';

  @override
  String get assignee => 'Przypisana osoba';

  @override
  String get alarmTypes => 'Typy alarmów';

  @override
  String get details => 'Szczegóły';

  @override
  String get status => 'Status';

  @override
  String get severity => 'Ważność';

  @override
  String get originator => 'Inicjator';

  @override
  String get startTime => 'Czas rozpoczęcia';

  @override
  String get duration => 'Czas trwania';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dnia',
      many: '$value dni',
      few: '$value dni',
      one: '$value dzień',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value godziny',
      many: '$value godzin',
      few: '$value godziny',
      one: '$value godzina',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minuty',
      many: '$value minut',
      few: '$value minuty',
      one: '$value minuta',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value sekundy',
      many: '$value sekund',
      few: '$value sekundy',
      one: '$value sekunda',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Wyświetl pulpit';

  @override
  String get activity => 'Aktywność';

  @override
  String get addCommentMessage => 'Dodaj komentarz...';

  @override
  String get selectUser => 'Wybierz użytkowników';

  @override
  String get assignedToMe => 'Przypisane do mnie';

  @override
  String get clear => 'Wyczyść';

  @override
  String get acknowledge => 'Potwierdź';

  @override
  String get edit => 'Edytuj';

  @override
  String get editProfile => 'Edytuj profil';

  @override
  String get delete => 'Usuń';

  @override
  String get edited => 'Edytowano';

  @override
  String get deleteComment => 'Usuń komentarz';

  @override
  String get areYouSure => 'Czy na pewno?';

  @override
  String get noResultsFound => 'Nie znaleziono wyników';

  @override
  String get tryRefiningYourQuery => 'Spróbuj doprecyzować zapytanie';

  @override
  String get failedToLoadTheList => 'Nie udało się załadować listy';

  @override
  String get tryRefreshing => 'Spróbuj odświeżyć';

  @override
  String get refresh => 'Odśwież';

  @override
  String get users => 'Użytkownicy';

  @override
  String get unassigned => 'Nieprzypisany';

  @override
  String get failedToLoadAlarmDetails =>
      'Nie udało się załadować szczegółów alarmu';

  @override
  String get somethingWentWrong => 'Coś poszło nie tak';

  @override
  String get chooseRegion => 'Wybierz region';

  @override
  String get selectRegion => 'Wybierz region';

  @override
  String get northAmerica => 'Ameryka Północna';

  @override
  String get europe => 'Europa';

  @override
  String get northAmericaRegionShort => 'Płn. Wirginia';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Lista urządzeń';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pulpity',
      one: 'Pulpit',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Wymagana aktualizacja';

  @override
  String updateTo(Object version) {
    return 'Aktualizuj do $version';
  }

  @override
  String get next => 'Dalej';

  @override
  String get confirmation => 'Potwierdzenie';

  @override
  String get wifiPassword => 'Hasło Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Aby kontynuować konfigurację urządzenia $deviceName, podaj dane uwierzytelniające swojej sieci.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Wprowadź hasło do $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Nie znaleziono urządzeń. Upewnij się, że Bluetooth w Twoim telefonie jest włączony i że znajdujesz się w zasięgu nowego urządzenia.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Nie masz wystarczających uprawnień do „$permissions”, aby kontynuować. Nadaj wymagane uprawnienia i dotknij „Spróbuj ponownie”.';
  }

  @override
  String get sendingWifiCredentials =>
      'Wysyłanie danych uwierzytelniających Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Potwierdzanie połączenia Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'Urządzenie zostało pomyślnie aprowizowane';

  @override
  String get returnToDashboard => 'Wróć do pulpitu';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Nie można nawiązać sesji z urządzeniem „$deviceName”. Spróbuj ponownie';
  }

  @override
  String get claimingDevice => 'Przejmowanie urządzenia';

  @override
  String get claimingDeviceDone => 'Przejmowanie urządzenia zakończone';

  @override
  String get claimingMessageSuccess => 'Urządzenie zostało\npomyślnie przejęte';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Nie masz wystarczających uprawnień do „$permissions”, aby kontynuować. Otwórz ustawienia aplikacji, nadaj uprawnienia i dotknij „Spróbuj ponownie”.';
  }

  @override
  String get scanACode => 'Zeskanuj kod';

  @override
  String get allowAccess => 'Zezwól na dostęp';

  @override
  String get toggleCamera => 'Przełącz kamerę';

  @override
  String get toggleFlash => 'Przełącz lampę błyskową';

  @override
  String get unableToUseCamera => 'Nie można użyć kamery';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Otwórz ustawienia i nadaj dostęp do kamery, aby kontynuować';

  @override
  String get notFound => 'Nie znaleziono';

  @override
  String routeNotDefined(Object name) {
    return 'Trasa nie została zdefiniowana: $name';
  }

  @override
  String get loginWith => 'Zaloguj się przez';

  @override
  String get scanQrCode => 'Zeskanuj kod QR';

  @override
  String get anEmptyRequestDataReceived => 'Otrzymano puste dane żądania.';

  @override
  String get somethingWentWrongRollback => 'Coś poszło nie tak ... Wycofywanie';

  @override
  String get searchResults => 'Wyniki wyszukiwania';

  @override
  String get viewAll => 'Wyświetl wszystkie';

  @override
  String get requestedEntityDoesNotExists => 'Żądany obiekt nie istnieje.';

  @override
  String get noAlarmsFound => 'Nie znaleziono alarmów';

  @override
  String get filters => 'Filtry';

  @override
  String get alarmStatusList => 'Lista stanów alarmów';

  @override
  String get alarmSeverityList => 'Lista ważności alarmów';

  @override
  String get cleared => 'Wyczyszczony';

  @override
  String get acknowledged => 'Potwierdzony';

  @override
  String get unacknowledged => 'Niepotwierdzony';

  @override
  String get critical => 'Krytyczny';

  @override
  String get major => 'Poważny';

  @override
  String get minor => 'Drobny';

  @override
  String get warning => 'Ostrzeżenie';

  @override
  String get indeterminate => 'Nieokreślony';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wyszukaj użytkowników',
      one: 'Wyszukaj użytkownika',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Resetuj';

  @override
  String get update => 'Aktualizuj';

  @override
  String get alarmTypeList => 'Lista typów alarmów';

  @override
  String get anyType => 'Dowolny typ';

  @override
  String get plusAlarmType => '+ Typ alarmu';

  @override
  String get all => 'Wszystkie';

  @override
  String get allNotifications => 'Wszystkie';

  @override
  String get unread => 'Nieprzeczytane';

  @override
  String get close => 'Zamknij';

  @override
  String get codeVerificationFailed => 'Weryfikacja kodu nie powiodła się!';

  @override
  String get fatalError => 'Błąd krytyczny';

  @override
  String get unknownError => 'Nieznany błąd.';

  @override
  String get sessionExpired => 'Sesja wygasła';

  @override
  String get fatalApplicationErrorOccurred =>
      'Wystąpił krytyczny błąd aplikacji:';

  @override
  String get connectionError => 'Błąd połączenia';

  @override
  String get failedToConnectToServer => 'Nie udało się połączyć z serwerem';

  @override
  String get retry => 'Ponów';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Pulpit mobilny powinien być skonfigurowany w profilu urządzenia!';

  @override
  String get openWifiSettings => 'Otwórz ustawienia Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Połącz się z Wi-Fi, z którego zwykle korzystasz';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Wróć do aplikacji i dotknij przycisku „Gotowe”';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Wykonaj poniższe kroki, aby ponownie połączyć\ntelefon ze swoją zwykłą siecią Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Powiadomienia push nie są skonfigurowane.\nSkontaktuj się z administratorem systemu.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase nie jest skonfigurowany.\n Zapoznaj się z oficjalną dokumentacją Firebase,\n aby dowiedzieć się, jak to zrobić.';

  @override
  String get markAllAsRead => 'Oznacz wszystkie jako przeczytane';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Nie można otworzyć adresu URL: $link';
  }

  @override
  String get noDashboardsFound => 'Nie znaleziono pulpitów';

  @override
  String get openAppSettings => 'Otwórz ustawienia aplikacji';

  @override
  String get connectingToDevice => 'Łączenie z urządzeniem';

  @override
  String get connectToDevice => 'Połącz z urządzeniem';

  @override
  String get selectWifiNetwork => 'Wybierz sieć Wi-Fi';

  @override
  String get deviceProvisioning => 'Aprowizacja urządzeń';

  @override
  String get permissions => 'Uprawnienia';

  @override
  String get unableConnectToDevice => 'Nie można połączyć się z urządzeniem';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Urządzenie nie może znaleźć sieci Wi-Fi w pobliżu';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Połączenie z siecią Wi-Fi „$name” nie powiodło się.\nUpewnij się, że telefon jest połączony z siecią Wi-Fi urządzenia oraz że dostęp do sieci lokalnej jest włączony dla tej aplikacji w ustawieniach telefonu.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Nie można połączyć się z Wi-Fi, ponieważ urządzenie „$name” nie znalazło żadnych sieci';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Wykonaj poniższe kroki, aby połączyć telefon z urządzeniem';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Połącz się z Wi-Fi podobnym do $wifiName';
  }

  @override
  String get ready => 'Gotowe';

  @override
  String get exitDeviceProvisioning => 'Zakończ aprowizację urządzenia';

  @override
  String get noNotificationsFound => 'Nie znaleziono powiadomień';

  @override
  String get markAsRead => 'Oznacz jako przeczytane';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'Zeskanuj kod QR na urządzeniu';

  @override
  String get search => 'Szukaj';

  @override
  String get tenant => 'Tenant';

  @override
  String get tenantProfile => 'Profil tenanta';

  @override
  String get user => 'Użytkownik';

  @override
  String get asset => 'Zasób';

  @override
  String get deviceProfile => 'Profil urządzenia';

  @override
  String get assetProfile => 'Profil zasobu';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alarmy',
      one: 'Alarm',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Łańcuch reguł';

  @override
  String get ruleNode => 'Węzeł reguły';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Widok obiektu';

  @override
  String get widgetsBundle => 'Pakiet widżetów';

  @override
  String get widgetType => 'Typ widżetu';

  @override
  String get apiUsageState => 'Stan użycia interfejsu API';

  @override
  String get tbResource => 'Plik';

  @override
  String get otaPackage => 'Pakiet OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Kolejka';

  @override
  String get notificationTarget => 'Odbiorca powiadomienia';

  @override
  String get notificationTemplate => 'Szablon powiadomienia';

  @override
  String get notificationRequest => 'Żądanie powiadomienia';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Powiadomienia',
      one: 'Powiadomienie',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Reguła powiadomień';

  @override
  String get entityGroup => 'Grupa obiektów';

  @override
  String get converter => 'Konwerter';

  @override
  String get integration => 'Integracja';

  @override
  String get schedulerEvent => 'Zdarzenie harmonogramu';

  @override
  String get blobEntity => 'Obiekt typu Blob';

  @override
  String get role => 'Rola';

  @override
  String get groupPermission => 'Uprawnienie grupy';

  @override
  String get actionStatusSuccess => 'Powodzenie';

  @override
  String get actionStatusFailure => 'Niepowodzenie';

  @override
  String get actionTypeAdded => 'Dodano';

  @override
  String get actionTypeDeleted => 'Usunięto';

  @override
  String get actionTypeUpdated => 'Zaktualizowano';

  @override
  String get actionTypeAttributesUpdated => 'Zaktualizowano atrybuty';

  @override
  String get actionTypeAttributesDeleted => 'Usunięto atrybuty';

  @override
  String get actionTypeRpcCall => 'Wywołanie RPC';

  @override
  String get actionTypeCredentialsUpdated =>
      'Zaktualizowano dane uwierzytelniające';

  @override
  String get actionTypeAssignedToCustomer => 'Przypisano do klienta';

  @override
  String get actionTypeUnassignedFromCustomer =>
      'Anulowano przypisanie do klienta';

  @override
  String get actionTypeActivated => 'Aktywowano';

  @override
  String get actionTypeSuspended => 'Zawieszono';

  @override
  String get actionTypeCredentialsRead => 'Odczytano dane uwierzytelniające';

  @override
  String get actionTypeAttributesRead => 'Odczytano atrybuty';

  @override
  String get actionTypeRelationAddOrUpdate => 'Zaktualizowano relację';

  @override
  String get actionTypeRelationDeleted => 'Usunięto relację';

  @override
  String get actionTypeRelationsDeleted => 'Usunięto wszystkie relacje';

  @override
  String get actionTypeAlarmAck => 'Potwierdzono alarm';

  @override
  String get actionTypeAlarmClear => 'Wyczyszczono alarm';

  @override
  String get actionTypeAlarmDelete => 'Usunięto alarm';

  @override
  String get actionTypeAlarmAssigned => 'Przypisano alarm';

  @override
  String get actionTypeAlarmUnassigned => 'Anulowano przypisanie alarmu';

  @override
  String get actionTypeLogin => 'Logowanie';

  @override
  String get actionTypeLogout => 'Wylogowanie';

  @override
  String get actionTypeLockout => 'Blokada konta';

  @override
  String get actionTypeAssignedFromTenant => 'Przypisano od tenanta';

  @override
  String get actionTypeAssignedToTenant => 'Przypisano do tenanta';

  @override
  String get actionTypeProvisionSuccess => 'Zaaprowizowano urządzenie';

  @override
  String get actionTypeProvisionFailure =>
      'Aprowizacja urządzenia nie powiodła się';

  @override
  String get actionTypeTimeseriesUpdated => 'Zaktualizowano telemetrię';

  @override
  String get actionTypeTimeseriesDeleted => 'Usunięto telemetrię';

  @override
  String get actionTypeAssignedToEdge => 'Przypisano do instancji Edge';

  @override
  String get actionTypeUnassignedFromEdge =>
      'Anulowano przypisanie do instancji Edge';

  @override
  String get actionTypeAddedComment => 'Dodano komentarz';

  @override
  String get actionTypeUpdatedComment => 'Zaktualizowano komentarz';

  @override
  String get actionTypeDeletedComment => 'Usunięto komentarz';

  @override
  String get actionTypeSmsSent => 'Wysłano SMS';

  @override
  String get actionTypeAddedToEntityGroup => 'Dodano do grupy obiektów';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Usunięto z grupy obiektów';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Wywołanie REST API silnika reguł';

  @override
  String get actionTypeMadePublic => 'Upubliczniono';

  @override
  String get actionTypeMadePrivate => 'Ustawiono jako prywatne';

  @override
  String get actionTypeChangeOwner => 'Zmieniono właściciela';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Nie masz uprawnień do wykonania tej operacji!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Wygląda na to, że Twoje uprawnienia nie są wystarczające do wykonania tej operacji';

  @override
  String get isRequiredText => 'jest polem wymaganym.';

  @override
  String get no2faProvidersFound => 'Nie znaleziono dostawców 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Skontaktuj się z administratorem systemu';

  @override
  String errorOccured(Object e) {
    return 'Wystąpił błąd: $e';
  }

  @override
  String get unsavedChanges => 'Niezapisane zmiany';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Masz niezapisane zmiany. Czy na pewno chcesz opuścić tę stronę?';

  @override
  String get deleteAccount => 'Usuń konto';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Czy na pewno? Usuniesz swoje konto ($authority).';
  }

  @override
  String get language => 'Język';

  @override
  String get metricUnitSystem => 'Metryczny';

  @override
  String get imperialUnitSystem => 'Imperialny';

  @override
  String get hybridUnitSystem => 'Hybrydowy';

  @override
  String get autoUnitSystem => 'Automatyczny';

  @override
  String get languageAuto => 'Automatyczny';

  @override
  String get unitSystem => 'System jednostek';

  @override
  String get selectCountry => 'Wybierz kraj';

  @override
  String get hideHomeDashboardToolbar =>
      'Ukryj pasek narzędzi pulpitu głównego';

  @override
  String get phoneNumberHelperText =>
      'Numer telefonu w formacie E.164, np. +1201550123';

  @override
  String get homeDashboard => 'Pulpit główny';

  @override
  String get security => 'Bezpieczeństwo';

  @override
  String get twofactorAuthentication => 'Uwierzytelnianie dwuskładnikowe';

  @override
  String get verificationRequired => 'Wymagana weryfikacja';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Uwierzytelnianie dwuskładnikowe jest wymagane';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Skonfiguruj metodę weryfikacji, aby kontynuować logowanie';

  @override
  String get setUpAVerificationMethod => 'Skonfiguruj metodę weryfikacji';

  @override
  String get totpSetupSuccessDescription =>
      'Przy następnym logowaniu konieczne będzie podanie kodu uwierzytelniania dwuskładnikowego';

  @override
  String get smsSetupSuccessDescription =>
      'Przy następnym logowaniu pojawi się prośba o wprowadzenie kodu zabezpieczającego, który zostanie wysłany na numer telefonu';

  @override
  String get emailSetupSuccessDescription =>
      'Przy następnym logowaniu pojawi się prośba o wprowadzenie kodu zabezpieczającego, który zostanie wysłany na Twój adres e-mail';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Przy następnym logowaniu będzie można użyć kodów zapasowych do uwierzytelniania dwuskładnikowego';

  @override
  String get loginToApp => 'Zaloguj się do aplikacji';

  @override
  String get goBack => 'Wróć';

  @override
  String get done => 'Gotowe';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Spowoduje to, że Twoje konto będzie mniej bezpieczne';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Czy na pewno chcesz dezaktywować „$providerName”?';
  }

  @override
  String get yesDeactivate => 'Tak, dezaktywuj';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Wprowadź adres e-mail, który posłuży jako metoda uwierzytelniania.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Wprowadź numer telefonu, który posłuży jako metoda uwierzytelniania';

  @override
  String get sendCode => 'Wyślij kod';

  @override
  String errorSendingCode(String error) {
    return 'Błąd wysyłania kodu: $error';
  }

  @override
  String get copy => 'Kopiuj';

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Wpisz tutaj 6-cyfrowy kod';

  @override
  String digitsCode(int count) {
    return 'Kod $count-cyfrowy';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Wprowadź 32-znakowy klucz w aplikacji uwierzytelniającej lub zeskanuj poniższy kod QR';

  @override
  String get applyChanges => 'Zastosuj zmiany';

  @override
  String get discardChanges => 'Odrzuć zmiany';

  @override
  String get yesDiscard => 'Tak, odrzuć';

  @override
  String get thisActionCannotBeUndone => 'Tej akcji nie można cofnąć';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Uwierzytelnianie dwuskładnikowe chroni Twoje konto przed nieautoryzowanym dostępem. Wystarczy, że podczas logowania wpiszesz kod zabezpieczający.';

  @override
  String get calculatedField => 'Pole obliczeniowe';

  @override
  String get apiKey => 'Klucz API';

  @override
  String get aiModel => 'Model AI';

  @override
  String get adminSettings => 'Ustawienia administratora';

  @override
  String get job => 'Zadanie';

  @override
  String get mobileAppBundle => 'Pakiet mobilny';

  @override
  String get mobileApp => 'Aplikacja mobilna';

  @override
  String get domain => 'Domena';

  @override
  String get oauth2Client => 'Klient OAuth 2.0';

  @override
  String get queueStats => 'Statystyki kolejek';

  @override
  String get phoneIsRequired => 'Telefon jest wymagany';

  @override
  String get phoneIsInvalid => 'Telefon jest nieprawidłowy';

  @override
  String get addVerificationMethod => 'Dodaj metodę weryfikacji';

  @override
  String get imageSavedToGallery => 'Zapisano w „Galerii obrazów” platformy';

  @override
  String get failedToSaveImage => 'Nie udało się zapisać obrazu';

  @override
  String nSelected(int count) {
    return 'Wybrano: $count';
  }

  @override
  String get selectAll => 'Zaznacz wszystkie';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operacji nie powiodło się',
      few: '$count operacje nie powiodły się',
      one: '$count operacja nie powiodła się',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usunąć $count powiadomień?',
      few: 'Usunąć $count powiadomienia?',
      one: 'Usunąć $count powiadomienie?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Oznaczyć $count powiadomień jako przeczytane?',
      few: 'Oznaczyć $count powiadomienia jako przeczytane?',
      one: 'Oznaczyć $count powiadomienie jako przeczytane?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Pobieranie danych z Twojego hosta $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Logowanie do hosta $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Przełączanie na nowy host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Nie udało się uzyskać tokenu logowania z $host. Zeskanuj nowy kod QR.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Nie udało się połączyć z $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host nie jest serwerem ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Sesja kodu QR nie jest już ważna. Odśwież kod QR i zeskanuj ponownie.';

  @override
  String get openThisLinkTitle => 'Otworzyć ten link?';

  @override
  String get linkOpensSignInPage =>
      'Ten link otwiera stronę logowania tego serwera. Nastąpi wylogowanie z bieżącego serwera.';

  @override
  String get linkOpensSignInPageOnly =>
      'Ten link otwiera stronę logowania tego serwera.';

  @override
  String linkSignsInAs(Object email) {
    return 'Ten link loguje Cię do tego serwera jako $email.';
  }

  @override
  String get linkSignsIn => 'Ten link loguje Cię do tego serwera.';

  @override
  String get serverConnectionNotSecure =>
      'Ten serwer nie używa bezpiecznego połączenia.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Ta aplikacja współpracuje tylko z własnym serwerem i nie może otworzyć tego linku.';

  @override
  String get liveTrackingActive => 'Śledzenie lokalizacji na żywo';

  @override
  String get liveTrackingPaused => 'Śledzenie na żywo wstrzymane';

  @override
  String get liveTrackingFixes => 'Odczyty';

  @override
  String get liveTrackingSaved => 'Zapisane';

  @override
  String get liveTrackingErrors => 'Błędy';

  @override
  String get liveTrackingStop => 'Zatrzymaj';

  @override
  String get liveTrackingPause => 'Wstrzymaj';

  @override
  String get liveTrackingResume => 'Wznów';

  @override
  String get liveTrackingHide => 'Ukryj';

  @override
  String get liveTrackingSessionTitle => 'Śledzenie lokalizacji na żywo';

  @override
  String get liveTrackingTarget => 'Zapisz lokalizację w obiekcie';

  @override
  String get liveTrackingDashboard => 'Pulpit';

  @override
  String get liveTrackingStatus => 'Status';

  @override
  String get liveTrackingStarted => 'Czas rozpoczęcia';

  @override
  String get liveTrackingLastFix => 'Ostatni odczyt';

  @override
  String get liveTrackingLastError => 'Ostatni błąd';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Nie można zapisać do tego obiektu — już nie istnieje. Śledzenie jest kontynuowane; zaktualizuj cel w akcji pulpitu.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Brak połączenia z serwerem. Te odczyty nie zostały zapisane — zapisywanie zostanie wznowione po przywróceniu połączenia.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Twoja sesja zakończyła się. Zaloguj się ponownie, aby nadal zapisywać lokalizację.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Nie można zapisać do tego obiektu — nie masz uprawnień. Śledzenie jest kontynuowane; poproś administratora o nadanie dostępu.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Nie udało się zapisać tego odczytu na serwerze. Zapis zostanie ponowiony przy kolejnym odczycie.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Usługi lokalizacji są wyłączone na tym urządzeniu.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Odmówiono uprawnienia do lokalizacji.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Uprawnienie do lokalizacji zostało trwale odrzucone. Włącz je w ustawieniach aplikacji.';

  @override
  String get liveTrackingErrorLocation =>
      'Nie udało się uzyskać odczytu lokalizacji.';

  @override
  String get liveTrackingMenuTitle => 'Śledzenie lokalizacji na żywo';

  @override
  String get liveTrackingNoRecord =>
      'Brak aktywnego śledzenia i brak ostatniej sesji.';

  @override
  String get liveTrackingLastSession => 'Ostatnia sesja';

  @override
  String get liveTrackingStartAgain => 'Rozpocznij ponownie';

  @override
  String get liveTrackingEnded => 'Czas zakończenia';

  @override
  String get liveTrackingEndReason => 'Powód zakończenia';

  @override
  String get liveTrackingEndReasonManual => 'Zatrzymano ręcznie';

  @override
  String get liveTrackingEndReasonMaxDuration =>
      'Osiągnięto maks. czas trwania';

  @override
  String get liveTrackingEndReasonInterrupted => 'Przerwano';

  @override
  String get serverUpdateRequired => 'Wymagana aktualizacja serwera';

  @override
  String get backToLogin => 'Powrót do logowania';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Ta aplikacja działa z platformą ThingsBoard w wersji $minVersion lub nowszej.';
  }

  @override
  String get serverLabel => 'Serwer';

  @override
  String get versionLabel => 'Wersja';

  @override
  String get askAdminToUpdateServer =>
      'Poproś administratora serwera o jego aktualizację.';

  @override
  String get deviceClaimFailed =>
      'Nie udało się przejąć urządzenia. Spróbuj ponownie.';

  @override
  String get deviceToClaimNotFound =>
      'Nie znaleziono urządzenia. Skontaktuj się z dostawcą urządzenia.';

  @override
  String get enableAuthenticatorApp => 'Włącz aplikację uwierzytelniającą';

  @override
  String get enableSmsAuthenticator => 'Włącz uwierzytelnianie SMS';

  @override
  String get enableEmailAuthenticator => 'Włącz uwierzytelnianie e-mail';

  @override
  String get getBackupCode => 'Uzyskaj kod zapasowy';

  @override
  String get twoFaTotpDescription =>
      'Do uwierzytelniania użyj na swoim telefonie aplikacji takich jak Google Authenticator, Authy lub Duo. Aplikacja wygeneruje kod zabezpieczający do logowania.';

  @override
  String get twoFaSmsDescription =>
      'Użyj telefonu do uwierzytelnienia. Przy logowaniu wyślemy Ci kod zabezpieczający SMS-em.';

  @override
  String get twoFaEmailDescription =>
      'Do uwierzytelnienia użyj kodu zabezpieczającego wysłanego na Twój adres e-mail.';

  @override
  String get twoFaBackupCodeDescription =>
      'Te jednorazowe kody do wydrukowania umożliwiają logowanie się, gdy nie masz przy sobie telefonu, na przykład podczas podróży.';

  @override
  String get openInAuthenticatorApp => 'Otwórz w aplikacji uwierzytelniającej';

  @override
  String get noAuthenticatorAppFound =>
      'Nie znaleziono aplikacji uwierzytelniającej. Zamiast tego możesz skopiować klucz do swojej aplikacji.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Włączono: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Twój administrator wymaga uwierzytelniania dwuskładnikowego dla $email.';
  }

  @override
  String get recommended => 'Zalecane';

  @override
  String get addBackupCodesHint =>
      'Dodaj także kody zapasowe, aby móc się zalogować w razie utraty telefonu.';

  @override
  String get totpSecretKey => 'Tajny klucz';

  @override
  String get backupCodesDescription =>
      'Wydrukuj kody, aby mieć je pod ręką, gdy będą potrzebne do zalogowania się na konto. Każdego kodu zapasowego możesz użyć tylko raz.';

  @override
  String get backupCodesWarning =>
      'Po opuszczeniu tej strony nie będzie można ponownie wyświetlić tych kodów. Przechowuj je w bezpiecznym miejscu, korzystając z poniższych opcji.';

  @override
  String get downloadTxt => 'Pobierz (txt)';
}
