// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class SCs extends S {
  SCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Domů';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zařízení',
      one: 'Zařízení',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Více';

  @override
  String get customers => 'Zákazníci';

  @override
  String get assets => 'Aktiva';

  @override
  String get tenants => 'Tenanti';

  @override
  String get auditLogs => 'Záznamy auditu';

  @override
  String get noCustomersFound => 'Žádní zákazníci nebyli nalezeni';

  @override
  String get noAssetsFound => 'Žádná aktiva nebyla nalezena';

  @override
  String get noTenantsFound => 'Žádní tenanti nebyli nalezeni';

  @override
  String get noDevicesFound => 'Žádná zařízení nebyla nalezena';

  @override
  String get noAuditLogsFound => 'Nebyly nalezeny žádné záznamy auditu';

  @override
  String get logout => 'Odhlásit se';

  @override
  String get login => 'Přihlásit se';

  @override
  String get loginToYourAccount => 'Přihlášení k účtu';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalidText => 'Neplatný formát e-mailu.';

  @override
  String get username => 'uživatelské jméno';

  @override
  String get password => 'Heslo';

  @override
  String get passwordForgotText => 'Zapomněli jste heslo?';

  @override
  String get passwordReset => 'Reset hesla';

  @override
  String get passwordResetText =>
      'Zadejte e-mail přiřazený k vašemu účtu a zašleme vám e-mail s odkazem pro reset hesla';

  @override
  String get requestPasswordReset => 'Vyžádat reset hesla';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Odkaz na ověření e-mailu byl úspěšně odeslán!';

  @override
  String get or => 'NEBO';

  @override
  String get no => 'Ne';

  @override
  String get yes => 'Ano';

  @override
  String get title => 'Název';

  @override
  String get country => 'Stát';

  @override
  String get city => 'Město';

  @override
  String get stateOrProvince => 'Region';

  @override
  String get postalCode => 'PSČ';

  @override
  String get address => 'Adresa';

  @override
  String get address2 => 'Adresa 2';

  @override
  String get phone => 'Telefon';

  @override
  String get alarmClearTitle => 'Vyřešit alarm';

  @override
  String get alarmClearText => 'Jste si jisti, že chcete alarm vyřešit?';

  @override
  String get alarmAcknowledgeTitle => 'Přijmout alarm';

  @override
  String get alarmAcknowledgeText => 'Jste si jisti, že chcete přijmout alarm?';

  @override
  String get assetName => 'Název aktiva';

  @override
  String get type => 'Typ';

  @override
  String get label => 'Označení';

  @override
  String get auditLogDetails => 'Detail záznamu auditu';

  @override
  String get customerDetails => 'Detail zákazníka';

  @override
  String get assetDetails => 'Detail aktiva';

  @override
  String get tenantDetails => 'Detail tenanta';

  @override
  String get entityType => 'Typ entity';

  @override
  String get actionData => 'Data akce';

  @override
  String get failureDetails => 'Detail chyby';

  @override
  String get allDevices => 'Všechna zařízení';

  @override
  String get active => 'Aktivní';

  @override
  String get inactive => 'Neaktivní';

  @override
  String get deviceActive => 'Aktivní';

  @override
  String get deviceInactive => 'Neaktivní';

  @override
  String get activeDevices => 'Aktivní';

  @override
  String get inactiveDevices => 'Neaktivní';

  @override
  String get alarmStatusActiveAcknowledged => 'Aktivní přijaté';

  @override
  String get alarmStatusActiveUnacknowledged => 'Aktivní nepřijaté';

  @override
  String get alarmStatusClearedAcknowledged => 'Vyřešené přijaté';

  @override
  String get alarmStatusClearedUnacknowledged => 'Vyřešené nepřijaté';

  @override
  String get alarmStatusFilterActive => 'Aktivní';

  @override
  String get systemAdministrator => 'Systémový administrátor';

  @override
  String get tenantAdministrator => 'Administrátor tenanta';

  @override
  String get customer => 'Zákazník';

  @override
  String get changePassword => 'Změnit heslo';

  @override
  String get currentPasswordRequireText => 'Stávající heslo je povinné.';

  @override
  String get currentPassword => 'Stávající heslo';

  @override
  String get newPasswordRequireText => 'Nové heslo je povinné.';

  @override
  String get newPassword => 'Nové heslo';

  @override
  String get newPassword2RequireText => 'Potvrzení nového hesla je povinné.';

  @override
  String get newPassword2 => 'Potvrzení nového hesla';

  @override
  String get passwordErrorNotification => 'Zadaná hesla se musí shodovat!';

  @override
  String get profileSuccessNotification => 'Profil byl úspěšně aktualizován';

  @override
  String get passwordSuccessNotification => 'Heslo bylo úspěšně změněno';

  @override
  String get notImplemented => 'Není implementováno!';

  @override
  String get listIsEmptyText => 'Seznam je momentálně prázdný.';

  @override
  String get tryAgain => 'Zkusit znovu';

  @override
  String get verifyYourIdentity => 'Ověřte svou identitu';

  @override
  String get continueText => 'Pokračovat';

  @override
  String get resendCode => 'Znovu odeslat kód';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time vteřin',
      many: '$time vteřiny',
      few: '$time vteřiny',
      one: '$time vteřinu',
    );
    return 'Odeslat kód znovu za $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Zadejte bezpečnostní kód z vaší ověřovací aplikace.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Bezpečnostní kód byl odeslán na vaše telefonní číslo $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Bezpečnostní kód byl odeslán na vaši e-mailovou adresu $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Zadejte jeden ze svých záložních kódů.';

  @override
  String get toptAuthPlaceholder => 'Kód';

  @override
  String get smsAuthPlaceholder => 'Kód ze SMS';

  @override
  String get emailAuthPlaceholder => 'Kód z e-mailu';

  @override
  String get backupCodeAuthPlaceholder => 'Záložní kód';

  @override
  String get verificationCodeIncorrect => 'Ověřovací kód je nesprávný';

  @override
  String get verificationCodeManyRequest =>
      'Příliš mnoho požadavků na ověření kódu';

  @override
  String get tryAnotherWay => 'Zkusit jiný způsob';

  @override
  String get selectWayToVerify => 'Vyberte způsob ověření';

  @override
  String get mfaProviderTopt => 'Ověřovací aplikace';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'E-mail';

  @override
  String get mfaProviderBackupCode => 'Záložní kód';

  @override
  String get newUserText => 'Nový uživatel?';

  @override
  String get createAccount => 'Vytvořit účet';

  @override
  String get emailVerification => 'Ověření e-mailu';

  @override
  String get emailVerificationSentText =>
      'E-mail s ověřovacími údaji byl odeslán na zadanou e-mailovou adresu ';

  @override
  String get emailVerificationInstructionsText =>
      'Postupujte prosím podle pokynů uvedených v e-mailu pro dokončení registrace. Poznámka: pokud jste e-mail delší dobu neviděli, zkontrolujte složku \'spam\' nebo zkuste odeslat e-mail znovu kliknutím na tlačítko \'Odeslat znovu\'.';

  @override
  String get resend => 'Odeslat znovu';

  @override
  String get activatingAccount => 'Aktivace účtu...';

  @override
  String get accountActivated => 'Účet byl úspěšně aktivován!';

  @override
  String get emailVerified => 'E-mail ověřen';

  @override
  String get activatingAccountText =>
      'Váš účet se právě aktivuje.\nPočkejte prosím...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Blahopřejeme!\nVáš účet $appTitle byl aktivován.\nNyní se můžete přihlásit do svého prostoru $appTitle.';
  }

  @override
  String get privacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get cancel => 'Storno';

  @override
  String get accept => 'Přijmout';

  @override
  String get termsOfUse => 'Podmínky použití';

  @override
  String get firstName => 'Jméno';

  @override
  String get lastName => 'Příjmení';

  @override
  String get imNotARobot => 'Nejsem robot';

  @override
  String get signUp => 'Zaregistrovat se';

  @override
  String get alreadyHaveAnAccount => 'Již máte účet?';

  @override
  String get signIn => 'Přihlásit se';

  @override
  String get inactiveUserAlreadyExists => 'Neaktivní uživatel již existuje';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Již existuje zaregistrovaný uživatel s neověřenou e-mailovou adresou.\nPokud chcete ověřovací e-mail odeslat znovu, klikněte na tlačítko \'Odeslat znovu\'.';

  @override
  String get assignee => 'Řešitel';

  @override
  String get alarmTypes => 'Typy alarmů';

  @override
  String get details => 'Detail';

  @override
  String get status => 'Stav';

  @override
  String get severity => 'Závažnost';

  @override
  String get originator => 'Původce';

  @override
  String get startTime => 'Čas zahájení';

  @override
  String get duration => 'Doba trvání';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value dní',
      many: '$value dne',
      few: '$value dny',
      one: '$value den',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value hodin',
      many: '$value hodiny',
      few: '$value hodiny',
      one: '$value hodina',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value minut',
      many: '$value minuty',
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
      other: '$value vteřin',
      many: '$value vteřiny',
      few: '$value vteřiny',
      one: '$value vteřina',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Zobrazit dashboard';

  @override
  String get activity => 'Aktivita';

  @override
  String get addCommentMessage => 'Přidejte komentář...';

  @override
  String get clear => 'Vyřešit';

  @override
  String get acknowledge => 'Přijmout';

  @override
  String get edit => 'Editovat';

  @override
  String get editProfile => 'Editovat profil';

  @override
  String get delete => 'Smazat';

  @override
  String get edited => 'Editováno';

  @override
  String get deleteComment => 'Smazat komentář';

  @override
  String get areYouSure => 'Jste si jisti?';

  @override
  String get noResultsFound => 'Nebyly nalezeny žádné výsledky';

  @override
  String get tryRefiningYourQuery => 'Zkuste upřesnit svůj dotaz';

  @override
  String get failedToLoadTheList => 'Nepodařilo se načíst seznam';

  @override
  String get tryRefreshing => 'Zkuste obnovit';

  @override
  String get refresh => 'Obnovit';

  @override
  String get users => 'Uživatelé';

  @override
  String get unassigned => 'Nepřiřazeno';

  @override
  String get failedToLoadAlarmDetails => 'Nepodařilo se načíst detail alarmu';

  @override
  String get somethingWentWrong => 'Něco se pokazilo';

  @override
  String get chooseRegion => 'Zvolte region';

  @override
  String get regions => 'Regiony';

  @override
  String get selectRegion => 'Vyberte region';

  @override
  String get northAmerica => 'Severní Amerika';

  @override
  String get europe => 'Evropa';

  @override
  String get northAmericaRegionShort => 'Sev. Virginie';

  @override
  String get europeRegionShort => 'Frankfurt';

  @override
  String get deviceList => 'Seznam zařízení';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dashboardy',
      one: 'Dashboard',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Vyžadována aktualizace';

  @override
  String updateTo(Object version) {
    return 'Aktualizovat na $version';
  }

  @override
  String get next => 'Další';

  @override
  String get confirmation => 'Potvrzení';

  @override
  String get wifiPassword => 'Heslo Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Chcete-li pokračovat v nastavení zařízení $deviceName, zadejte přístupové údaje k síti.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Zadejte heslo pro $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Nemáte dostatečná oprávnění pro „$permissions“, abyste mohli pokračovat. Udělte prosím požadovaná oprávnění a klepněte na „Zkusit znovu“.';
  }

  @override
  String get sendingWifiCredentials => 'Odesílání přístupových údajů Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Ověřování připojení Wi-Fi';

  @override
  String get provisionedSuccessfully => 'Zařízení bylo úspěšně zřízeno';

  @override
  String get returnToDashboard => 'Zpět na dashboard';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Nelze navázat relaci se zařízením $deviceName. Zkuste to prosím znovu';
  }

  @override
  String get claimingDevice => 'Získávání zařízení';

  @override
  String get claimingMessageSuccess => 'Zařízení bylo\núspěšně získáno';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Nemáte dostatečná oprávnění pro „$permissions“, abyste mohli pokračovat. Otevřete prosím nastavení aplikace, udělte oprávnění a klepněte na „Zkusit znovu“.';
  }

  @override
  String get scanACode => 'Naskenovat kód';

  @override
  String get allowAccess => 'Povolit přístup';

  @override
  String get toggleCamera => 'Přepnout kameru';

  @override
  String get toggleFlash => 'Přepnout blesk';

  @override
  String get unableToUseCamera => 'Nelze použít kameru';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Pro pokračování otevřete nastavení a udělte přístup ke kameře';

  @override
  String get notFound => 'Nenalezeno';

  @override
  String routeNotDefined(Object name) {
    return 'Trasa není definována: $name';
  }

  @override
  String get loginWith => 'PŘIHLÁSIT SE PŘES';

  @override
  String get scanQrCode => 'Naskenovat QR kód';

  @override
  String get searchResults => 'Výsledky vyhledávání';

  @override
  String get viewAll => 'Zobrazit vše';

  @override
  String get requestedEntityDoesNotExists => 'Požadovaná entita neexistuje.';

  @override
  String get noAlarmsFound => 'Žádné alarmy nebyly nalezeny';

  @override
  String get filters => 'Filtry';

  @override
  String get alarmStatusList => 'Seznam stavů alarmu';

  @override
  String get alarmSeverityList => 'Seznam závažností alarmu';

  @override
  String get cleared => 'Vyřešené';

  @override
  String get acknowledged => 'Přijaté';

  @override
  String get unacknowledged => 'Nepřijaté';

  @override
  String get critical => 'Kritická';

  @override
  String get major => 'Vysoká';

  @override
  String get minor => 'Nízká';

  @override
  String get warning => 'Varování';

  @override
  String get indeterminate => 'Neurčená';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vyhledat uživatele',
      many: 'Vyhledat uživatele',
      few: 'Vyhledat uživatele',
      one: 'Vyhledat uživatele',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Resetovat';

  @override
  String get update => 'Aktualizovat';

  @override
  String get alarmTypeList => 'Seznam typů alarmů';

  @override
  String get anyType => 'Všechny typy';

  @override
  String get plusAlarmType => '+ Typ alarmu';

  @override
  String get all => 'Vše';

  @override
  String get allNotifications => 'Všechna';

  @override
  String get unread => 'Nepřečtená';

  @override
  String get close => 'Zavřít';

  @override
  String get fatalError => 'Kritická chyba';

  @override
  String get unknownError => 'Neznámá chyba.';

  @override
  String get sessionExpired => 'Relace vypršela';

  @override
  String get fatalApplicationErrorOccurred =>
      'Došlo ke kritické chybě aplikace:';

  @override
  String get connectionError => 'Chyba připojení';

  @override
  String get failedToConnectToServer => 'Nepodařilo se připojit k serveru';

  @override
  String get retry => 'Opakovat';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Mobilní dashboard musí být nakonfigurován v profilu zařízení!';

  @override
  String get openWifiSettings => 'Otevřít nastavení Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Připojte se k Wi-Fi, kterou běžně používáte';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Vraťte se do aplikace a klepněte na tlačítko Hotovo';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Postupujte podle následujících kroků a znovu připojte\nsvůj telefon ke své běžné Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Push oznámení nejsou nakonfigurována.\nKontaktujte prosím systémového administrátora.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebase není nakonfigurován.\n Pokyny, jak to provést, najdete v oficiální\n dokumentaci Firebase.';

  @override
  String get markAllAsRead => 'Označit vše jako přečtené';

  @override
  String get profile => 'Profil';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Nelze otevřít URL: $link';
  }

  @override
  String get noDashboardsFound => 'Žádné dashboardy nebyly nalezeny';

  @override
  String get openAppSettings => 'Otevřít nastavení aplikace';

  @override
  String get connectingToDevice => 'Připojování k zařízení';

  @override
  String get connectToDevice => 'Připojit k zařízení';

  @override
  String get selectWifiNetwork => 'Vybrat Wi-Fi síť';

  @override
  String get deviceProvisioning => 'Zřízení zařízení';

  @override
  String get permissions => 'Oprávnění';

  @override
  String get unableConnectToDevice => 'Nelze se připojit k zařízení';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Zařízení nenalezlo v okolí žádnou Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Připojení k Wi-Fi síti $name se nezdařilo.\nZkontrolujte prosím, že je váš telefon připojen k Wi-Fi síti zařízení a že je v nastavení telefonu pro tuto aplikaci povolen přístup k místní síti.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Nelze se připojit k Wi-Fi, protože zařízení $name nenašlo žádné sítě';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Pro připojení telefonu k zařízení postupujte podle následujících kroků';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Připojte se k síti Wi-Fi s názvem podobným $wifiName';
  }

  @override
  String get ready => 'Hotovo';

  @override
  String get exitDeviceProvisioning => 'Ukončit zřizování zařízení';

  @override
  String get noNotificationsFound => 'Nebyla nalezena žádná oznámení';

  @override
  String get markAsRead => 'Označit jako přečtené';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Naskenujte QR kód na vašem zařízení';

  @override
  String get search => 'Vyhledat';

  @override
  String get tenant => 'Tenant';

  @override
  String get tenantProfile => 'Profil tenanta';

  @override
  String get user => 'Uživatel';

  @override
  String get asset => 'Aktivum';

  @override
  String get deviceProfile => 'Profil zařízení';

  @override
  String get assetProfile => 'Profil aktiva';

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
  String get ruleChain => 'Řetěz pravidel';

  @override
  String get ruleNode => 'Uzel pravidla';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Entitní pohled';

  @override
  String get widgetsBundle => 'Kategorie widgetů';

  @override
  String get widgetType => 'Typ widgetu';

  @override
  String get apiUsageState => 'Stav využití API';

  @override
  String get tbResource => 'Zdroj';

  @override
  String get otaPackage => 'OTA balíček';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Fronta';

  @override
  String get notificationTarget => 'Příjemce oznámení';

  @override
  String get notificationTemplate => 'Šablona oznámení';

  @override
  String get notificationRequest => 'Požadavek na oznámení';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Oznámení',
      one: 'Oznámení',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Pravidlo oznámení';

  @override
  String get entityGroup => 'Skupina entit';

  @override
  String get converter => 'Převodník dat';

  @override
  String get integration => 'Integrace';

  @override
  String get schedulerEvent => 'Událost plánovače';

  @override
  String get blobEntity => 'Entita Blob';

  @override
  String get role => 'Role';

  @override
  String get groupPermission => 'Oprávnění skupiny';

  @override
  String get actionStatusSuccess => 'Úspěch';

  @override
  String get actionStatusFailure => 'Chyba';

  @override
  String get actionTypeAdded => 'Přidáno';

  @override
  String get actionTypeDeleted => 'Smazáno';

  @override
  String get actionTypeUpdated => 'Aktualizováno';

  @override
  String get actionTypeAttributesUpdated => 'Atributy aktualizovány';

  @override
  String get actionTypeAttributesDeleted => 'Atributy smazány';

  @override
  String get actionTypeRpcCall => 'RPC volání';

  @override
  String get actionTypeCredentialsUpdated => 'Přístupové údaje aktualizovány';

  @override
  String get actionTypeAssignedToCustomer => 'Přiřazeno zákazníkovi';

  @override
  String get actionTypeUnassignedFromCustomer => 'Odebráno zákazníkovi';

  @override
  String get actionTypeActivated => 'Aktivováno';

  @override
  String get actionTypeSuspended => 'Deaktivováno';

  @override
  String get actionTypeCredentialsRead => 'Přístupové údaje zobrazeny';

  @override
  String get actionTypeAttributesRead => 'Atributy zobrazeny';

  @override
  String get actionTypeRelationAddOrUpdate => 'Vztah aktualizován';

  @override
  String get actionTypeRelationDeleted => 'Vztah smazán';

  @override
  String get actionTypeRelationsDeleted => 'Všechny vztahy smazány';

  @override
  String get actionTypeAlarmAck => 'Alarm přijat';

  @override
  String get actionTypeAlarmClear => 'Alarm vyřešen';

  @override
  String get actionTypeAlarmDelete => 'Alarm smazán';

  @override
  String get actionTypeAlarmAssigned => 'Alarm přiřazen';

  @override
  String get actionTypeAlarmUnassigned => 'Přiřazení alarmu zrušeno';

  @override
  String get actionTypeLogin => 'Přihlášení';

  @override
  String get actionTypeLogout => 'Odhlášení';

  @override
  String get actionTypeLockout => 'Zablokování';

  @override
  String get actionTypeAssignedFromTenant => 'Přiřazeno od tenanta';

  @override
  String get actionTypeAssignedToTenant => 'Přiřazeno tenantovi';

  @override
  String get actionTypeProvisionSuccess => 'Zařízení zřízeno';

  @override
  String get actionTypeProvisionFailure => 'Zřízení zařízení selhalo';

  @override
  String get actionTypeTimeseriesUpdated => 'Telemetrie aktualizována';

  @override
  String get actionTypeTimeseriesDeleted => 'Telemetrie smazána';

  @override
  String get actionTypeAssignedToEdge => 'Přiřazeno k instanci Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Odebráno z instance Edge';

  @override
  String get actionTypeAddedComment => 'Komentář přidán';

  @override
  String get actionTypeUpdatedComment => 'Komentář aktualizován';

  @override
  String get actionTypeDeletedComment => 'Komentář smazán';

  @override
  String get actionTypeSmsSent => 'SMS odeslána';

  @override
  String get actionTypeAddedToEntityGroup => 'Přidáno do skupiny entit';

  @override
  String get actionTypeRemovedFromEntityGroup => 'Odebráno ze skupiny entit';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Volání REST API enginu pro zpracování pravidel';

  @override
  String get actionTypeMadePublic => 'Zveřejněno';

  @override
  String get actionTypeMadePrivate => 'Nastaveno jako soukromé';

  @override
  String get actionTypeChangeOwner => 'Vlastník změněn';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Nemáte oprávnění k provedení této operace!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Zdá se, že vaše oprávnění nejsou dostatečná k provedení této operace';

  @override
  String fieldIsRequired(String field) {
    return '$field je povinný údaj.';
  }

  @override
  String get no2faProvidersFound => 'Nebyli nalezeni žádní poskytovatelé 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Kontaktujte prosím svého systémového administrátora';

  @override
  String errorOccured(Object e) {
    return 'Došlo k chybě: $e';
  }

  @override
  String get unsavedChanges => 'Neuložené změny';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Některé změny nebyly uloženy. Jste si jisti, že chcete tuto stránku opustit?';

  @override
  String get deleteAccount => 'Smazat účet';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Jste si jisti? Chystáte se smazat svůj účet ($authority).';
  }

  @override
  String get language => 'Jazyk';

  @override
  String get metricUnitSystem => 'Metrická';

  @override
  String get imperialUnitSystem => 'Imperiální';

  @override
  String get hybridUnitSystem => 'Hybridní';

  @override
  String get autoUnitSystem => 'Automaticky';

  @override
  String get languageAuto => 'Automaticky';

  @override
  String get unitSystem => 'Soustava jednotek';

  @override
  String get selectCountry => 'Vybrat zemi';

  @override
  String get hideHomeDashboardToolbar =>
      'Skrýt nástrojovou lištu na výchozím dashboardu';

  @override
  String get phoneNumberHelperText =>
      'Telefonní číslo ve formátu E.164, např. +1201550123';

  @override
  String get homeDashboard => 'Výchozí dashboard';

  @override
  String get security => 'Zabezpečení';

  @override
  String get twofactorAuthentication => 'Dvoufaktorové ověřování';

  @override
  String get verificationRequired => 'Vyžadováno ověření';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Dvoufaktorové ověřování je povinné';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Nastavte metodu ověření pro pokračování v přihlášení';

  @override
  String get setUpAVerificationMethod => 'Nastavit metodu ověření';

  @override
  String get totpSetupSuccessDescription =>
      'Při příštím přihlášení budete muset zadat kód dvoufaktorového ověření';

  @override
  String get smsSetupSuccessDescription =>
      'Při příštím přihlášení budete vyzváni k zadání bezpečnostního kódu, který bude odeslán na telefonní číslo';

  @override
  String get emailSetupSuccessDescription =>
      'Při příštím přihlášení budete vyzváni k zadání bezpečnostního kódu, který bude odeslán na vaši e-mailovou adresu';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Při příštím přihlášení budete moci použít záložní kódy k dokončení dvoufaktorového ověření';

  @override
  String get loginToApp => 'Přihlásit se do aplikace';

  @override
  String get goBack => 'Zpět';

  @override
  String get done => 'Hotovo';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Tím bude váš účet méně zabezpečený';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Jste si jisti, že chcete deaktivovat metodu ověření „$providerName“?';
  }

  @override
  String get yesDeactivate => 'Ano, deaktivovat';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Zadejte e-mailovou adresu, kterou chcete používat k ověřování.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Zadejte telefonní číslo, které chcete používat k ověřování';

  @override
  String get sendCode => 'Odeslat kód';

  @override
  String get copy => 'Kopírovat';

  @override
  String get copiedToClipboard => 'Zkopírováno do schránky';

  @override
  String get enter6digitsKeyFromYourAppHere => 'Zadejte sem šestimístný kód';

  @override
  String digitsCode(int count) {
    return '${count}místný kód';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Zkopírujte 32znakový klíč do své ověřovací aplikace nebo naskenujte níže uvedený QR kód';

  @override
  String get applyChanges => 'Uložit změny';

  @override
  String get discardChanges => 'Zahodit změny';

  @override
  String get yesDiscard => 'Ano, zahodit';

  @override
  String get thisActionCannotBeUndone => 'Tuto akci nelze vrátit zpět';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Dvoufaktorové ověřování chrání váš účet před neoprávněným přístupem. Stačí při přihlášení zadat bezpečnostní kód.';

  @override
  String get calculatedField => 'Vypočítané pole';

  @override
  String get apiKey => 'Klíč API';

  @override
  String get aiModel => 'Model AI';

  @override
  String get adminSettings => 'Administrátorská nastavení';

  @override
  String get job => 'Úloha';

  @override
  String get mobileAppBundle => 'Mobilní balíček';

  @override
  String get mobileApp => 'Mobilní aplikace';

  @override
  String get domain => 'Doména';

  @override
  String get oauth2Client => 'Klient OAuth 2.0';

  @override
  String get queueStats => 'Statistiky fronty';

  @override
  String get phoneIsRequired => 'Telefon je povinný.';

  @override
  String get phoneIsInvalid => 'Neplatný telefon.';

  @override
  String get addVerificationMethod => 'Přidat metodu ověření';

  @override
  String get imageSavedToGallery => 'Uloženo do \'Galerie obrázků\' platformy';

  @override
  String get failedToSaveImage => 'Nepodařilo se uložit obrázek';

  @override
  String nSelected(int count) {
    return 'Vybráno: $count';
  }

  @override
  String get selectAll => 'Vybrat všechna načtená';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count operací selhalo',
      many: '$count operace selhalo',
      few: '$count operace selhaly',
      one: '1 operace selhala',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Smazat $count oznámení?',
      many: 'Smazat $count oznámení?',
      few: 'Smazat $count oznámení?',
      one: 'Smazat 1 oznámení?',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Označit $count oznámení jako přečtená?',
      many: 'Označit $count oznámení jako přečtená?',
      few: 'Označit $count oznámení jako přečtená?',
      one: 'Označit 1 oznámení jako přečtené?',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Získávání dat z vašeho hostitele $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Přihlašování k hostiteli $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Přepínání na nového hostitele $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Nepodařilo se získat přihlašovací token z $host. Naskenujte prosím nový QR kód.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Nepodařilo se připojit k $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host není server ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Relace QR kódu již není platná. Obnovte QR kód a naskenujte jej znovu.';

  @override
  String get openThisLinkTitle => 'Otevřít tento odkaz?';

  @override
  String get linkOpensSignInPage =>
      'Tento odkaz otevře přihlašovací stránku tohoto serveru. Budete odhlášeni ze stávajícího serveru.';

  @override
  String get linkOpensSignInPageOnly =>
      'Tento odkaz otevře přihlašovací stránku tohoto serveru.';

  @override
  String linkSignsInAs(Object email) {
    return 'Tento odkaz vás přihlásí k tomuto serveru jako $email.';
  }

  @override
  String get linkSignsIn => 'Tento odkaz vás přihlásí k tomuto serveru.';

  @override
  String get serverConnectionNotSecure =>
      'Tento server nepoužívá zabezpečené připojení.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Tato aplikace funguje pouze s vlastním serverem a nemůže tento odkaz otevřít.';

  @override
  String get liveTrackingActive => 'Živé sledování polohy';

  @override
  String get liveTrackingPaused => 'Živé sledování pozastaveno';

  @override
  String get liveTrackingFixes => 'Zaměření';

  @override
  String get liveTrackingSaved => 'Uloženo';

  @override
  String get liveTrackingErrors => 'Chyby';

  @override
  String liveTrackingCount(String label, int value) {
    return '$label: $value';
  }

  @override
  String get liveTrackingStop => 'Zastavit';

  @override
  String get liveTrackingPause => 'Pozastavit';

  @override
  String get liveTrackingResume => 'Pokračovat';

  @override
  String get liveTrackingHide => 'Skrýt';

  @override
  String get liveTrackingSessionTitle => 'Živé sledování polohy';

  @override
  String get liveTrackingTarget => 'Uložit polohu do entity';

  @override
  String get liveTrackingDashboard => 'Dashboard';

  @override
  String get liveTrackingStatus => 'Stav';

  @override
  String get liveTrackingStarted => 'Čas zahájení';

  @override
  String get liveTrackingLastFix => 'Poslední zaměření';

  @override
  String get liveTrackingLastError => 'Poslední chyba';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Nelze uložit do této entity – již neexistuje. Sledování pokračuje; aktualizujte cíl v akci dashboardu.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Není připojení k serveru. Tato zaměření nebyla uložena – ukládání bude pokračovat, jakmile budete opět online.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Vaše relace skončila. Přihlaste se znovu, abyste mohli nadále ukládat polohu.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Nelze uložit do této entity – nemáte oprávnění. Sledování pokračuje; požádejte svého administrátora o udělení přístupu.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Toto zaměření se nepodařilo uložit na server. Ukládání bude opakováno s dalším zaměřením.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Služby určování polohy jsou na tomto zařízení vypnuté.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Oprávnění k poloze bylo zamítnuto.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Oprávnění k poloze je trvale zamítnuto. Povolte je v nastavení aplikace.';

  @override
  String get liveTrackingErrorLocation => 'Nepodařilo se získat polohu.';

  @override
  String get liveTrackingMenuTitle => 'Živé sledování polohy';

  @override
  String get liveTrackingNoRecord =>
      'Žádné aktivní sledování ani nedávná relace.';

  @override
  String get liveTrackingLastSession => 'Poslední relace';

  @override
  String get liveTrackingStartAgain => 'Spustit znovu';

  @override
  String get liveTrackingEnded => 'Čas ukončení';

  @override
  String get liveTrackingEndReason => 'Důvod ukončení';

  @override
  String get liveTrackingEndReasonManual => 'Ukončeno ručně';

  @override
  String get liveTrackingEndReasonMaxDuration =>
      'Dosažena maximální doba trvání';

  @override
  String get liveTrackingEndReasonInterrupted => 'Přerušeno';

  @override
  String get serverUpdateRequired => 'Vyžadována aktualizace serveru';

  @override
  String get backToLogin => 'Zpět na přihlášení';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Tato aplikace funguje s ThingsBoard ve verzi $minVersion nebo novější.';
  }

  @override
  String get serverLabel => 'Server';

  @override
  String get versionLabel => 'Verze';

  @override
  String get askAdminToUpdateServer =>
      'Požádejte administrátora serveru o aktualizaci serveru.';

  @override
  String get deviceClaimFailed =>
      'Zařízení se nepodařilo získat. Zkuste to prosím znovu.';

  @override
  String get deviceToClaimNotFound =>
      'Zařízení nebylo nalezeno. Kontaktujte prosím poskytovatele zařízení.';

  @override
  String get enableAuthenticatorApp => 'Povolit ověřovací aplikaci';

  @override
  String get enableSmsAuthenticator => 'Povolit ověřování pomocí SMS';

  @override
  String get enableEmailAuthenticator => 'Povolit ověřování pomocí e-mailu';

  @override
  String get getBackupCode => 'Získat záložní kód';

  @override
  String get twoFaTotpDescription =>
      'K ověření použijte v telefonu aplikaci, jako je Google Authenticator, Authy nebo Duo. Aplikace vygeneruje bezpečnostní kód pro přihlášení.';

  @override
  String get twoFaSmsDescription =>
      'K ověření použijte svůj telefon. Při přihlášení vám zašleme bezpečnostní kód zprávou SMS.';

  @override
  String get twoFaEmailDescription =>
      'K ověření použijte bezpečnostní kód zaslaný na vaši e-mailovou adresu.';

  @override
  String get twoFaBackupCodeDescription =>
      'Tyto jednorázové kódy k vytištění vám umožní přihlásit se, když nemáte telefon u sebe, například na cestách.';

  @override
  String get openInAuthenticatorApp => 'Otevřít v ověřovací aplikaci';

  @override
  String get noAuthenticatorAppFound =>
      'Ověřovací aplikace nebyla nalezena. Zkopírujte místo toho klíč do své aplikace.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Povoleno: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Váš administrátor vyžaduje dvoufaktorové ověření pro $email.';
  }

  @override
  String get recommended => 'Doporučeno';

  @override
  String get addBackupCodesHint =>
      'Přidejte si také záložní kódy, abyste se mohli přihlásit i v případě ztráty telefonu.';

  @override
  String get totpSecretKey => 'Tajný klíč';

  @override
  String get backupCodesDescription =>
      'Vytiskněte si kódy, abyste je měli po ruce, až je budete potřebovat k přihlášení ke svému účtu. Každý záložní kód lze použít pouze jednou.';

  @override
  String get backupCodesWarning =>
      'Jakmile tuto stránku opustíte, tyto kódy již nebude možné znovu zobrazit. Bezpečně si je uložte pomocí níže uvedených možností.';

  @override
  String get downloadTxt => 'Stáhnout (txt)';
}
