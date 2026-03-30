// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a el_GR locale. All the
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
  String get localeName => 'el_GR';

  static String m0(appTitle) =>
      "Συγχαρητήρια!\nΟ λογαριασμός σας στο ${appTitle} έχει ενεργοποιηθεί.\nΤώρα μπορείτε να συνδεθείτε στον χώρο σας στο ${appTitle}.";

  static String m2(count) => "Συναγερμοί";

  static String m4(deviceName) =>
      "Δεν είναι δυνατή η σύνδεση με τη συσκευή ${deviceName}. Παρακαλώ δοκιμάστε ξανά";

  static String m8(count) => "Πίνακες ελέγχου";

  static String m9(count) => "Συσκευές";

  static String m11(contact) =>
      "Ένας κωδικός ασφαλείας έχει σταλεί στο email σας στη διεύθυνση ${contact}.";

  static String m13(count) => "Ειδοποιήσεις";

  static String m14(permissions) =>
      "Δεν έχετε επαρκή δικαιώματα για \"${permissions}\" για να συνεχίσετε. Ανοίξτε τις ρυθμίσεις της εφαρμογής, παραχωρήστε τα δικαιώματα και πατήστε \"Δοκιμάστε ξανά\".";

  static String m15(permissions) =>
      "Δεν έχετε επαρκή δικαιώματα για \"${permissions}\" για να συνεχίσετε. Παρακαλώ δώστε τα απαραίτητα δικαιώματα και πατήστε \"Δοκιμάστε ξανά\".";

  static String m16(deviceName) =>
      "Εισαγάγετε το PIN της συσκευής ${deviceName} για επιβεβαίωση ιδιοκτησίας";

  static String m17(time) =>
      "Επανάληψη αποστολής σε ${Intl.plural(time, one: '1 δευτερόλεπτο', other: '${time} δευτερόλεπτα')}";

  static String m20(contact) =>
      "Ένας κωδικός ασφαλείας έχει σταλεί στο τηλέφωνό σας στο ${contact}.";

  static String m22(version) => "Ενημέρωση σε ${version}";

  static String m23(deviceName) =>
      "Για να συνεχίσετε τη ρύθμιση της συσκευής ${deviceName}, παρακαλώ δώστε τα διαπιστευτήρια του δικτύου σας.";

  static String m24(network) =>
      "Εισαγάγετε τον κωδικό για το δίκτυο ${network}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accept": MessageLookupByLibrary.simpleMessage("Αποδοχή"),
    "acceptPrivacyPolicyMessage": MessageLookupByLibrary.simpleMessage(
      "Πρέπει να αποδεχθείτε την Πολιτική απορρήτου",
    ),
    "acceptTermsOfUseMessage": MessageLookupByLibrary.simpleMessage(
      "Πρέπει να αποδεχθείτε τους Όρους χρήσης",
    ),
    "accountActivated": MessageLookupByLibrary.simpleMessage(
      "Ο λογαριασμός ενεργοποιήθηκε με επιτυχία!",
    ),
    "accountActivatedText": m0,
    "acknowledge": MessageLookupByLibrary.simpleMessage("Επιβεβαίωση"),
    "actionData": MessageLookupByLibrary.simpleMessage("Δεδομένα ενέργειας"),
    "activatingAccount": MessageLookupByLibrary.simpleMessage(
      "Ενεργοποίηση λογαριασμού...",
    ),
    "activatingAccountText": MessageLookupByLibrary.simpleMessage(
      "Ο λογαριασμός σας ενεργοποιείται αυτή τη στιγμή.\nΠαρακαλώ περιμένετε...",
    ),
    "active": MessageLookupByLibrary.simpleMessage("Ενεργό"),
    "activity": MessageLookupByLibrary.simpleMessage("Δραστηριότητα"),
    "addCommentMessage": MessageLookupByLibrary.simpleMessage(
      "Προσθέστε σχόλιο...",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Διεύθυνση"),
    "address2": MessageLookupByLibrary.simpleMessage("Διεύθυνση 2"),
    "alarmAcknowledgeText": MessageLookupByLibrary.simpleMessage(
      "Είστε βέβαιοι ότι θέλετε να επιβεβαιώσετε τον συναγερμό;",
    ),
    "alarmAcknowledgeTitle": MessageLookupByLibrary.simpleMessage(
      "Επιβεβαίωση συναγερμού",
    ),
    "alarmClearText": MessageLookupByLibrary.simpleMessage(
      "Είστε βέβαιοι ότι θέλετε να εκκαθαρίσετε τον συναγερμό;",
    ),
    "alarmClearTitle": MessageLookupByLibrary.simpleMessage(
      "Εκκαθάριση συναγερμού",
    ),
    "alarmTypes": MessageLookupByLibrary.simpleMessage("Τύποι συναγερμών"),
    "alarms": m2,
    "allDevices": MessageLookupByLibrary.simpleMessage("Όλες οι συσκευές"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Έχετε ήδη λογαριασμό;",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("ThingsBoard"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Είστε σίγουροι;"),
    "assetName": MessageLookupByLibrary.simpleMessage(
      "Όνομα περιουσιακού στοιχείου",
    ),
    "assets": MessageLookupByLibrary.simpleMessage("Περιουσιακά στοιχεία"),
    "assignedToCustomer": MessageLookupByLibrary.simpleMessage(
      "Ανατέθηκε σε πελάτη",
    ),
    "assignedToMe": MessageLookupByLibrary.simpleMessage("Ανατέθηκε σε εμένα"),
    "assignee": MessageLookupByLibrary.simpleMessage("Ανατεθειμένος χρήστης"),
    "auditLogDetails": MessageLookupByLibrary.simpleMessage(
      "Λεπτομέρειες αρχείου καταγραφής ελέγχου",
    ),
    "auditLogs": MessageLookupByLibrary.simpleMessage(
      "Αρχεία καταγραφής ελέγχου",
    ),
    "backupCodeAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Εισαγάγετε έναν από τους εφεδρικούς σας κωδικούς.",
    ),
    "backupCodeAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Εφεδρικός κωδικός",
    ),
    "bleHelpMessage": MessageLookupByLibrary.simpleMessage(
      "Για να διαμορφώσετε τη νέα σας συσκευή, βεβαιωθείτε ότι το Bluetooth του τηλεφώνου σας είναι ενεργοποιημένο και εντός εμβέλειας της νέας συσκευής",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Ακύρωση"),
    "cannotEstablishSession": m4,
    "changePassword": MessageLookupByLibrary.simpleMessage(
      "Αλλαγή κωδικού πρόσβασης",
    ),
    "chooseRegion": MessageLookupByLibrary.simpleMessage("Επιλέξτε περιοχή"),
    "city": MessageLookupByLibrary.simpleMessage("Πόλη"),
    "claimingDevice": MessageLookupByLibrary.simpleMessage("Ανάληψη συσκευής"),
    "claimingDeviceDone": MessageLookupByLibrary.simpleMessage(
      "Η ανάληψη συσκευής ολοκληρώθηκε",
    ),
    "claimingMessageSuccess": MessageLookupByLibrary.simpleMessage(
      "Η συσκευή αναλήφθηκε\nμε επιτυχία",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Εκκαθάριση"),
    "confirmNotRobotMessage": MessageLookupByLibrary.simpleMessage(
      "Πρέπει να επιβεβαιώσετε ότι δεν είστε ρομπότ",
    ),
    "confirmation": MessageLookupByLibrary.simpleMessage("Επιβεβαίωση"),
    "confirmingWifiConnection": MessageLookupByLibrary.simpleMessage(
      "Επιβεβαίωση σύνδεσης Wi-Fi",
    ),
    "continueText": MessageLookupByLibrary.simpleMessage("Συνέχεια"),
    "country": MessageLookupByLibrary.simpleMessage("Χώρα"),
    "createAccount": MessageLookupByLibrary.simpleMessage(
      "Δημιουργία λογαριασμού",
    ),
    "createPassword": MessageLookupByLibrary.simpleMessage(
      "Δημιουργήστε έναν κωδικό",
    ),
    "currentPassword": MessageLookupByLibrary.simpleMessage(
      "Τρέχων κωδικός πρόσβασης",
    ),
    "currentPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Ο τρέχων κωδικός πρόσβασης είναι υποχρεωτικός.",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Πελάτης"),
    "customers": MessageLookupByLibrary.simpleMessage("Πελάτες"),
    "dashboards": m8,
    "days": MessageLookupByLibrary.simpleMessage("ημέρες"),
    "delete": MessageLookupByLibrary.simpleMessage("Διαγραφή"),
    "deleteComment": MessageLookupByLibrary.simpleMessage("Διαγραφή σχολίου"),
    "details": MessageLookupByLibrary.simpleMessage("Λεπτομέρειες"),
    "deviceList": MessageLookupByLibrary.simpleMessage("Λίστα συσκευών"),
    "deviceNotFoundMessage": MessageLookupByLibrary.simpleMessage(
      "Δεν βρέθηκαν συσκευές. Βεβαιωθείτε ότι το Bluetooth του τηλεφώνου σας είναι ενεργοποιημένο και ότι βρίσκεστε εντός εμβέλειας της νέας συσκευής.",
    ),
    "devices": m9,
    "duration": MessageLookupByLibrary.simpleMessage("Διάρκεια"),
    "edit": MessageLookupByLibrary.simpleMessage("Επεξεργασία"),
    "edited": MessageLookupByLibrary.simpleMessage("Επεξεργασμένο"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAuthDescription": m11,
    "emailAuthPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Κωδικός email",
    ),
    "emailInvalidText": MessageLookupByLibrary.simpleMessage(
      "Μη έγκυρη μορφή email.",
    ),
    "emailRequireText": MessageLookupByLibrary.simpleMessage(
      "Το email είναι υποχρεωτικό.",
    ),
    "emailVerification": MessageLookupByLibrary.simpleMessage(
      "Επαλήθευση email",
    ),
    "emailVerificationInstructionsText": MessageLookupByLibrary.simpleMessage(
      "Ακολουθήστε τις οδηγίες που περιλαμβάνονται στο email για να ολοκληρώσετε τη διαδικασία εγγραφής σας. Σημείωση: αν δεν δείτε το email, ελέγξτε τον φάκελο \'ανεπιθύμητα\' ή δοκιμάστε να το ξαναστείλετε πατώντας το κουμπί \'Επανάληψη αποστολής\'.",
    ),
    "emailVerificationSentText": MessageLookupByLibrary.simpleMessage(
      "Ένα email με λεπτομέρειες επαλήθευσης στάλθηκε στη δηλωμένη διεύθυνση email",
    ),
    "emailVerified": MessageLookupByLibrary.simpleMessage(
      "Το email επαληθεύτηκε",
    ),
    "entityType": MessageLookupByLibrary.simpleMessage("Τύπος οντότητας"),
    "europe": MessageLookupByLibrary.simpleMessage("Ευρώπη"),
    "europeRegionShort": MessageLookupByLibrary.simpleMessage("Φρανκφούρτη"),
    "failedToLoadAlarmDetails": MessageLookupByLibrary.simpleMessage(
      "Αποτυχία φόρτωσης λεπτομερειών συναγερμού",
    ),
    "failedToLoadTheList": MessageLookupByLibrary.simpleMessage(
      "Αποτυχία φόρτωσης της λίστας",
    ),
    "failureDetails": MessageLookupByLibrary.simpleMessage(
      "Λεπτομέρειες αποτυχίας",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("Όνομα"),
    "firstNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Το όνομα είναι υποχρεωτικό.",
    ),
    "firstNameUpper": MessageLookupByLibrary.simpleMessage("Όνομα"),
    "home": MessageLookupByLibrary.simpleMessage("Αρχική"),
    "hours": MessageLookupByLibrary.simpleMessage("ώρες"),
    "imNotARobot": MessageLookupByLibrary.simpleMessage("Δεν είμαι ρομπότ"),
    "inactive": MessageLookupByLibrary.simpleMessage("Ανενεργό"),
    "inactiveUserAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Υπάρχει ήδη ανενεργός χρήστης",
    ),
    "inactiveUserAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Υπάρχει ήδη καταχωρημένος χρήστης με μη επαληθευμένο email.\nΠατήστε \'Επανάληψη αποστολής\' αν θέλετε να ξαναστείλετε το email επαλήθευσης.",
    ),
    "invalidPasswordLengthMessage": MessageLookupByLibrary.simpleMessage(
      "Ο κωδικός σας πρέπει να περιέχει τουλάχιστον 6 χαρακτήρες",
    ),
    "label": MessageLookupByLibrary.simpleMessage("Ετικέτα"),
    "lastName": MessageLookupByLibrary.simpleMessage("Επώνυμο"),
    "lastNameRequireText": MessageLookupByLibrary.simpleMessage(
      "Το επώνυμο είναι υποχρεωτικό.",
    ),
    "lastNameUpper": MessageLookupByLibrary.simpleMessage("Επώνυμο"),
    "listIsEmptyText": MessageLookupByLibrary.simpleMessage(
      "Η λίστα είναι προς το παρόν κενή.",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Σύνδεση"),
    "logoDefaultValue": MessageLookupByLibrary.simpleMessage(
      "Λογότυπο ThingsBoard",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Αποσύνδεση"),
    "mfaProviderBackupCode": MessageLookupByLibrary.simpleMessage(
      "Εφεδρικός κωδικός",
    ),
    "mfaProviderEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "mfaProviderSms": MessageLookupByLibrary.simpleMessage("SMS"),
    "mfaProviderTopt": MessageLookupByLibrary.simpleMessage(
      "Εφαρμογή ελέγχου ταυτότητας",
    ),
    "minutes": MessageLookupByLibrary.simpleMessage("λεπτά"),
    "more": MessageLookupByLibrary.simpleMessage("Περισσότερα"),
    "newPassword": MessageLookupByLibrary.simpleMessage(
      "Νέος κωδικός πρόσβασης",
    ),
    "newPassword2": MessageLookupByLibrary.simpleMessage(
      "Επιβεβαίωση νέου κωδικού πρόσβασης",
    ),
    "newPassword2RequireText": MessageLookupByLibrary.simpleMessage(
      "Η επιβεβαίωση του νέου κωδικού πρόσβασης είναι υποχρεωτική.",
    ),
    "newPasswordRequireText": MessageLookupByLibrary.simpleMessage(
      "Ο νέος κωδικός πρόσβασης είναι υποχρεωτικός.",
    ),
    "newUserText": MessageLookupByLibrary.simpleMessage("Νέος χρήστης;"),
    "next": MessageLookupByLibrary.simpleMessage("Επόμενο"),
    "no": MessageLookupByLibrary.simpleMessage("Όχι"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Δεν βρέθηκαν αποτελέσματα",
    ),
    "northAmerica": MessageLookupByLibrary.simpleMessage("Βόρεια Αμερική"),
    "northAmericaRegionShort": MessageLookupByLibrary.simpleMessage(
      "Β. Βιρτζίνια",
    ),
    "notImplemented": MessageLookupByLibrary.simpleMessage(
      "Δεν έχει υλοποιηθεί!",
    ),
    "notifications": m13,
    "openAppSettingsToGrantPermissionMessage": m14,
    "or": MessageLookupByLibrary.simpleMessage("Ή"),
    "originator": MessageLookupByLibrary.simpleMessage("Προέλευση"),
    "password": MessageLookupByLibrary.simpleMessage("Κωδικός πρόσβασης"),
    "passwordErrorNotification": MessageLookupByLibrary.simpleMessage(
      "Οι κωδικοί πρόσβασης που εισάγατε πρέπει να είναι ίδιοι!",
    ),
    "passwordForgotText": MessageLookupByLibrary.simpleMessage(
      "Ξεχάσατε τον κωδικό;",
    ),
    "passwordRequireText": MessageLookupByLibrary.simpleMessage(
      "Ο κωδικός πρόσβασης είναι υποχρεωτικός.",
    ),
    "passwordReset": MessageLookupByLibrary.simpleMessage("Επαναφορά κωδικού"),
    "passwordResetLinkSuccessfullySentNotification":
        MessageLookupByLibrary.simpleMessage(
          "Ο σύνδεσμος επαναφοράς κωδικού εστάλη με επιτυχία!",
        ),
    "passwordResetText": MessageLookupByLibrary.simpleMessage(
      "Εισαγάγετε το email που σχετίζεται με τον λογαριασμό σας και θα σας στείλουμε έναν σύνδεσμο επαναφοράς κωδικού",
    ),
    "passwordSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Ο κωδικός πρόσβασης άλλαξε με επιτυχία",
    ),
    "permissionsNotEnoughMessage": m15,
    "phone": MessageLookupByLibrary.simpleMessage("Τηλέφωνο"),
    "popTitle": m16,
    "postalCode": MessageLookupByLibrary.simpleMessage("Ταχυδρομικός κώδικας"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Πολιτική απορρήτου"),
    "profileSuccessNotification": MessageLookupByLibrary.simpleMessage(
      "Το προφίλ ενημερώθηκε με επιτυχία",
    ),
    "provisionedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Η συσκευή διαμορφώθηκε με επιτυχία",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Ανανέωση"),
    "repeatPassword": MessageLookupByLibrary.simpleMessage(
      "Επαναλάβετε τον κωδικό",
    ),
    "requestPasswordReset": MessageLookupByLibrary.simpleMessage(
      "Αίτηση επαναφοράς κωδικού",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Επανάληψη αποστολής"),
    "resendCode": MessageLookupByLibrary.simpleMessage(
      "Επανάληψη αποστολής κωδικού",
    ),
    "resendCodeWait": m17,
    "returnToDashboard": MessageLookupByLibrary.simpleMessage(
      "Επιστροφή στον πίνακα ελέγχου",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("δευτερόλεπτα"),
    "selectRegion": MessageLookupByLibrary.simpleMessage("Επιλογή περιοχής"),
    "selectUser": MessageLookupByLibrary.simpleMessage("Επιλέξτε χρήστες"),
    "selectWayToVerify": MessageLookupByLibrary.simpleMessage(
      "Επιλέξτε τρόπο επαλήθευσης",
    ),
    "sendingWifiCredentials": MessageLookupByLibrary.simpleMessage(
      "Αποστολή διαπιστευτηρίων Wi-Fi",
    ),
    "severity": MessageLookupByLibrary.simpleMessage("Σοβαρότητα"),
    "signIn": MessageLookupByLibrary.simpleMessage("Σύνδεση"),
    "signUp": MessageLookupByLibrary.simpleMessage("Εγγραφή"),
    "smsAuthDescription": m20,
    "smsAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Κωδικός SMS"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Κάτι πήγε στραβά",
    ),
    "startTime": MessageLookupByLibrary.simpleMessage("Ώρα έναρξης"),
    "stateOrProvince": MessageLookupByLibrary.simpleMessage(
      "Πολιτεία / Επαρχία",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Κατάσταση"),
    "systemAdministrator": MessageLookupByLibrary.simpleMessage(
      "Διαχειριστής συστήματος",
    ),
    "tenantAdministrator": MessageLookupByLibrary.simpleMessage(
      "Διαχειριστής ενοικιαστή",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Όροι χρήσης"),
    "title": MessageLookupByLibrary.simpleMessage("Τίτλος"),
    "toptAuthPlaceholder": MessageLookupByLibrary.simpleMessage("Κωδικός"),
    "totpAuthDescription": MessageLookupByLibrary.simpleMessage(
      "Εισαγάγετε τον κωδικό ασφαλείας από την εφαρμογή ελέγχου ταυτότητας.",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Δοκιμάστε ξανά"),
    "tryAnotherWay": MessageLookupByLibrary.simpleMessage(
      "Δοκιμάστε άλλο τρόπο",
    ),
    "tryRefiningYourQuery": MessageLookupByLibrary.simpleMessage(
      "Δοκιμάστε να βελτιώσετε το ερώτημά σας",
    ),
    "tryRefreshing": MessageLookupByLibrary.simpleMessage(
      "Δοκιμάστε να ανανεώσετε",
    ),
    "type": MessageLookupByLibrary.simpleMessage("Τύπος"),
    "unassigned": MessageLookupByLibrary.simpleMessage("Μη ανατεθειμένο"),
    "updateRequired": MessageLookupByLibrary.simpleMessage(
      "Απαιτείται ενημέρωση",
    ),
    "updateTo": m22,
    "username": MessageLookupByLibrary.simpleMessage("όνομα χρήστη"),
    "users": MessageLookupByLibrary.simpleMessage("Χρήστες"),
    "verificationCodeIncorrect": MessageLookupByLibrary.simpleMessage(
      "Ο κωδικός επαλήθευσης είναι λανθασμένος",
    ),
    "verificationCodeInvalid": MessageLookupByLibrary.simpleMessage(
      "Μη έγκυρη μορφή κωδικού επαλήθευσης",
    ),
    "verificationCodeManyRequest": MessageLookupByLibrary.simpleMessage(
      "Υπερβολικά πολλές αιτήσεις για επαλήθευση κωδικού",
    ),
    "verifyYourIdentity": MessageLookupByLibrary.simpleMessage(
      "Επαληθεύστε την ταυτότητά σας",
    ),
    "viewDashboard": MessageLookupByLibrary.simpleMessage(
      "Προβολή πίνακα ελέγχου",
    ),
    "wifiHelpMessage": m23,
    "wifiPassword": MessageLookupByLibrary.simpleMessage("Κωδικός Wi-Fi"),
    "wifiPasswordMessage": m24,
    "yes": MessageLookupByLibrary.simpleMessage("Ναι"),
  };
}
