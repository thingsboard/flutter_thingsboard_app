// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class SEl extends S {
  SEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'Αρχική';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Συσκευές',
      one: 'Συσκευή',
    );
    return '$_temp0';
  }

  @override
  String get more => 'Περισσότερα';

  @override
  String get customers => 'Πελάτες';

  @override
  String get assets => 'Περιουσιακά στοιχεία';

  @override
  String get tenants => 'Ενοικιαστές';

  @override
  String get auditLogs => 'Αρχεία καταγραφής ελέγχου';

  @override
  String get noCustomersFound => 'Δεν βρέθηκαν πελάτες';

  @override
  String get noAssetsFound => 'Δεν βρέθηκαν περιουσιακά στοιχεία';

  @override
  String get noTenantsFound => 'Δεν βρέθηκαν ενοικιαστές';

  @override
  String get noDevicesFound => 'Δεν βρέθηκαν συσκευές';

  @override
  String get noAuditLogsFound => 'Δεν βρέθηκαν αρχεία καταγραφής ελέγχου';

  @override
  String get logout => 'Αποσύνδεση';

  @override
  String get login => 'Σύνδεση';

  @override
  String get loginToYourAccount => 'Συνδεθείτε στον λογαριασμό σας';

  @override
  String get email => 'Email';

  @override
  String get emailInvalidText => 'Μη έγκυρη μορφή email.';

  @override
  String get username => 'όνομα χρήστη';

  @override
  String get password => 'Κωδικός πρόσβασης';

  @override
  String get passwordForgotText => 'Ξεχάσατε τον κωδικό πρόσβασης;';

  @override
  String get passwordReset => 'Επαναφορά κωδικού';

  @override
  String get passwordResetText =>
      'Εισαγάγετε το email που σχετίζεται με τον λογαριασμό σας και θα σας στείλουμε email με σύνδεσμο επαναφοράς κωδικού πρόσβασης';

  @override
  String get requestPasswordReset => 'Αίτηση επαναφοράς κωδικού';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Ο σύνδεσμος επαλήθευσης email στάλθηκε με επιτυχία!';

  @override
  String get or => 'Ή';

  @override
  String get no => 'Όχι';

  @override
  String get yes => 'Ναι';

  @override
  String get title => 'Τίτλος';

  @override
  String get country => 'Χώρα';

  @override
  String get city => 'Πόλη';

  @override
  String get stateOrProvince => 'Πολιτεία / Περιφέρεια';

  @override
  String get postalCode => 'Ταχυδρομικός κώδικας';

  @override
  String get address => 'Διεύθυνση';

  @override
  String get address2 => 'Διεύθυνση 2';

  @override
  String get phone => 'Τηλέφωνο';

  @override
  String get alarmClearTitle => 'Εκκαθάριση συναγερμού';

  @override
  String get alarmClearText =>
      'Είστε βέβαιοι ότι θέλετε να εκκαθαρίσετε τον συναγερμό;';

  @override
  String get alarmAcknowledgeTitle => 'Αναγνώριση συναγερμού';

  @override
  String get alarmAcknowledgeText =>
      'Είστε βέβαιοι ότι θέλετε να αναγνωρίσετε τον συναγερμό;';

  @override
  String get assetName => 'Όνομα περιουσιακού στοιχείου';

  @override
  String get type => 'Τύπος';

  @override
  String get label => 'Ετικέτα';

  @override
  String get auditLogDetails => 'Λεπτομέρειες αρχείου καταγραφής ελέγχου';

  @override
  String get customerDetails => 'Λεπτομέρειες πελάτη';

  @override
  String get assetDetails => 'Λεπτομέρειες περιουσιακού στοιχείου';

  @override
  String get tenantDetails => 'Λεπτομέρειες ενοικιαστή';

  @override
  String get entityType => 'Τύπος οντότητας';

  @override
  String get actionData => 'Δεδομένα ενέργειας';

  @override
  String get failureDetails => 'Λεπτομέρειες αποτυχίας';

  @override
  String get allDevices => 'Όλες οι συσκευές';

  @override
  String get active => 'Ενεργή';

  @override
  String get inactive => 'Ανενεργή';

  @override
  String get deviceActive => 'Ενεργή';

  @override
  String get deviceInactive => 'Ανενεργή';

  @override
  String get activeDevices => 'Ενεργές';

  @override
  String get inactiveDevices => 'Ανενεργές';

  @override
  String get alarmStatusActiveAcknowledged => 'Ενεργός αναγνωρισμένος';

  @override
  String get alarmStatusActiveUnacknowledged => 'Ενεργός μη αναγνωρισμένος';

  @override
  String get alarmStatusClearedAcknowledged => 'Εκκαθαρισμένος αναγνωρισμένος';

  @override
  String get alarmStatusClearedUnacknowledged =>
      'Εκκαθαρισμένος μη αναγνωρισμένος';

  @override
  String get alarmStatusFilterActive => 'Ενεργός';

  @override
  String get systemAdministrator => 'Διαχειριστής συστήματος';

  @override
  String get tenantAdministrator => 'Διαχειριστής ενοικιαστή';

  @override
  String get customer => 'Πελάτης';

  @override
  String get changePassword => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get currentPasswordRequireText =>
      'Απαιτείται τρέχων κωδικός πρόσβασης.';

  @override
  String get currentPassword => 'Τρέχων κωδικός πρόσβασης';

  @override
  String get newPasswordRequireText => 'Απαιτείται νέος κωδικός πρόσβασης.';

  @override
  String get newPassword => 'Νέος κωδικός';

  @override
  String get newPassword2RequireText =>
      'Απαιτείται επανάληψη νέου κωδικού πρόσβασης.';

  @override
  String get newPassword2 => 'Επιβεβαίωση νέου κωδικού';

  @override
  String get passwordErrorNotification => 'Οι κωδικοί πρέπει να είναι ίδιοι!';

  @override
  String get profileSuccessNotification => 'Το προφίλ ενημερώθηκε με επιτυχία';

  @override
  String get passwordSuccessNotification =>
      'Ο κωδικός πρόσβασης άλλαξε με επιτυχία';

  @override
  String get notImplemented => 'Δεν έχει υλοποιηθεί!';

  @override
  String get listIsEmptyText => 'Η λίστα είναι προς το παρόν κενή.';

  @override
  String get tryAgain => 'Δοκιμάστε ξανά';

  @override
  String get verifyYourIdentity => 'Επαληθεύστε την ταυτότητά σας';

  @override
  String get continueText => 'Συνέχεια';

  @override
  String get resendCode => 'Επαναποστολή κωδικού';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time δευτερόλεπτα',
      one: '1 δευτερόλεπτο',
    );
    return 'Επαναποστολή κωδικού σε $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Παρακαλώ εισάγετε τον κωδικό από την εφαρμογή ελέγχου ταυτότητας.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Στάλθηκε κωδικός ασφαλείας στο τηλέφωνό σας, στον αριθμό $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Στάλθηκε κωδικός ασφαλείας στη διεύθυνση email σας $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Παρακαλώ εισάγετε έναν από τους εφεδρικούς σας κωδικούς.';

  @override
  String get toptAuthPlaceholder => 'Κωδικός';

  @override
  String get smsAuthPlaceholder => 'Κωδικός SMS';

  @override
  String get emailAuthPlaceholder => 'Κωδικός email';

  @override
  String get backupCodeAuthPlaceholder => 'Εφεδρικός κωδικός';

  @override
  String get verificationCodeIncorrect =>
      'Ο κωδικός επαλήθευσης είναι λανθασμένος';

  @override
  String get verificationCodeManyRequest =>
      'Πάρα πολλά αιτήματα ελέγχου κωδικού επαλήθευσης';

  @override
  String get tryAnotherWay => 'Δοκιμάστε άλλον τρόπο';

  @override
  String get selectWayToVerify => 'Επιλέξτε τρόπο επαλήθευσης';

  @override
  String get mfaProviderTopt => 'Εφαρμογή ελέγχου ταυτότητας';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'Email';

  @override
  String get mfaProviderBackupCode => 'Εφεδρικός κωδικός';

  @override
  String get newUserText => 'Νέος χρήστης;';

  @override
  String get createAccount => 'Δημιουργία λογαριασμού';

  @override
  String get emailVerification => 'Επαλήθευση email';

  @override
  String get emailVerificationSentText =>
      'Ένα email με στοιχεία επαλήθευσης στάλθηκε στη διεύθυνση email που ορίσατε ';

  @override
  String get emailVerificationInstructionsText =>
      'Ακολουθήστε τις οδηγίες του email για να ολοκληρώσετε τη διαδικασία εγγραφής. Σημείωση: αν δεν βλέπετε το email για αρκετή ώρα, ελέγξτε τον φάκελο «spam» ή δοκιμάστε να στείλετε ξανά το email πατώντας το κουμπί «Επανάληψη αποστολής».';

  @override
  String get resend => 'Επανάληψη αποστολής';

  @override
  String get activatingAccount => 'Ενεργοποίηση λογαριασμού...';

  @override
  String get accountActivated => 'Ο λογαριασμός ενεργοποιήθηκε με επιτυχία!';

  @override
  String get emailVerified => 'Το email επαληθεύτηκε';

  @override
  String get activatingAccountText =>
      'Ο λογαριασμός σας ενεργοποιείται.\nΠεριμένετε...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Συγχαρητήρια!\nΟ λογαριασμός σας στο $appTitle ενεργοποιήθηκε.\nΤώρα μπορείτε να συνδεθείτε στον χώρο σας στο $appTitle.';
  }

  @override
  String get privacyPolicy => 'Πολιτική απορρήτου';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get accept => 'Αποδοχή';

  @override
  String get termsOfUse => 'Όροι χρήσης';

  @override
  String get firstName => 'Όνομα';

  @override
  String get lastName => 'Επώνυμο';

  @override
  String get imNotARobot => 'Δεν είμαι ρομπότ';

  @override
  String get signUp => 'Εγγραφή';

  @override
  String get alreadyHaveAnAccount => 'Έχετε ήδη λογαριασμό;';

  @override
  String get signIn => 'Σύνδεση';

  @override
  String get inactiveUserAlreadyExists => 'Υπάρχει ήδη ανενεργός χρήστης';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'Υπάρχει ήδη εγγεγραμμένος χρήστης με μη επαληθευμένη διεύθυνση email.\nΠατήστε το κουμπί «Επανάληψη αποστολής» αν θέλετε να σταλεί ξανά το email επαλήθευσης.';

  @override
  String get assignee => 'Ανατεθειμένος';

  @override
  String get alarmTypes => 'Τύποι συναγερμών';

  @override
  String get details => 'Λεπτομέρειες';

  @override
  String get status => 'Κατάσταση';

  @override
  String get severity => 'Σοβαρότητα';

  @override
  String get originator => 'Αποστολέας';

  @override
  String get startTime => 'Ώρα έναρξης';

  @override
  String get duration => 'Διάρκεια';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ημέρες',
      one: '$value ημέρα',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value ώρες',
      one: '$value ώρα',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value λεπτά',
      one: '$value λεπτό',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value δευτερόλεπτα',
      one: '$value δευτερόλεπτο',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'Προβολή πίνακα ελέγχου';

  @override
  String get activity => 'Δραστηριότητα';

  @override
  String get addCommentMessage => 'Προσθήκη σχολίου...';

  @override
  String get clear => 'Εκκαθάριση';

  @override
  String get acknowledge => 'Αναγνώριση';

  @override
  String get edit => 'Επεξεργασία';

  @override
  String get editProfile => 'Επεξεργασία προφίλ';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get edited => 'Επεξεργάστηκε';

  @override
  String get deleteComment => 'Διαγραφή σχολίου';

  @override
  String get areYouSure => 'Είστε βέβαιοι;';

  @override
  String get noResultsFound => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get tryRefiningYourQuery => 'Δοκιμάστε να βελτιώσετε το ερώτημά σας';

  @override
  String get failedToLoadTheList => 'Αποτυχία φόρτωσης της λίστας';

  @override
  String get tryRefreshing => 'Δοκιμάστε ανανέωση';

  @override
  String get refresh => 'Ανανέωση';

  @override
  String get users => 'Χρήστες';

  @override
  String get unassigned => 'Μη ανατεθειμένος';

  @override
  String get failedToLoadAlarmDetails =>
      'Αποτυχία φόρτωσης λεπτομερειών συναγερμού';

  @override
  String get somethingWentWrong => 'Κάτι πήγε στραβά';

  @override
  String get chooseRegion => 'Επιλέξτε περιοχή';

  @override
  String get regions => 'Περιοχές';

  @override
  String get selectRegion => 'Επιλέξτε περιοχή';

  @override
  String get northAmerica => 'Βόρεια Αμερική';

  @override
  String get europe => 'Ευρώπη';

  @override
  String get northAmericaRegionShort => 'Β. Βιρτζίνια';

  @override
  String get europeRegionShort => 'Φρανκφούρτη';

  @override
  String get deviceList => 'Λίστα συσκευών';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Πίνακες ελέγχου',
      one: 'Πίνακας ελέγχου',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => 'Απαιτείται ενημέρωση';

  @override
  String updateTo(Object version) {
    return 'Ενημέρωση σε $version';
  }

  @override
  String get next => 'Επόμενο';

  @override
  String get confirmation => 'Επιβεβαίωση';

  @override
  String get wifiPassword => 'Κωδικός πρόσβασης Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Για να συνεχίσετε τη ρύθμιση της συσκευής σας $deviceName, παρέχετε τα διαπιστευτήρια του δικτύου σας.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Εισαγάγετε τον κωδικό πρόσβασης για το δίκτυο $network';
  }

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Δεν έχετε επαρκή δικαιώματα για «$permissions» για να συνεχίσετε. Παραχωρήστε τα απαιτούμενα δικαιώματα και πατήστε «Δοκιμάστε ξανά».';
  }

  @override
  String get sendingWifiCredentials => 'Αποστολή διαπιστευτηρίων Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Επιβεβαίωση σύνδεσης Wi-Fi';

  @override
  String get provisionedSuccessfully =>
      'Η παροχή της συσκευής ολοκληρώθηκε με επιτυχία';

  @override
  String get returnToDashboard => 'Επιστροφή στον πίνακα ελέγχου';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Δεν είναι δυνατή η δημιουργία συνεδρίας με τη συσκευή $deviceName. Δοκιμάστε ξανά';
  }

  @override
  String get claimingDevice => 'Διεκδίκηση συσκευής';

  @override
  String get claimingMessageSuccess =>
      'Η διεκδίκηση της συσκευής\nολοκληρώθηκε με επιτυχία';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Δεν έχετε επαρκή δικαιώματα για «$permissions» για να συνεχίσετε. Ανοίξτε τις ρυθμίσεις της εφαρμογής, παραχωρήστε τα δικαιώματα και πατήστε «Δοκιμάστε ξανά».';
  }

  @override
  String get scanACode => 'Σάρωση κωδικού';

  @override
  String get allowAccess => 'Παραχώρηση πρόσβασης';

  @override
  String get toggleCamera => 'Εναλλαγή κάμερας';

  @override
  String get toggleFlash => 'Εναλλαγή φλας';

  @override
  String get unableToUseCamera => 'Δεν είναι δυνατή η χρήση της κάμερας';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Ανοίξτε τις ρυθμίσεις και παραχωρήστε πρόσβαση στην κάμερα για να συνεχίσετε';

  @override
  String get notFound => 'Δεν βρέθηκε';

  @override
  String routeNotDefined(Object name) {
    return 'Η διαδρομή δεν έχει οριστεί: $name';
  }

  @override
  String get loginWith => 'ΣΥΝΔΕΣΗ ΜΕ';

  @override
  String get scanQrCode => 'Σάρωση κωδικού QR';

  @override
  String get searchResults => 'Αποτελέσματα αναζήτησης';

  @override
  String get viewAll => 'Προβολή όλων';

  @override
  String get requestedEntityDoesNotExists =>
      'Η ζητούμενη οντότητα δεν υπάρχει.';

  @override
  String get noAlarmsFound => 'Δεν βρέθηκαν συναγερμοί';

  @override
  String get filters => 'Φίλτρα';

  @override
  String get alarmStatusList => 'Λίστα κατάστασης συναγερμών';

  @override
  String get alarmSeverityList => 'Λίστα σοβαρότητας συναγερμών';

  @override
  String get cleared => 'Εκκαθαρισμένος';

  @override
  String get acknowledged => 'Αναγνωρισμένος';

  @override
  String get unacknowledged => 'Μη αναγνωρισμένος';

  @override
  String get critical => 'Κρίσιμη';

  @override
  String get major => 'Σημαντική';

  @override
  String get minor => 'Δευτερεύουσα';

  @override
  String get warning => 'Προειδοποίηση';

  @override
  String get indeterminate => 'Απροσδιόριστη';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Αναζήτηση χρηστών',
      one: 'Αναζήτηση χρήστη',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'Επαναφορά';

  @override
  String get update => 'Ενημέρωση';

  @override
  String get alarmTypeList => 'Λίστα τύπων συναγερμών';

  @override
  String get anyType => 'Οποιοσδήποτε τύπος';

  @override
  String get plusAlarmType => '+ Τύπος συναγερμού';

  @override
  String get all => 'Όλα';

  @override
  String get allNotifications => 'Όλες';

  @override
  String get unread => 'Μη αναγνωσμένες';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get fatalError => 'Μοιραίο σφάλμα';

  @override
  String get unknownError => 'Άγνωστο σφάλμα.';

  @override
  String get sessionExpired => 'Η συνεδρία έληξε';

  @override
  String get fatalApplicationErrorOccurred =>
      'Προέκυψε μοιραίο σφάλμα εφαρμογής:';

  @override
  String get connectionError => 'Σφάλμα σύνδεσης';

  @override
  String get failedToConnectToServer => 'Αποτυχία σύνδεσης με τον διακομιστή';

  @override
  String get retry => 'Επανάληψη';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Ο πίνακας ελέγχου για κινητά πρέπει να διαμορφωθεί στο προφίλ συσκευής!';

  @override
  String get openWifiSettings => 'Άνοιγμα ρυθμίσεων Wi-Fi';

  @override
  String get connectToTheWifiYouUsuallyUse =>
      'Συνδεθείτε στο Wi-Fi που χρησιμοποιείτε συνήθως';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'Επιστρέψτε στην εφαρμογή και πατήστε το κουμπί Έτοιμο';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      'Ακολουθήστε τα επόμενα βήματα για να επανασυνδέσετε\nτο τηλέφωνό σας στο συνηθισμένο σας Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Οι ειδοποιήσεις push δεν έχουν διαμορφωθεί.\nΕπικοινωνήστε με τον διαχειριστή του συστήματός σας.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Το Firebase δεν έχει διαμορφωθεί.\n Ανατρέξτε στην επίσημη τεκμηρίωση του Firebase για\n οδηγίες σχετικά με τον τρόπο διαμόρφωσης.';

  @override
  String get markAllAsRead => 'Σήμανση όλων ως αναγνωσμένων';

  @override
  String get profile => 'Προφίλ';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Αδυναμία ανοίγματος του URL: $link';
  }

  @override
  String get noDashboardsFound => 'Δεν βρέθηκαν πίνακες ελέγχου';

  @override
  String get openAppSettings => 'Άνοιγμα ρυθμίσεων εφαρμογής';

  @override
  String get connectingToDevice => 'Σύνδεση με συσκευή';

  @override
  String get connectToDevice => 'Σύνδεση με συσκευή';

  @override
  String get selectWifiNetwork => 'Επιλέξτε δίκτυο Wi-Fi';

  @override
  String get deviceProvisioning => 'Παροχή συσκευής';

  @override
  String get permissions => 'Δικαιώματα';

  @override
  String get unableConnectToDevice => 'Αδυναμία σύνδεσης με τη συσκευή';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Η συσκευή δεν μπορεί να βρει κοντινό δίκτυο Wi-Fi';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Η σύνδεση στο δίκτυο Wi-Fi $name απέτυχε.\nΒεβαιωθείτε ότι το τηλέφωνό σας είναι συνδεδεμένο στο δίκτυο Wi-Fi της συσκευής και ότι η πρόσβαση τοπικού δικτύου είναι ενεργοποιημένη για αυτήν την εφαρμογή στις ρυθμίσεις του τηλεφώνου σας.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Δεν είναι δυνατή η σύνδεση στο Wi-Fi, επειδή δεν βρέθηκαν δίκτυα από τη συσκευή $name';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'Ακολουθήστε τα επόμενα βήματα για να συνδέσετε το τηλέφωνό σας στη συσκευή';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return 'Συνδεθείτε σε Wi-Fi παρόμοιο με $wifiName';
  }

  @override
  String get ready => 'Έτοιμο';

  @override
  String get exitDeviceProvisioning => 'Έξοδος από την παροχή συσκευής';

  @override
  String get noNotificationsFound => 'Δεν βρέθηκαν ειδοποιήσεις';

  @override
  String get markAsRead => 'Σήμανση ως αναγνωσμένο';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice =>
      'Σαρώστε τον κωδικό QR στη συσκευή σας';

  @override
  String get search => 'Αναζήτηση';

  @override
  String get tenant => 'Ενοικιαστής';

  @override
  String get tenantProfile => 'Προφίλ ενοικιαστή';

  @override
  String get user => 'Χρήστης';

  @override
  String get asset => 'Περιουσιακό στοιχείο';

  @override
  String get deviceProfile => 'Προφίλ συσκευής';

  @override
  String get assetProfile => 'Προφίλ περιουσιακού στοιχείου';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Συναγερμοί',
      one: 'Συναγερμός',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'Αλυσίδα κανόνων';

  @override
  String get ruleNode => 'Κόμβος κανόνα';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Προβολή οντότητας';

  @override
  String get widgetsBundle => 'Πακέτο widget';

  @override
  String get widgetType => 'Τύπος widget';

  @override
  String get apiUsageState => 'Κατάσταση χρήσης API';

  @override
  String get tbResource => 'Πόρος';

  @override
  String get otaPackage => 'Πακέτο OTA';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'Ουρά';

  @override
  String get notificationTarget => 'Παραλήπτης ειδοποίησης';

  @override
  String get notificationTemplate => 'Πρότυπο ειδοποίησης';

  @override
  String get notificationRequest => 'Αίτημα ειδοποίησης';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ειδοποιήσεις',
      one: 'Ειδοποίηση',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => 'Κανόνας ειδοποίησης';

  @override
  String get entityGroup => 'Ομάδα οντοτήτων';

  @override
  String get converter => 'Μετατροπέας';

  @override
  String get integration => 'Ενσωμάτωση';

  @override
  String get schedulerEvent => 'Προγραμματισμένο συμβάν';

  @override
  String get blobEntity => 'Οντότητα blob';

  @override
  String get role => 'Ρόλος';

  @override
  String get groupPermission => 'Δικαίωμα ομάδας';

  @override
  String get actionStatusSuccess => 'Επιτυχία';

  @override
  String get actionStatusFailure => 'Αποτυχία';

  @override
  String get actionTypeAdded => 'Προστέθηκε';

  @override
  String get actionTypeDeleted => 'Διαγράφηκε';

  @override
  String get actionTypeUpdated => 'Ενημερώθηκε';

  @override
  String get actionTypeAttributesUpdated => 'Ενημερώθηκαν χαρακτηριστικά';

  @override
  String get actionTypeAttributesDeleted => 'Διαγράφηκαν χαρακτηριστικά';

  @override
  String get actionTypeRpcCall => 'Κλήση RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Ενημερώθηκαν διαπιστευτήρια';

  @override
  String get actionTypeAssignedToCustomer => 'Ανατέθηκε σε πελάτη';

  @override
  String get actionTypeUnassignedFromCustomer =>
      'Καταργήθηκε η ανάθεση σε πελάτη';

  @override
  String get actionTypeActivated => 'Ενεργοποιήθηκε';

  @override
  String get actionTypeSuspended => 'Ανεστάλη';

  @override
  String get actionTypeCredentialsRead => 'Διαβάστηκαν διαπιστευτήρια';

  @override
  String get actionTypeAttributesRead => 'Διαβάστηκαν χαρακτηριστικά';

  @override
  String get actionTypeRelationAddOrUpdate => 'Η σχέση ενημερώθηκε';

  @override
  String get actionTypeRelationDeleted => 'Η σχέση διαγράφηκε';

  @override
  String get actionTypeRelationsDeleted => 'Όλες οι σχέσεις διαγράφηκαν';

  @override
  String get actionTypeAlarmAck => 'Ο συναγερμός αναγνωρίστηκε';

  @override
  String get actionTypeAlarmClear => 'Ο συναγερμός εκκαθαρίστηκε';

  @override
  String get actionTypeAlarmDelete => 'Ο συναγερμός διαγράφηκε';

  @override
  String get actionTypeAlarmAssigned => 'Ο συναγερμός ανατέθηκε';

  @override
  String get actionTypeAlarmUnassigned =>
      'Η ανάθεση του συναγερμού καταργήθηκε';

  @override
  String get actionTypeLogin => 'Είσοδος';

  @override
  String get actionTypeLogout => 'Έξοδος';

  @override
  String get actionTypeLockout => 'Κλείδωμα';

  @override
  String get actionTypeAssignedFromTenant => 'Ανατέθηκε από ενοικιαστή';

  @override
  String get actionTypeAssignedToTenant => 'Ανατέθηκε σε ενοικιαστή';

  @override
  String get actionTypeProvisionSuccess => 'Έγινε παροχή της συσκευής';

  @override
  String get actionTypeProvisionFailure => 'Η παροχή της συσκευής απέτυχε';

  @override
  String get actionTypeTimeseriesUpdated => 'Ενημερώθηκε τηλεμετρία';

  @override
  String get actionTypeTimeseriesDeleted => 'Διαγράφηκε τηλεμετρία';

  @override
  String get actionTypeAssignedToEdge => 'Ανατέθηκε σε Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Καταργήθηκε η ανάθεση σε Edge';

  @override
  String get actionTypeAddedComment => 'Προστέθηκε σχόλιο';

  @override
  String get actionTypeUpdatedComment => 'Ενημερώθηκε σχόλιο';

  @override
  String get actionTypeDeletedComment => 'Διαγράφηκε σχόλιο';

  @override
  String get actionTypeSmsSent => 'Στάλθηκε SMS';

  @override
  String get actionTypeAddedToEntityGroup => 'Προστέθηκε σε ομάδα οντοτήτων';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Αφαιρέθηκε από ομάδα οντοτήτων';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Κλήση REST API μηχανής κανόνων';

  @override
  String get actionTypeMadePublic => 'Ορίστηκε ως δημόσιο';

  @override
  String get actionTypeMadePrivate => 'Ορίστηκε ως ιδιωτικό';

  @override
  String get actionTypeChangeOwner => 'Ο ιδιοκτήτης άλλαξε';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Δεν έχετε δικαιώματα για την εκτέλεση αυτής της λειτουργίας!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Φαίνεται ότι τα δικαιώματά σας δεν επαρκούν για την ολοκλήρωση αυτής της λειτουργίας';

  @override
  String fieldIsRequired(String field) {
    return '$field απαιτείται.';
  }

  @override
  String get no2faProvidersFound => 'Δεν βρέθηκαν πάροχοι 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Επικοινωνήστε με τον διαχειριστή του συστήματός σας';

  @override
  String errorOccured(Object e) {
    return 'Προέκυψε σφάλμα: $e';
  }

  @override
  String get unsavedChanges => 'Μη αποθηκευμένες αλλαγές';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Έχετε μη αποθηκευμένες αλλαγές. Είστε βέβαιοι ότι θέλετε να φύγετε από αυτήν τη σελίδα;';

  @override
  String get deleteAccount => 'Διαγραφή λογαριασμού';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Είστε βέβαιοι; Πρόκειται να διαγράψετε τον λογαριασμό σας με ρόλο «$authority».';
  }

  @override
  String get language => 'Γλώσσα';

  @override
  String get metricUnitSystem => 'Μετρικό';

  @override
  String get imperialUnitSystem => 'Αγγλοσαξονικό';

  @override
  String get hybridUnitSystem => 'Υβριδικό';

  @override
  String get autoUnitSystem => 'Αυτόματο';

  @override
  String get languageAuto => 'Αυτόματη';

  @override
  String get unitSystem => 'Σύστημα μονάδων';

  @override
  String get selectCountry => 'Επιλέξτε χώρα';

  @override
  String get hideHomeDashboardToolbar =>
      'Απόκρυψη γραμμής εργαλείων στον αρχικό πίνακα ελέγχου';

  @override
  String get phoneNumberHelperText =>
      'Αριθμός τηλεφώνου σε μορφή E.164, π.χ. +1201550123';

  @override
  String get homeDashboard => 'Αρχικός πίνακας ελέγχου';

  @override
  String get security => 'Ασφάλεια';

  @override
  String get twofactorAuthentication => 'Έλεγχος ταυτότητας δύο παραγόντων';

  @override
  String get verificationRequired => 'Απαιτείται επαλήθευση';

  @override
  String get twofactorAuthenticationIsRequired =>
      'Απαιτείται έλεγχος ταυτότητας δύο παραγόντων';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'Ρυθμίστε μια μέθοδο επαλήθευσης για να συνεχίσετε τη σύνδεσή σας';

  @override
  String get setUpAVerificationMethod => 'Ρύθμιση μεθόδου επαλήθευσης';

  @override
  String get totpSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα χρειαστεί να παρέχετε κωδικό ελέγχου ταυτότητας δύο παραγόντων';

  @override
  String get smsSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα σας ζητηθεί να εισαγάγετε τον κωδικό ασφαλείας που θα σταλεί στον αριθμό τηλεφώνου σας';

  @override
  String get emailSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα σας ζητηθεί να εισαγάγετε τον κωδικό ασφαλείας που θα σταλεί στη διεύθυνση email σας';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα μπορείτε να χρησιμοποιήσετε εφεδρικούς κωδικούς για τον έλεγχο ταυτότητας δύο παραγόντων';

  @override
  String get loginToApp => 'Σύνδεση στην εφαρμογή';

  @override
  String get goBack => 'Επιστροφή';

  @override
  String get done => 'Τέλος';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Αυτό θα κάνει τον λογαριασμό σας λιγότερο ασφαλή';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Είστε βέβαιοι ότι θέλετε να απενεργοποιήσετε τη μέθοδο «$providerName»;';
  }

  @override
  String get yesDeactivate => 'Ναι, απενεργοποίηση';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Εισαγάγετε ένα email που θα χρησιμοποιείται για τον έλεγχο ταυτότητας.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Εισαγάγετε έναν αριθμό τηλεφώνου που θα χρησιμοποιείται για τον έλεγχο ταυτότητας';

  @override
  String get sendCode => 'Αποστολή κωδικού';

  @override
  String get copy => 'Αντιγραφή';

  @override
  String get copiedToClipboard => 'Αντιγράφηκε στο πρόχειρο';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Εισάγετε τον 6-ψήφιο κωδικό εδώ';

  @override
  String digitsCode(int count) {
    return 'Κωδικός $count ψηφίων';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Αντιγράψτε το κλειδί 32 χαρακτήρων στην εφαρμογή ελέγχου ταυτότητας ή σαρώστε τον παρακάτω κωδικό QR';

  @override
  String get applyChanges => 'Εφαρμογή αλλαγών';

  @override
  String get discardChanges => 'Απόρριψη αλλαγών';

  @override
  String get yesDiscard => 'Ναι, απόρριψη';

  @override
  String get thisActionCannotBeUndone =>
      'Αυτή η ενέργεια δεν μπορεί να αναιρεθεί';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      'Ο έλεγχος ταυτότητας δύο παραγόντων προστατεύει τον λογαριασμό σας από μη εξουσιοδοτημένη πρόσβαση. Απλώς εισάγετε έναν κωδικό ασφαλείας κατά τη σύνδεση.';

  @override
  String get calculatedField => 'Υπολογιζόμενο πεδίο';

  @override
  String get apiKey => 'Κλειδί API';

  @override
  String get aiModel => 'Μοντέλο AI';

  @override
  String get adminSettings => 'Ρυθμίσεις διαχειριστή';

  @override
  String get job => 'Εργασία';

  @override
  String get mobileAppBundle => 'Πακέτο εφαρμογής για κινητά';

  @override
  String get mobileApp => 'Εφαρμογή για κινητά';

  @override
  String get domain => 'Τομέας';

  @override
  String get oauth2Client => 'Πελάτης OAuth 2.0';

  @override
  String get queueStats => 'Στατιστικά ουράς';

  @override
  String get phoneIsRequired => 'Απαιτείται τηλέφωνο';

  @override
  String get phoneIsInvalid => 'Μη έγκυρο τηλέφωνο';

  @override
  String get addVerificationMethod => 'Προσθήκη μεθόδου επαλήθευσης';

  @override
  String get imageSavedToGallery =>
      'Αποθηκεύτηκε στη «Συλλογή εικόνων» της πλατφόρμας';

  @override
  String get failedToSaveImage => 'Αποτυχία αποθήκευσης εικόνας';

  @override
  String nSelected(int count) {
    return 'Επιλεγμένες: $count';
  }

  @override
  String get selectAll => 'Επιλογή όλων';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count λειτουργίες απέτυχαν',
      one: '1 λειτουργία απέτυχε',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Διαγραφή $count ειδοποιήσεων;',
      one: 'Διαγραφή 1 ειδοποίησης;',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Σήμανση $count ειδοποιήσεων ως αναγνωσμένων;',
      one: 'Σήμανση 1 ειδοποίησης ως αναγνωσμένης;',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'Λήψη δεδομένων από το host σας $host';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'Σύνδεση στο host $host';
  }

  @override
  String switchingToNewHost(Object host) {
    return 'Μετάβαση στο νέο host $host';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return 'Αποτυχία λήψης token σύνδεσης από το $host. Σαρώστε έναν νέο κωδικό QR.';
  }

  @override
  String failedToConnectToHost(Object host) {
    return 'Αποτυχία σύνδεσης με το $host';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return 'Το $host δεν είναι διακομιστής ThingsBoard';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'Η συνεδρία του κωδικού QR δεν είναι πλέον έγκυρη. Ανανεώστε τον κωδικό QR και σαρώστε ξανά.';

  @override
  String get openThisLinkTitle => 'Άνοιγμα αυτού του συνδέσμου;';

  @override
  String get linkOpensSignInPage =>
      'Αυτός ο σύνδεσμος ανοίγει τη σελίδα σύνδεσης αυτού του διακομιστή. Θα αποσυνδεθείτε από τον τρέχοντα διακομιστή σας.';

  @override
  String get linkOpensSignInPageOnly =>
      'Αυτός ο σύνδεσμος ανοίγει τη σελίδα σύνδεσης αυτού του διακομιστή.';

  @override
  String linkSignsInAs(Object email) {
    return 'Αυτός ο σύνδεσμος σάς συνδέει σε αυτόν τον διακομιστή ως $email.';
  }

  @override
  String get linkSignsIn =>
      'Αυτός ο σύνδεσμος σάς συνδέει σε αυτόν τον διακομιστή.';

  @override
  String get serverConnectionNotSecure =>
      'Αυτός ο διακομιστής δεν χρησιμοποιεί ασφαλή σύνδεση.';

  @override
  String get linkToOtherServerNotAllowed =>
      'Αυτή η εφαρμογή λειτουργεί μόνο με τον δικό της διακομιστή και δεν μπορεί να ανοίξει αυτόν τον σύνδεσμο.';

  @override
  String get liveTrackingActive => 'Ζωντανή παρακολούθηση τοποθεσίας';

  @override
  String get liveTrackingPaused => 'Ζωντανή παρακολούθηση σε παύση';

  @override
  String get liveTrackingFixes => 'Θέσεις';

  @override
  String get liveTrackingSaved => 'Αποθηκεύτηκαν';

  @override
  String get liveTrackingErrors => 'Σφάλματα';

  @override
  String liveTrackingCount(String label, int value) {
    return '$label: $value';
  }

  @override
  String get liveTrackingStop => 'Διακοπή';

  @override
  String get liveTrackingPause => 'Παύση';

  @override
  String get liveTrackingResume => 'Συνέχιση';

  @override
  String get liveTrackingHide => 'Απόκρυψη';

  @override
  String get liveTrackingSessionTitle => 'Ζωντανή παρακολούθηση τοποθεσίας';

  @override
  String get liveTrackingTarget => 'Αποθήκευση τοποθεσίας σε οντότητα';

  @override
  String get liveTrackingDashboard => 'Πίνακας ελέγχου';

  @override
  String get liveTrackingStatus => 'Κατάσταση';

  @override
  String get liveTrackingStarted => 'Ώρα έναρξης';

  @override
  String get liveTrackingLastFix => 'Τελευταία θέση';

  @override
  String get liveTrackingLastError => 'Τελευταίο σφάλμα';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'Δεν είναι δυνατή η αποθήκευση σε αυτή την οντότητα — δεν υπάρχει πλέον. Η παρακολούθηση συνεχίζεται· ενημερώστε τον στόχο στην ενέργεια του πίνακα ελέγχου.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Δεν υπάρχει σύνδεση με τον διακομιστή. Αυτές οι θέσεις δεν αποθηκεύτηκαν — η αποθήκευση θα συνεχιστεί όταν αποκατασταθεί η σύνδεση.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Η συνεδρία σας έληξε. Συνδεθείτε ξανά για να συνεχιστεί η αποθήκευση της τοποθεσίας.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Δεν είναι δυνατή η αποθήκευση σε αυτή την οντότητα — δεν έχετε δικαίωμα. Η παρακολούθηση συνεχίζεται· ζητήστε από τον διαχειριστή σας να σας χορηγήσει πρόσβαση.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Δεν ήταν δυνατή η αποθήκευση αυτής της θέσης στον διακομιστή. Θα γίνει νέα προσπάθεια με την επόμενη θέση.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Οι υπηρεσίες τοποθεσίας είναι απενεργοποιημένες σε αυτή τη συσκευή.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Το δικαίωμα τοποθεσίας απορρίφθηκε.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Το δικαίωμα τοποθεσίας έχει απορριφθεί οριστικά. Ενεργοποιήστε το στις ρυθμίσεις της εφαρμογής.';

  @override
  String get liveTrackingErrorLocation =>
      'Δεν ήταν δυνατός ο προσδιορισμός της θέσης.';

  @override
  String get liveTrackingMenuTitle => 'Ζωντανή παρακολούθηση τοποθεσίας';

  @override
  String get liveTrackingNoRecord =>
      'Καμία ενεργή παρακολούθηση και καμία πρόσφατη συνεδρία.';

  @override
  String get liveTrackingLastSession => 'Τελευταία συνεδρία';

  @override
  String get liveTrackingStartAgain => 'Εκκίνηση ξανά';

  @override
  String get liveTrackingEnded => 'Ώρα λήξης';

  @override
  String get liveTrackingEndReason => 'Αιτία τερματισμού';

  @override
  String get liveTrackingEndReasonManual => 'Διακόπηκε χειροκίνητα';

  @override
  String get liveTrackingEndReasonMaxDuration =>
      'Συμπληρώθηκε η μέγιστη διάρκεια';

  @override
  String get liveTrackingEndReasonInterrupted => 'Διακόπηκε';

  @override
  String get serverUpdateRequired => 'Απαιτείται ενημέρωση διακομιστή';

  @override
  String get backToLogin => 'Επιστροφή στη σύνδεση';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'Αυτή η εφαρμογή λειτουργεί με το ThingsBoard $minVersion ή νεότερη έκδοση.';
  }

  @override
  String get serverLabel => 'Διακομιστής';

  @override
  String get versionLabel => 'Έκδοση';

  @override
  String get askAdminToUpdateServer =>
      'Ζητήστε από τον διαχειριστή του διακομιστή σας να ενημερώσει τον διακομιστή.';

  @override
  String get deviceClaimFailed =>
      'Δεν ήταν δυνατή η διεκδίκηση της συσκευής. Δοκιμάστε ξανά.';

  @override
  String get deviceToClaimNotFound =>
      'Η συσκευή δεν βρέθηκε. Επικοινωνήστε με τον πάροχο της συσκευής.';

  @override
  String get enableAuthenticatorApp =>
      'Ενεργοποίηση εφαρμογής ελέγχου ταυτότητας';

  @override
  String get enableSmsAuthenticator => 'Ενεργοποίηση ελέγχου ταυτότητας SMS';

  @override
  String get enableEmailAuthenticator =>
      'Ενεργοποίηση ελέγχου ταυτότητας email';

  @override
  String get getBackupCode => 'Λήψη εφεδρικού κωδικού';

  @override
  String get twoFaTotpDescription =>
      'Χρησιμοποιήστε εφαρμογές όπως Google Authenticator, Authy ή Duo στο τηλέφωνό σας για έλεγχο ταυτότητας. Θα δημιουργήσει έναν κωδικό ασφαλείας για σύνδεση.';

  @override
  String get twoFaSmsDescription =>
      'Χρησιμοποιήστε το τηλέφωνό σας για έλεγχο ταυτότητας. Θα σας στείλουμε έναν κωδικό ασφαλείας μέσω SMS όταν συνδεθείτε.';

  @override
  String get twoFaEmailDescription =>
      'Χρησιμοποιήστε έναν κωδικό ασφαλείας που αποστέλλεται στη διεύθυνση email σας για να πραγματοποιήσετε έλεγχο ταυτότητας.';

  @override
  String get twoFaBackupCodeDescription =>
      'Αυτοί οι εκτυπώσιμοι κωδικοί μίας χρήσης σάς επιτρέπουν να συνδεθείτε όταν δεν έχετε πρόσβαση στο τηλέφωνό σας, όπως κατά τη διάρκεια ενός ταξιδιού.';

  @override
  String get openInAuthenticatorApp =>
      'Άνοιγμα στην εφαρμογή ελέγχου ταυτότητας';

  @override
  String get noAuthenticatorAppFound =>
      'Δεν βρέθηκε εφαρμογή ελέγχου ταυτότητας. Αντιγράψτε το κλειδί στην εφαρμογή σας.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Ενεργοποιήθηκε: $provider';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Ο διαχειριστής σας απαιτεί έλεγχο ταυτότητας δύο παραγόντων για $email.';
  }

  @override
  String get recommended => 'Συνιστάται';

  @override
  String get addBackupCodesHint =>
      'Προσθέστε και εφεδρικούς κωδικούς, ώστε να μπορείτε να συνδεθείτε αν χάσετε το τηλέφωνό σας.';

  @override
  String get totpSecretKey => 'Μυστικό κλειδί';

  @override
  String get backupCodesDescription =>
      'Εκτυπώστε τους κωδικούς ώστε να τους έχετε διαθέσιμους όταν χρειαστεί να τους χρησιμοποιήσετε για σύνδεση στον λογαριασμό σας. Μπορείτε να χρησιμοποιήσετε κάθε εφεδρικό κωδικό μία φορά.';

  @override
  String get backupCodesWarning =>
      'Μόλις φύγετε από αυτή τη σελίδα, αυτοί οι κωδικοί δεν μπορούν να εμφανιστούν ξανά. Αποθηκεύστε τους με ασφάλεια χρησιμοποιώντας τις παρακάτω επιλογές.';

  @override
  String get downloadTxt => 'Λήψη (txt)';
}
