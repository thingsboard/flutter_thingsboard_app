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
  String get tenants => 'Tenants';

  @override
  String get auditLogs => 'Αρχεία καταγραφής ελέγχου';

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
  String get logout => 'Αποσύνδεση';

  @override
  String get login => 'Σύνδεση';

  @override
  String get logoDefaultValue => 'Λογότυπο ThingsBoard';

  @override
  String get loginToYourAccount => 'Συνδεθείτε στον λογαριασμό σας';

  @override
  String get email => 'Email';

  @override
  String get emailRequireText => 'Το email είναι υποχρεωτικό.';

  @override
  String get emailInvalidText => 'Μη έγκυρη μορφή email.';

  @override
  String get username => 'όνομα χρήστη';

  @override
  String get password => 'Κωδικός πρόσβασης';

  @override
  String get passwordRequireText => 'Ο κωδικός πρόσβασης είναι υποχρεωτικός.';

  @override
  String get passwordForgotText => 'Ξεχάσατε τον κωδικό;';

  @override
  String get passwordReset => 'Επαναφορά κωδικού';

  @override
  String get passwordResetText =>
      'Εισαγάγετε το email που σχετίζεται με τον λογαριασμό σας και θα σας στείλουμε έναν σύνδεσμο επαναφοράς κωδικού';

  @override
  String get requestPasswordReset => 'Αίτηση επαναφοράς κωδικού';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'Ο σύνδεσμος επαναφοράς κωδικού εστάλη με επιτυχία!';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'Ο σύνδεσμος επαλήθευσης email στάλθηκε επιτυχώς!';

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
  String get stateOrProvince => 'Πολιτεία / Επαρχία';

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
  String get alarmAcknowledgeTitle => 'Επιβεβαίωση συναγερμού';

  @override
  String get alarmAcknowledgeText =>
      'Είστε βέβαιοι ότι θέλετε να επιβεβαιώσετε τον συναγερμό;';

  @override
  String get assetName => 'Όνομα περιουσιακού στοιχείου';

  @override
  String get type => 'Τύπος';

  @override
  String get label => 'Ετικέτα';

  @override
  String get assignedToCustomer => 'Ανατέθηκε σε πελάτη';

  @override
  String get auditLogDetails => 'Λεπτομέρειες αρχείου καταγραφής ελέγχου';

  @override
  String get customerDetails => 'Λεπτομέρειες πελάτη';

  @override
  String get assetDetails => 'Λεπτομέρειες περιουσιακού στοιχείου';

  @override
  String get tenantDetails => 'Λεπτομέρειες μισθωτή';

  @override
  String get entityType => 'Τύπος οντότητας';

  @override
  String get actionData => 'Δεδομένα ενέργειας';

  @override
  String get failureDetails => 'Λεπτομέρειες αποτυχίας';

  @override
  String get allDevices => 'Όλες οι συσκευές';

  @override
  String get active => 'Ενεργό';

  @override
  String get inactive => 'Ανενεργό';

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
      'Ο τρέχων κωδικός πρόσβασης είναι υποχρεωτικός.';

  @override
  String get currentPassword => 'Τρέχων κωδικός πρόσβασης';

  @override
  String get newPasswordRequireText =>
      'Ο νέος κωδικός πρόσβασης είναι υποχρεωτικός.';

  @override
  String get newPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String get newPassword2RequireText =>
      'Η επιβεβαίωση του νέου κωδικού πρόσβασης είναι υποχρεωτική.';

  @override
  String get newPassword2 => 'Επιβεβαίωση νέου κωδικού πρόσβασης';

  @override
  String get passwordErrorNotification =>
      'Οι κωδικοί πρόσβασης που εισάγατε πρέπει να είναι ίδιοι!';

  @override
  String get firstNameUpper => 'Όνομα';

  @override
  String get lastNameUpper => 'Επώνυμο';

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
  String get resendCode => 'Επανάληψη αποστολής κωδικού';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time δευτερόλεπτα',
      one: '1 δευτερόλεπτο',
    );
    return 'Επανάληψη αποστολής σε $_temp0';
  }

  @override
  String get totpAuthDescription =>
      'Εισαγάγετε τον κωδικό ασφαλείας από την εφαρμογή ελέγχου ταυτότητας.';

  @override
  String smsAuthDescription(Object contact) {
    return 'Ένας κωδικός ασφαλείας έχει σταλεί στο τηλέφωνό σας στο $contact.';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'Ένας κωδικός ασφαλείας έχει σταλεί στο email σας στη διεύθυνση $contact.';
  }

  @override
  String get backupCodeAuthDescription =>
      'Εισαγάγετε έναν από τους εφεδρικούς σας κωδικούς.';

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
      'Υπερβολικά πολλές αιτήσεις για επαλήθευση κωδικού';

  @override
  String get tryAnotherWay => 'Δοκιμάστε άλλο τρόπο';

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
      'Ένα email με λεπτομέρειες επαλήθευσης στάλθηκε στη δηλωμένη διεύθυνση email';

  @override
  String get emailVerificationInstructionsText =>
      'Ακολουθήστε τις οδηγίες που περιλαμβάνονται στο email για να ολοκληρώσετε τη διαδικασία εγγραφής σας. Σημείωση: αν δεν δείτε το email, ελέγξτε τον φάκελο \'ανεπιθύμητα\' ή δοκιμάστε να το ξαναστείλετε πατώντας το κουμπί \'Επανάληψη αποστολής\'.';

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
      'Ο λογαριασμός σας ενεργοποιείται αυτή τη στιγμή.\nΠαρακαλώ περιμένετε...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'Συγχαρητήρια!\nΟ λογαριασμός σας στο $appTitle έχει ενεργοποιηθεί.\nΤώρα μπορείτε να συνδεθείτε στον χώρο σας στο $appTitle.';
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
  String get firstNameRequireText => 'Το όνομα είναι υποχρεωτικό.';

  @override
  String get lastName => 'Επώνυμο';

  @override
  String get lastNameRequireText => 'Το επώνυμο είναι υποχρεωτικό.';

  @override
  String get createPassword => 'Δημιουργήστε έναν κωδικό';

  @override
  String get repeatPassword => 'Επαναλάβετε τον κωδικό';

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
      'Υπάρχει ήδη καταχωρημένος χρήστης με μη επαληθευμένο email.\nΠατήστε \'Επανάληψη αποστολής\' αν θέλετε να ξαναστείλετε το email επαλήθευσης.';

  @override
  String get assignee => 'Ανατεθειμένος χρήστης';

  @override
  String get alarmTypes => 'Τύποι συναγερμών';

  @override
  String get details => 'Λεπτομέρειες';

  @override
  String get status => 'Κατάσταση';

  @override
  String get severity => 'Σοβαρότητα';

  @override
  String get originator => 'Προέλευση';

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
  String get addCommentMessage => 'Προσθέστε σχόλιο...';

  @override
  String get selectUser => 'Επιλέξτε χρήστες';

  @override
  String get assignedToMe => 'Ανατέθηκε σε εμένα';

  @override
  String get clear => 'Εκκαθάριση';

  @override
  String get acknowledge => 'Επιβεβαίωση';

  @override
  String get edit => 'Επεξεργασία';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get edited => 'Επεξεργασμένο';

  @override
  String get deleteComment => 'Διαγραφή σχολίου';

  @override
  String get areYouSure => 'Είστε σίγουροι;';

  @override
  String get noResultsFound => 'Δεν βρέθηκαν αποτελέσματα';

  @override
  String get tryRefiningYourQuery => 'Δοκιμάστε να βελτιώσετε το ερώτημά σας';

  @override
  String get failedToLoadTheList => 'Αποτυχία φόρτωσης της λίστας';

  @override
  String get tryRefreshing => 'Δοκιμάστε να ανανεώσετε';

  @override
  String get refresh => 'Ανανέωση';

  @override
  String get users => 'Χρήστες';

  @override
  String get unassigned => 'Μη ανατεθειμένο';

  @override
  String get failedToLoadAlarmDetails =>
      'Αποτυχία φόρτωσης λεπτομερειών συναγερμού';

  @override
  String get somethingWentWrong => 'Κάτι πήγε στραβά';

  @override
  String get chooseRegion => 'Επιλέξτε περιοχή';

  @override
  String get selectRegion => 'Επιλογή περιοχής';

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
  String get wifiPassword => 'Κωδικός Wi-Fi';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'Για να συνεχίσετε τη ρύθμιση της συσκευής $deviceName, παρακαλώ δώστε τα διαπιστευτήρια του δικτύου σας.';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return 'Εισαγάγετε τον κωδικό για το δίκτυο $network';
  }

  @override
  String get deviceNotFoundMessage =>
      'Δεν βρέθηκαν συσκευές. Βεβαιωθείτε ότι το Bluetooth του τηλεφώνου σας είναι ενεργοποιημένο και ότι βρίσκεστε εντός εμβέλειας της νέας συσκευής.';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return 'Δεν έχετε επαρκή δικαιώματα για \"$permissions\" για να συνεχίσετε. Παρακαλώ δώστε τα απαραίτητα δικαιώματα και πατήστε \"Δοκιμάστε ξανά\".';
  }

  @override
  String get sendingWifiCredentials => 'Αποστολή διαπιστευτηρίων Wi-Fi';

  @override
  String get confirmingWifiConnection => 'Επιβεβαίωση σύνδεσης Wi-Fi';

  @override
  String get provisionedSuccessfully => 'Η συσκευή διαμορφώθηκε με επιτυχία';

  @override
  String get returnToDashboard => 'Επιστροφή στον πίνακα ελέγχου';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'Δεν είναι δυνατή η σύνδεση με τη συσκευή $deviceName. Παρακαλώ δοκιμάστε ξανά';
  }

  @override
  String get claimingDevice => 'Ανάληψη συσκευής';

  @override
  String get claimingDeviceDone => 'Η ανάληψη συσκευής ολοκληρώθηκε';

  @override
  String get claimingMessageSuccess => 'Η συσκευή αναλήφθηκε\nμε επιτυχία';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return 'Δεν έχετε επαρκή δικαιώματα για \"$permissions\" για να συνεχίσετε. Ανοίξτε τις ρυθμίσεις της εφαρμογής, παραχωρήστε τα δικαιώματα και πατήστε \"Δοκιμάστε ξανά\".';
  }

  @override
  String get scanACode => 'Σάρωση κωδικού';

  @override
  String get allowAccess => 'Αποδοχή πρόσβασης';

  @override
  String get toggleCamera => 'Εναλλαγή κάμερας';

  @override
  String get toggleFlash => 'Εναλλαγή φλας';

  @override
  String get unableToUseCamera => 'Αδυναμία χρήσης κάμερας';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      'Ανοίξτε τις ρυθμίσεις και δώστε πρόσβαση στην κάμερα για να συνεχίσετε';

  @override
  String get notFound => 'Δεν βρέθηκε';

  @override
  String routeNotDefined(Object name) {
    return 'Η διαδρομή δεν έχει οριστεί: $name';
  }

  @override
  String get loginWith => 'Σύνδεση με';

  @override
  String get scanQrCode => 'Σάρωση κωδικού QR';

  @override
  String get anEmptyRequestDataReceived => 'Ελήφθησαν κενά δεδομένα αιτήματος.';

  @override
  String get somethingWentWrongRollback => 'Κάτι πήγε στραβά ... Αναίρεση';

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
  String get cleared => 'Εκκαθαρισμένο';

  @override
  String get acknowledged => 'Επιβεβαιωμένο';

  @override
  String get unacknowledged => 'Μη επιβεβαιωμένο';

  @override
  String get critical => 'Κρίσιμο';

  @override
  String get major => 'Σοβαρό';

  @override
  String get minor => 'Ελαφρύ';

  @override
  String get warning => 'Προειδοποίηση';

  @override
  String get indeterminate => 'Απροσδιόριστο';

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
  String get unread => 'Μη αναγνωσμένα';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get codeVerificationFailed => 'Η επαλήθευση κωδικού απέτυχε!';

  @override
  String get fatalError => 'Κρίσιμο σφάλμα';

  @override
  String get unknownError => 'Άγνωστο σφάλμα.';

  @override
  String get sessionExpired => 'Η συνεδρία έληξε';

  @override
  String get fatalApplicationErrorOccurred =>
      'Παρουσιάστηκε κρίσιμο σφάλμα εφαρμογής:';

  @override
  String get connectionError => 'Σφάλμα σύνδεσης';

  @override
  String get failedToConnectToServer => 'Αποτυχία σύνδεσης στον διακομιστή';

  @override
  String get retry => 'Επανάληψη';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'Ο πίνακας ελέγχου κινητού πρέπει να ρυθμιστεί στο προφίλ συσκευής!';

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
      'Ακολουθήστε τα επόμενα βήματα για να επανασυνδέσετε\nτο τηλέφωνό σας στο κανονικό σας Wi-Fi';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'Οι ειδοποιήσεις push δεν έχουν ρυθμιστεί.\nΕπικοινωνήστε με τον διαχειριστή του συστήματός σας.';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Το Firebase δεν έχει ρυθμιστεί.\nΑνατρέξτε στην επίσημη τεκμηρίωση του Firebase\nγια οδηγίες.';

  @override
  String get markAllAsRead => 'Σήμανση όλων ως αναγνωσμένα';

  @override
  String get profile => 'Προφίλ';

  @override
  String cantLaunchUrlLink(String link) {
    return 'Αδυναμία ανοίγματος url: $link';
  }

  @override
  String get noDashboardsFound => 'Δεν βρέθηκαν πίνακες ελέγχου';

  @override
  String get openAppSettings => 'Άνοιγμα ρυθμίσεων εφαρμογής';

  @override
  String get connectingToDevice => 'Σύνδεση με τη συσκευή';

  @override
  String get connectToDevice => 'Σύνδεση στη συσκευή';

  @override
  String get selectWifiNetwork => 'Επιλογή δικτύου Wi-Fi';

  @override
  String get deviceProvisioning => 'Διαμόρφωση συσκευής';

  @override
  String get permissions => 'Δικαιώματα';

  @override
  String get unableConnectToDevice => 'Αδυναμία σύνδεσης στη συσκευή';

  @override
  String get deviceNotAbleToFindWifiNearby =>
      'Η συσκευή δεν μπορεί να βρει Wi-Fi κοντά';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return 'Η σύνδεση στο δίκτυο Wi-Fi $name απέτυχε.\nΒεβαιωθείτε ότι το τηλέφωνό σας είναι συνδεδεμένο στο δίκτυο Wi-Fi της συσκευής και ότι η πρόσβαση τοπικού δικτύου είναι ενεργοποιημένη.';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'Αδυναμία σύνδεσης στο Wi-Fi επειδή η συσκευή $name δεν βρήκε δίκτυα';
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
  String get exitDeviceProvisioning => 'Έξοδος από τη διαμόρφωση';

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
  String get ruleNode => 'Κόμβος κανόνων';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'Προβολή οντότητας';

  @override
  String get widgetsBundle => 'Πακέτο widgets';

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
  String get notificationTarget => 'Στόχος ειδοποίησης';

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
  String get blobEntity => 'Οντότητα Blob';

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
  String get actionTypeAttributesUpdated => 'Χαρακτηριστικά ενημερώθηκαν';

  @override
  String get actionTypeAttributesDeleted => 'Χαρακτηριστικά διαγράφηκαν';

  @override
  String get actionTypeRpcCall => 'Κλήση RPC';

  @override
  String get actionTypeCredentialsUpdated => 'Διαπιστευτήρια ενημερώθηκαν';

  @override
  String get actionTypeAssignedToCustomer => 'Ανατέθηκε σε πελάτη';

  @override
  String get actionTypeUnassignedFromCustomer => 'Αφαιρέθηκε από πελάτη';

  @override
  String get actionTypeActivated => 'Ενεργοποιήθηκε';

  @override
  String get actionTypeSuspended => 'Ανεστάλη';

  @override
  String get actionTypeCredentialsRead => 'Διαπιστευτήρια αναγνώστηκαν';

  @override
  String get actionTypeAttributesRead => 'Χαρακτηριστικά αναγνώστηκαν';

  @override
  String get actionTypeRelationAddOrUpdate => 'Σχέση ενημερώθηκε';

  @override
  String get actionTypeRelationDeleted => 'Σχέση διαγράφηκε';

  @override
  String get actionTypeRelationsDeleted => 'Όλες οι σχέσεις διαγράφηκαν';

  @override
  String get actionTypeAlarmAck => 'Επιβεβαιώθηκε';

  @override
  String get actionTypeAlarmClear => 'Εκκαθαρίστηκε';

  @override
  String get actionTypeAlarmDelete => 'Συναγερμός διαγράφηκε';

  @override
  String get actionTypeAlarmAssigned => 'Συναγερμός ανατέθηκε';

  @override
  String get actionTypeAlarmUnassigned => 'Συναγερμός αφαιρέθηκε';

  @override
  String get actionTypeLogin => 'Σύνδεση';

  @override
  String get actionTypeLogout => 'Αποσύνδεση';

  @override
  String get actionTypeLockout => 'Κλείδωμα';

  @override
  String get actionTypeAssignedFromTenant => 'Ανατέθηκε από ενοικιαστή';

  @override
  String get actionTypeAssignedToTenant => 'Ανατέθηκε σε ενοικιαστή';

  @override
  String get actionTypeProvisionSuccess => 'Συσκευή διαμορφώθηκε';

  @override
  String get actionTypeProvisionFailure => 'Η διαμόρφωση απέτυχε';

  @override
  String get actionTypeTimeseriesUpdated => 'Τηλεμετρία ενημερώθηκε';

  @override
  String get actionTypeTimeseriesDeleted => 'Τηλεμετρία διαγράφηκε';

  @override
  String get actionTypeAssignedToEdge => 'Ανατέθηκε σε Edge';

  @override
  String get actionTypeUnassignedFromEdge => 'Αφαιρέθηκε από Edge';

  @override
  String get actionTypeAddedComment => 'Σχόλιο προστέθηκε';

  @override
  String get actionTypeUpdatedComment => 'Σχόλιο ενημερώθηκε';

  @override
  String get actionTypeDeletedComment => 'Σχόλιο διαγράφηκε';

  @override
  String get actionTypeSmsSent => 'SMS εστάλη';

  @override
  String get actionTypeAddedToEntityGroup => 'Προστέθηκε στην ομάδα οντοτήτων';

  @override
  String get actionTypeRemovedFromEntityGroup =>
      'Αφαιρέθηκε από την ομάδα οντοτήτων';

  @override
  String get actionTypeRestApiRuleEngineCall =>
      'Κλήση μηχανής κανόνων REST API';

  @override
  String get actionTypeMadePublic => 'Έγινε δημόσιο';

  @override
  String get actionTypeMadePrivate => 'Έγινε ιδιωτικό';

  @override
  String get actionTypeChangeOwner => 'Αλλαγή ιδιοκτήτη';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'Δεν έχετε δικαιώματα για να εκτελέσετε αυτήν τη λειτουργία!';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'Φαίνεται ότι τα δικαιώματά σας δεν επαρκούν για να ολοκληρώσετε αυτήν τη λειτουργία';

  @override
  String get isRequiredText => 'είναι υποχρεωτικό.';

  @override
  String get no2faProvidersFound => 'Δεν βρέθηκαν πάροχοι 2FA';

  @override
  String get pleaseContactYourSystemAdministrator =>
      'Επικοινωνήστε με τον διαχειριστή του συστήματος';

  @override
  String errorOccured(Object e) {
    return 'Παρουσιάστηκε σφάλμα: $e';
  }

  @override
  String get unsavedChanges => 'Μη αποθηκευμένες αλλαγές';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      'Έχετε μη αποθηκευμένες αλλαγές. Είστε σίγουροι ότι θέλετε να φύγετε;';

  @override
  String get deleteAccount => 'Διαγραφή λογαριασμού';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'Είστε σίγουροι; Πρόκειται να διαγράψετε τον λογαριασμό $authority σας.';
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
  String get languageAuto => 'Αυτόματο';

  @override
  String get unitSystem => 'Σύστημα μονάδων';

  @override
  String get selectCountry => 'Επιλογή χώρας';

  @override
  String get hideHomeDashboardToolbar =>
      'Απόκρυψη γραμμής εργαλείων πίνακα ελέγχου';

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
      'Ρυθμίστε μια μέθοδο επαλήθευσης για να συνεχίσετε τη σύνδεση';

  @override
  String get setUpAVerificationMethod => 'Ρύθμιση μεθόδου επαλήθευσης';

  @override
  String get totpSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα χρειαστεί να δώσετε κωδικό ελέγχου δύο παραγόντων';

  @override
  String get smsSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα σας ζητηθεί ο κωδικός ασφαλείας που θα σταλεί στο τηλέφωνο';

  @override
  String get emailSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, θα σας ζητηθεί ο κωδικός ασφαλείας που θα σταλεί στο email σας';

  @override
  String get backupCodeSetupSuccessDescription =>
      'Την επόμενη φορά που θα συνδεθείτε, μπορείτε να χρησιμοποιήσετε εφεδρικούς κωδικούς';

  @override
  String get loginToApp => 'Σύνδεση στην εφαρμογή';

  @override
  String get goBack => 'Πίσω';

  @override
  String get done => 'Ολοκληρώθηκε';

  @override
  String get thisWillMakeYourAccountLessSecure =>
      'Αυτό θα κάνει τον λογαριασμό σας λιγότερο ασφαλή';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return 'Είστε σίγουροι ότι θέλετε να απενεργοποιήσετε $providerName;';
  }

  @override
  String get yesDeactivate => 'Ναι, απενεργοποίηση';

  @override
  String get enterAnEmailToUseAsYourAuthenticator =>
      'Εισαγάγετε ένα email για χρήση ως μέθοδο ελέγχου ταυτότητας.';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      'Εισαγάγετε αριθμό τηλεφώνου για χρήση ως μέθοδο ελέγχου ταυτότητας';

  @override
  String get sendCode => 'Αποστολή κωδικού';

  @override
  String errorSendingCode(String error) {
    return 'Σφάλμα αποστολής κωδικού: $error';
  }

  @override
  String get copy => 'Αντιγραφή';

  @override
  String get copiedToClipboard => 'Αντιγράφηκε στο πρόχειρο';

  @override
  String get enter6digitsKeyFromYourAppHere =>
      'Εισάγετε τον 6-ψήφιο κωδικό εδώ';

  @override
  String digitsCode(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ψήφιος',
      one: 'ψήφιος',
    );
    return '$count-$_temp0 κωδικός';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      'Αντιγράψτε το 32ψήφιο κλειδί στην εφαρμογή ελέγχου ταυτότητας ή σαρώστε τον κωδικό QR';

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
      'Ο έλεγχος ταυτότητας δύο παραγόντων προστατεύει τον λογαριασμό σας. Αρκεί να εισαγάγετε έναν κωδικό ασφαλείας κατά τη σύνδεση.';

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
  String get mobileAppBundle => 'Πακέτο εφαρμογής κινητού';

  @override
  String get mobileApp => 'Εφαρμογή κινητού';

  @override
  String get domain => 'Τομέας';

  @override
  String get oauth2Client => 'Πελάτης OAuth2';

  @override
  String get queueStats => 'Στατιστικά ουράς';

  @override
  String get phoneIsRequired => 'Το τηλέφωνο είναι υποχρεωτικό';

  @override
  String get phoneIsInvalid => 'Ο αριθμός τηλεφώνου δεν είναι έγκυρος';

  @override
  String get addVerificationMethod => 'Προσθήκη μεθόδου επαλήθευσης';

  @override
  String get imageSavedToGallery => 'Αποθηκεύτηκε στη \'Συλλογή εικόνων\'';

  @override
  String get failedToSaveImage => 'Αποτυχία αποθήκευσης εικόνας';

  @override
  String nSelected(int count) {
    return '$count επιλεγμένα';
  }

  @override
  String get selectAll => 'Επιλογή όλων των φορτωμένων';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ενέργειες απέτυχαν',
      one: '1 ενέργεια απέτυχε',
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
  String get liveTrackingActive =>
      'Παρακολούθηση τοποθεσίας σε πραγματικό χρόνο';

  @override
  String get liveTrackingPaused =>
      'Η παρακολούθηση σε πραγματικό χρόνο είναι σε παύση';

  @override
  String get liveTrackingFixes => 'Θέσεις';

  @override
  String get liveTrackingSaved => 'Αποθηκεύτηκαν';

  @override
  String get liveTrackingErrors => 'Σφάλματα';

  @override
  String get liveTrackingStop => 'Διακοπή';

  @override
  String get liveTrackingPause => 'Παύση';

  @override
  String get liveTrackingResume => 'Συνέχεια';

  @override
  String get liveTrackingHide => 'Απόκρυψη';

  @override
  String get liveTrackingSessionTitle =>
      'Παρακολούθηση τοποθεσίας σε πραγματικό χρόνο';

  @override
  String get liveTrackingTarget => 'Αποθήκευση τοποθεσίας στην οντότητα';

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
      'Δεν είναι δυνατή η αποθήκευση σε αυτήν την οντότητα — δεν υπάρχει πλέον. Η παρακολούθηση συνεχίζεται· ενημερώστε τον στόχο στην ενέργεια του πίνακα ελέγχου.';

  @override
  String get liveTrackingErrorNoConnection =>
      'Δεν υπάρχει σύνδεση με τον διακομιστή. Αυτές οι θέσεις δεν αποθηκεύτηκαν — η αποθήκευση θα συνεχιστεί όταν συνδεθείτε ξανά.';

  @override
  String get liveTrackingErrorUnauthorized =>
      'Η συνεδρία σας έληξε. Συνδεθείτε ξανά για να συνεχιστεί η αποθήκευση της τοποθεσίας.';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'Δεν είναι δυνατή η αποθήκευση σε αυτήν την οντότητα — δεν έχετε δικαίωμα. Η παρακολούθηση συνεχίζεται· ζητήστε πρόσβαση από τον διαχειριστή σας.';

  @override
  String get liveTrackingErrorSaveFailed =>
      'Δεν ήταν δυνατή η αποθήκευση αυτής της θέσης στον διακομιστή. Θα γίνει νέα προσπάθεια με την επόμενη θέση.';

  @override
  String get liveTrackingErrorServicesDisabled =>
      'Οι υπηρεσίες τοποθεσίας είναι απενεργοποιημένες σε αυτήν τη συσκευή.';

  @override
  String get liveTrackingErrorPermissionDenied =>
      'Η άδεια τοποθεσίας απορρίφθηκε.';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      'Η άδεια τοποθεσίας έχει απορριφθεί οριστικά. Ενεργοποιήστε την στις ρυθμίσεις της εφαρμογής.';

  @override
  String get liveTrackingErrorLocation =>
      'Δεν ήταν δυνατός ο προσδιορισμός της θέσης.';

  @override
  String get liveTrackingMenuTitle =>
      'Παρακολούθηση τοποθεσίας σε πραγματικό χρόνο';

  @override
  String get liveTrackingNoRecord =>
      'Καμία ενεργή παρακολούθηση και καμία πρόσφατη συνεδρία.';

  @override
  String get liveTrackingLastSession => 'Τελευταία συνεδρία';

  @override
  String get liveTrackingStartAgain => 'Νέα έναρξη';

  @override
  String get liveTrackingEnded => 'Ώρα λήξης';

  @override
  String get liveTrackingEndReason => 'Αιτία λήξης';

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
    return 'Αυτή η εφαρμογή λειτουργεί με ThingsBoard $minVersion ή νεότερη.';
  }

  @override
  String get serverLabel => 'Διακομιστής';

  @override
  String get versionLabel => 'Έκδοση';

  @override
  String get askAdminToUpdateServer =>
      'Ζητήστε από τον διαχειριστή του διακομιστή να τον ενημερώσει.';

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
  String get openInAuthenticatorApp => 'Άνοιγμα σε εφαρμογή ελέγχου ταυτότητας';

  @override
  String get noAuthenticatorAppFound =>
      'Δεν βρέθηκε εφαρμογή ελέγχου ταυτότητας. Αντιγράψτε το κλειδί στην εφαρμογή σας.';

  @override
  String twoFaProviderEnabled(String provider) {
    return 'Το $provider ενεργοποιήθηκε';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return 'Ο διαχειριστής σας απαιτεί έλεγχο ταυτότητας δύο παραγόντων για το $email.';
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
