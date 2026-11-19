// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class SJa extends S {
  SJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ThingsBoard';

  @override
  String get home => 'ホーム';

  @override
  String devices(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'デバイス',
      one: 'デバイス',
    );
    return '$_temp0';
  }

  @override
  String get more => 'その他';

  @override
  String get customers => '顧客';

  @override
  String get assets => 'アセット';

  @override
  String get tenants => 'テナント';

  @override
  String get auditLogs => '監査ログ';

  @override
  String get noCustomersFound => '顧客が見つかりません';

  @override
  String get noAssetsFound => 'アセットが見つかりません';

  @override
  String get noTenantsFound => 'テナントが見つかりません';

  @override
  String get noDevicesFound => 'デバイスが見つかりません';

  @override
  String get noAuditLogsFound => '監査ログが見つかりません';

  @override
  String get logout => 'ログアウト';

  @override
  String get login => 'ログイン';

  @override
  String get logoDefaultValue => 'ThingsBoardロゴ';

  @override
  String get loginToYourAccount => 'アカウントにログイン';

  @override
  String get email => 'メールアドレス';

  @override
  String get emailRequireText => 'メールは必須です。';

  @override
  String get emailInvalidText => '無効なメールアドレス形式です。';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get passwordRequireText => 'パスワードは必須です。';

  @override
  String get passwordForgotText => 'パスワードをお忘れですか？';

  @override
  String get passwordReset => 'パスワードをリセット';

  @override
  String get passwordResetText =>
      'アカウントに関連付けられたメールアドレスを入力してください。パスワードリセットリンクをメールでお送りします。';

  @override
  String get requestPasswordReset => 'パスワードリセットをリクエスト';

  @override
  String get passwordResetLinkSuccessfullySentNotification =>
      'パスワードリセットリンクを送信しました。';

  @override
  String get emailVersificationSuccessfullySentNotification =>
      'メール確認リンクを送信しました。';

  @override
  String get or => 'または';

  @override
  String get no => 'いいえ';

  @override
  String get yes => 'はい';

  @override
  String get title => 'タイトル';

  @override
  String get country => '国';

  @override
  String get city => '市区町村';

  @override
  String get stateOrProvince => '州 / 県';

  @override
  String get postalCode => '郵便番号';

  @override
  String get address => '住所';

  @override
  String get address2 => '住所2';

  @override
  String get phone => '電話番号';

  @override
  String get alarmClearTitle => 'アラームをクリア';

  @override
  String get alarmClearText => 'アラームをクリアしてもよろしいですか？';

  @override
  String get alarmAcknowledgeTitle => 'アラームを確認';

  @override
  String get alarmAcknowledgeText => 'アラームを確認してもよろしいですか？';

  @override
  String get assetName => 'アセット名';

  @override
  String get type => 'タイプ';

  @override
  String get label => 'ラベル';

  @override
  String get assignedToCustomer => '顧客に割り当て済み';

  @override
  String get auditLogDetails => '監査ログ詳細';

  @override
  String get customerDetails => '顧客詳細';

  @override
  String get assetDetails => 'アセット詳細';

  @override
  String get tenantDetails => 'テナント詳細';

  @override
  String get entityType => 'エンティティタイプ';

  @override
  String get actionData => 'アクションデータ';

  @override
  String get failureDetails => '失敗詳細';

  @override
  String get allDevices => 'すべてのデバイス';

  @override
  String get active => 'アクティブ';

  @override
  String get inactive => '非アクティブ';

  @override
  String get activeDevices => 'アクティブ';

  @override
  String get inactiveDevices => '非アクティブ';

  @override
  String get alarmStatusActiveAcknowledged => 'アクティブ 確認済み';

  @override
  String get alarmStatusActiveUnacknowledged => 'アクティブ 未確認';

  @override
  String get alarmStatusClearedAcknowledged => 'クリア済み 確認済み';

  @override
  String get alarmStatusClearedUnacknowledged => 'クリア済み 未確認';

  @override
  String get alarmStatusFilterActive => 'アクティブ';

  @override
  String get systemAdministrator => 'システム管理者';

  @override
  String get tenantAdministrator => 'テナント管理者';

  @override
  String get customer => '顧客';

  @override
  String get changePassword => 'パスワードを変更';

  @override
  String get currentPasswordRequireText => '現在のパスワードは必須です。';

  @override
  String get currentPassword => '現在のパスワード';

  @override
  String get newPasswordRequireText => '新しいパスワードは必須です。';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get newPassword2RequireText => '新しいパスワード（再入力）は必須です。';

  @override
  String get newPassword2 => '新しいパスワードを再入力';

  @override
  String get passwordErrorNotification => '入力したパスワードは一致していなければなりません！';

  @override
  String get firstNameUpper => '名';

  @override
  String get lastNameUpper => '姓';

  @override
  String get profileSuccessNotification => 'プロフィールを更新しました。';

  @override
  String get passwordSuccessNotification => 'パスワードを変更しました。';

  @override
  String get notImplemented => '未実装です！';

  @override
  String get listIsEmptyText => 'リストは現在空です。';

  @override
  String get tryAgain => '再試行';

  @override
  String get verifyYourIdentity => '本人確認を行ってください';

  @override
  String get continueText => '続行';

  @override
  String get resendCode => 'コードを再送信';

  @override
  String resendCodeWait(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: '$time 秒後にコードを再送信',
      one: '1 秒後にコードを再送信',
    );
    return '$_temp0';
  }

  @override
  String get totpAuthDescription => '認証アプリからセキュリティコードを入力してください。';

  @override
  String smsAuthDescription(Object contact) {
    return 'セキュリティコードが $contact の電話番号に送信されました。';
  }

  @override
  String emailAuthDescription(Object contact) {
    return 'セキュリティコードが $contact のメールアドレスに送信されました。';
  }

  @override
  String get backupCodeAuthDescription => 'バックアップコードの1つを入力してください。';

  @override
  String get toptAuthPlaceholder => 'コード';

  @override
  String get smsAuthPlaceholder => 'SMSコード';

  @override
  String get emailAuthPlaceholder => 'メールコード';

  @override
  String get backupCodeAuthPlaceholder => 'バックアップコード';

  @override
  String get verificationCodeIncorrect => '認証コードが正しくありません';

  @override
  String get verificationCodeManyRequest => '認証コード確認のリクエストが多すぎます';

  @override
  String get tryAnotherWay => '別の方法を試す';

  @override
  String get selectWayToVerify => '確認方法を選択';

  @override
  String get mfaProviderTopt => '認証アプリ';

  @override
  String get mfaProviderSms => 'SMS';

  @override
  String get mfaProviderEmail => 'メール';

  @override
  String get mfaProviderBackupCode => 'バックアップコード';

  @override
  String get newUserText => '新規ユーザーですか？';

  @override
  String get createAccount => 'アカウントを作成';

  @override
  String get emailVerification => 'メール確認';

  @override
  String get emailVerificationSentText => '指定されたメールアドレスに確認情報を記載したメールを送信しました ';

  @override
  String get emailVerificationInstructionsText =>
      'サインアップ手続きを完了するため、メールに記載された手順に従ってください。注意: メールがしばらく届かない場合は、「迷惑メール」フォルダーをご確認いただくか、「再送信」ボタンをクリックしてメールを再送信してください。';

  @override
  String get resend => '再送信';

  @override
  String get activatingAccount => 'アカウントをアクティベート中...';

  @override
  String get accountActivated => 'アカウントが正常にアクティベートされました！';

  @override
  String get emailVerified => 'メールを確認しました';

  @override
  String get activatingAccountText => 'アカウントをアクティベートしています。\nしばらくお待ちください...';

  @override
  String accountActivatedText(Object appTitle) {
    return 'おめでとうございます！\n$appTitle アカウントがアクティベートされました。\n$appTitle スペースにログインできます。';
  }

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get cancel => 'キャンセル';

  @override
  String get accept => '同意する';

  @override
  String get termsOfUse => '利用規約';

  @override
  String get firstName => '名';

  @override
  String get firstNameRequireText => '名は必須です。';

  @override
  String get lastName => '姓';

  @override
  String get lastNameRequireText => '姓は必須です。';

  @override
  String get createPassword => 'パスワードを作成';

  @override
  String get repeatPassword => 'パスワードを再入力';

  @override
  String get imNotARobot => '私はロボットではありません';

  @override
  String get signUp => 'サインアップ';

  @override
  String get alreadyHaveAnAccount => 'すでにアカウントをお持ちですか？';

  @override
  String get signIn => 'サインイン';

  @override
  String get inactiveUserAlreadyExists => '非アクティブユーザーが既に存在します';

  @override
  String get inactiveUserAlreadyExistsMessage =>
      'メールアドレスが未確認の登録済みユーザーがすでに存在します。\n確認メールを再送信する場合は「再送信」ボタンをクリックしてください。';

  @override
  String get assignee => '担当者';

  @override
  String get alarmTypes => 'アラームタイプ';

  @override
  String get details => '詳細';

  @override
  String get status => 'ステータス';

  @override
  String get severity => '重大度';

  @override
  String get originator => '発生元';

  @override
  String get startTime => '開始時刻';

  @override
  String get duration => '継続時間';

  @override
  String durationDays(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 日',
    );
    return '$_temp0';
  }

  @override
  String durationHours(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 時間',
    );
    return '$_temp0';
  }

  @override
  String durationMinutes(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 分',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count, String value) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$value 秒',
    );
    return '$_temp0';
  }

  @override
  String get viewDashboard => 'ダッシュボードを表示';

  @override
  String get activity => 'アクティビティ';

  @override
  String get addCommentMessage => 'コメントを追加...';

  @override
  String get selectUser => 'ユーザーを選択';

  @override
  String get assignedToMe => '自分に割り当て済み';

  @override
  String get clear => 'クリア';

  @override
  String get acknowledge => '確認';

  @override
  String get edit => '編集';

  @override
  String get editProfile => 'プロフィールを編集';

  @override
  String get delete => '削除';

  @override
  String get edited => '編集済み';

  @override
  String get deleteComment => 'コメントを削除';

  @override
  String get areYouSure => 'よろしいですか？';

  @override
  String get noResultsFound => '結果が見つかりません';

  @override
  String get tryRefiningYourQuery => 'クエリを調整してください。';

  @override
  String get failedToLoadTheList => 'リストの読み込みに失敗しました';

  @override
  String get tryRefreshing => '更新してください。';

  @override
  String get refresh => '更新';

  @override
  String get users => 'ユーザー';

  @override
  String get unassigned => '未割り当て';

  @override
  String get failedToLoadAlarmDetails => 'アラームの詳細の読み込みに失敗しました';

  @override
  String get somethingWentWrong => '問題が発生しました';

  @override
  String get chooseRegion => 'リージョンを選択';

  @override
  String get selectRegion => 'リージョンを選択';

  @override
  String get northAmerica => '北米';

  @override
  String get europe => 'ヨーロッパ';

  @override
  String get northAmericaRegionShort => 'バージニア北部';

  @override
  String get europeRegionShort => 'フランクフルト';

  @override
  String get deviceList => 'デバイス一覧';

  @override
  String dashboards(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ダッシュボード',
      one: 'ダッシュボード',
    );
    return '$_temp0';
  }

  @override
  String get updateRequired => '更新が必要です';

  @override
  String updateTo(Object version) {
    return '$version に更新';
  }

  @override
  String get next => '次へ';

  @override
  String get confirmation => '確認';

  @override
  String get wifiPassword => 'Wi-Fiパスワード';

  @override
  String wifiHelpMessage(Object deviceName) {
    return 'デバイス$deviceNameのセットアップを続行するには、ネットワークの認証情報を入力してください。';
  }

  @override
  String wifiPasswordMessage(Object network) {
    return '$networkのパスワードを入力してください';
  }

  @override
  String get deviceNotFoundMessage =>
      'デバイスが見つかりません。スマートフォンのBluetoothがオンになっており、新しいデバイスの通信範囲内にあることを確認してください。';

  @override
  String permissionsNotEnoughMessage(Object permissions) {
    return '続行するには「$permissions」の権限が不足しています。必要な権限を付与し、「再試行」をタップしてください。';
  }

  @override
  String get sendingWifiCredentials => 'Wi-Fi認証情報を送信中';

  @override
  String get confirmingWifiConnection => 'Wi-Fi接続を確認中';

  @override
  String get provisionedSuccessfully => 'デバイスのプロビジョニングが完了しました';

  @override
  String get returnToDashboard => 'ダッシュボードに戻る';

  @override
  String cannotEstablishSession(Object deviceName) {
    return 'デバイス$deviceNameとのセッションを確立できません。もう一度お試しください';
  }

  @override
  String get claimingDevice => 'デバイスを登録中';

  @override
  String get claimingDeviceDone => 'デバイスの登録が完了しました';

  @override
  String get claimingMessageSuccess => 'デバイスは正常に\n登録されました';

  @override
  String openAppSettingsToGrantPermissionMessage(Object permissions) {
    return '続行するには「$permissions」の権限が不足しています。アプリケーション設定を開いて権限を付与し、「再試行」をタップしてください。';
  }

  @override
  String get scanACode => 'コードをスキャン';

  @override
  String get allowAccess => 'アクセスを許可';

  @override
  String get toggleCamera => 'カメラを切り替え';

  @override
  String get toggleFlash => 'フラッシュを切り替え';

  @override
  String get unableToUseCamera => 'カメラを使用できません';

  @override
  String get openSettingsAndGrantAccessToCameraToContinue =>
      '続行するには、設定を開いてカメラへのアクセスを許可してください';

  @override
  String get notFound => '見つかりません';

  @override
  String routeNotDefined(Object name) {
    return 'ルートが定義されていません: $name';
  }

  @override
  String get loginWith => '次の方法でログイン';

  @override
  String get scanQrCode => 'QRコードをスキャン';

  @override
  String get anEmptyRequestDataReceived => '空のリクエストデータを受信しました。';

  @override
  String get somethingWentWrongRollback => '問題が発生しました ... ロールバック';

  @override
  String get searchResults => '検索結果';

  @override
  String get viewAll => 'すべて表示';

  @override
  String get requestedEntityDoesNotExists => '要求されたエンティティは存在しません。';

  @override
  String get noAlarmsFound => 'アラームが見つかりません';

  @override
  String get filters => 'フィルター';

  @override
  String get alarmStatusList => 'アラームステータス一覧';

  @override
  String get alarmSeverityList => 'アラーム重大度一覧';

  @override
  String get cleared => 'クリア済み';

  @override
  String get acknowledged => '確認済み';

  @override
  String get unacknowledged => '未確認';

  @override
  String get critical => '致命的';

  @override
  String get major => '重大';

  @override
  String get minor => '軽微';

  @override
  String get warning => '警告';

  @override
  String get indeterminate => '未確定';

  @override
  String searchUsers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ユーザーを検索',
    );
    return '$_temp0';
  }

  @override
  String get reset => 'リセット';

  @override
  String get update => '更新';

  @override
  String get alarmTypeList => 'アラームタイプ一覧';

  @override
  String get anyType => '任意のタイプ';

  @override
  String get plusAlarmType => '+ アラームタイプ';

  @override
  String get all => 'すべて';

  @override
  String get allNotifications => 'すべて';

  @override
  String get unread => '未読';

  @override
  String get close => '閉じる';

  @override
  String get codeVerificationFailed => 'コードの検証に失敗しました！';

  @override
  String get fatalError => '致命的なエラー';

  @override
  String get unknownError => '不明なエラー。';

  @override
  String get sessionExpired => 'セッションの有効期限が切れました';

  @override
  String get fatalApplicationErrorOccurred => '致命的なアプリケーションエラーが発生しました:';

  @override
  String get connectionError => '接続エラー';

  @override
  String get failedToConnectToServer => 'サーバーへの接続に失敗しました';

  @override
  String get retry => '再試行';

  @override
  String get mobileDashboardShouldBeConfiguredInDeviceProfile =>
      'モバイルダッシュボードはデバイスプロファイルで設定する必要があります！';

  @override
  String get openWifiSettings => 'Wi-Fi設定を開く';

  @override
  String get connectToTheWifiYouUsuallyUse => '普段使用しているWi-Fiに接続してください';

  @override
  String get returnToTheAppAndTapReadyButton =>
      'アプリケーションに戻り、「準備完了」ボタンをタップしてください';

  @override
  String get pleaseFollowTheNextStepsToReconnectnyourPhoneToYour =>
      '次の手順に従って、\nスマートフォンを通常のWi-Fiに再接続してください';

  @override
  String
  get pushNotificationsAreNotConfiguredpleaseContactYourSystemAdministrator =>
      'プッシュ通知が設定されていません。\nシステム管理者にお問い合わせください。';

  @override
  String get firebaseIsNotConfiguredPleaseReferToTheOfficialFirebase =>
      'Firebaseが設定されていません。\n 設定方法については、Firebaseの公式ドキュメントを参照してください。';

  @override
  String get markAllAsRead => 'すべてを既読にする';

  @override
  String get profile => 'プロフィール';

  @override
  String cantLaunchUrlLink(String link) {
    return 'URLを起動できません: $link';
  }

  @override
  String get noDashboardsFound => 'ダッシュボードが見つかりません';

  @override
  String get openAppSettings => 'アプリケーション設定を開く';

  @override
  String get connectingToDevice => 'デバイスに接続中';

  @override
  String get connectToDevice => 'デバイスに接続';

  @override
  String get selectWifiNetwork => 'Wi-Fiネットワークを選択';

  @override
  String get deviceProvisioning => 'デバイスプロビジョニング';

  @override
  String get permissions => '権限';

  @override
  String get unableConnectToDevice => 'デバイスに接続できません';

  @override
  String get deviceNotAbleToFindWifiNearby => 'デバイスは近くのWi-Fiを見つけられません';

  @override
  String connectionToTheWifiNetworkFailednpleaseEnsureThatYour(Object name) {
    return '$name Wi-Fiネットワークへの接続に失敗しました。\nお使いのスマートフォンがデバイスのWi-Fiネットワークに接続されていること、およびスマートフォンの設定でこのアプリケーションに対してローカルネットワークアクセスが有効になっていることをご確認ください。';
  }

  @override
  String unableConnectToWifiBecauseNetworksWasntFoundByDevice(Object name) {
    return 'デバイス $name がネットワークを見つけられなかったため、Wi-Fiに接続できません';
  }

  @override
  String get pleaseFollowTheNextStepsToConnectYourPhoneTo =>
      'お使いのスマートフォンをデバイスに接続するには、次の手順に従ってください';

  @override
  String connectToWifiSimilarToWifiname(Object wifiName) {
    return '$wifiName に類似したWi-Fiに接続';
  }

  @override
  String get ready => '準備完了';

  @override
  String get exitDeviceProvisioning => 'デバイスプロビジョニングを終了';

  @override
  String get noNotificationsFound => '通知が見つかりません';

  @override
  String get markAsRead => '既読にする';

  @override
  String get url => 'URL';

  @override
  String get pleaseScanQrCodeOnYourDevice => 'お使いのデバイスでQRコードをスキャンしてください';

  @override
  String get search => '検索';

  @override
  String get tenant => 'テナント';

  @override
  String get tenantProfile => 'テナントプロファイル';

  @override
  String get user => 'ユーザー';

  @override
  String get asset => 'アセット';

  @override
  String get deviceProfile => 'デバイスプロファイル';

  @override
  String get assetProfile => 'アセットプロファイル';

  @override
  String alarms(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アラーム',
      one: 'アラーム',
    );
    return '$_temp0';
  }

  @override
  String get ruleChain => 'ルールチェーン';

  @override
  String get ruleNode => 'ルールノード';

  @override
  String get edge => 'Edge';

  @override
  String get entityView => 'エンティティビュー';

  @override
  String get widgetsBundle => 'ウィジェットバンドル';

  @override
  String get widgetType => 'ウィジェットの種類';

  @override
  String get apiUsageState => 'API使用状況';

  @override
  String get tbResource => 'リソース';

  @override
  String get otaPackage => 'OTAパッケージ';

  @override
  String get rpc => 'RPC';

  @override
  String get queue => 'キュー';

  @override
  String get notificationTarget => '通知受信者';

  @override
  String get notificationTemplate => '通知テンプレート';

  @override
  String get notificationRequest => '通知リクエスト';

  @override
  String notifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '通知',
      one: '通知',
    );
    return '$_temp0';
  }

  @override
  String get notificationRule => '通知ルール';

  @override
  String get entityGroup => 'エンティティグループ';

  @override
  String get converter => 'コンバーター';

  @override
  String get integration => '統合';

  @override
  String get schedulerEvent => 'スケジューラーイベント';

  @override
  String get blobEntity => 'Blobエンティティ';

  @override
  String get role => 'ロール';

  @override
  String get groupPermission => 'グループ権限';

  @override
  String get actionStatusSuccess => '成功';

  @override
  String get actionStatusFailure => '失敗';

  @override
  String get actionTypeAdded => '追加';

  @override
  String get actionTypeDeleted => '削除';

  @override
  String get actionTypeUpdated => '更新';

  @override
  String get actionTypeAttributesUpdated => '属性を更新';

  @override
  String get actionTypeAttributesDeleted => '属性を削除';

  @override
  String get actionTypeRpcCall => 'RPC呼び出し';

  @override
  String get actionTypeCredentialsUpdated => '認証情報を更新';

  @override
  String get actionTypeAssignedToCustomer => '顧客に割り当て';

  @override
  String get actionTypeUnassignedFromCustomer => '顧客から割り当て解除';

  @override
  String get actionTypeActivated => '有効化';

  @override
  String get actionTypeSuspended => '一時停止';

  @override
  String get actionTypeCredentialsRead => '認証情報を読み取り';

  @override
  String get actionTypeAttributesRead => '属性を読み取り';

  @override
  String get actionTypeRelationAddOrUpdate => 'リレーションを更新';

  @override
  String get actionTypeRelationDeleted => 'リレーションを削除';

  @override
  String get actionTypeRelationsDeleted => 'すべてのリレーションを削除';

  @override
  String get actionTypeAlarmAck => 'アラームを確認';

  @override
  String get actionTypeAlarmClear => 'アラームをクリア';

  @override
  String get actionTypeAlarmDelete => 'アラームを削除';

  @override
  String get actionTypeAlarmAssigned => 'アラームを割り当て';

  @override
  String get actionTypeAlarmUnassigned => 'アラームの割り当てを解除';

  @override
  String get actionTypeLogin => 'ログイン';

  @override
  String get actionTypeLogout => 'ログアウト';

  @override
  String get actionTypeLockout => 'ロックアウト';

  @override
  String get actionTypeAssignedFromTenant => 'テナントから割り当て';

  @override
  String get actionTypeAssignedToTenant => 'テナントに割り当て';

  @override
  String get actionTypeProvisionSuccess => 'デバイスをプロビジョニング';

  @override
  String get actionTypeProvisionFailure => 'デバイスのプロビジョニングに失敗';

  @override
  String get actionTypeTimeseriesUpdated => 'テレメトリを更新';

  @override
  String get actionTypeTimeseriesDeleted => 'テレメトリを削除';

  @override
  String get actionTypeAssignedToEdge => 'Edgeに割り当て';

  @override
  String get actionTypeUnassignedFromEdge => 'Edgeから割り当て解除';

  @override
  String get actionTypeAddedComment => 'コメントを追加';

  @override
  String get actionTypeUpdatedComment => 'コメントを更新';

  @override
  String get actionTypeDeletedComment => 'コメントを削除';

  @override
  String get actionTypeSmsSent => 'SMSを送信';

  @override
  String get actionTypeAddedToEntityGroup => 'エンティティグループに追加';

  @override
  String get actionTypeRemovedFromEntityGroup => 'エンティティグループから削除';

  @override
  String get actionTypeRestApiRuleEngineCall => 'REST APIルールエンジン呼び出し';

  @override
  String get actionTypeMadePublic => '公開に設定';

  @override
  String get actionTypeMadePrivate => '非公開に設定';

  @override
  String get actionTypeChangeOwner => '所有者を変更';

  @override
  String get youDontHavePermissionsToPerformThisOperation =>
      'この操作を実行する権限がありません！';

  @override
  String get itLooksLikeYourPermissionsArentSufficientToCompleteThis =>
      'この操作を完了するための権限が不足しているようです';

  @override
  String get isRequiredText => 'は必須です。';

  @override
  String get no2faProvidersFound => '2FAプロバイダーが見つかりません';

  @override
  String get pleaseContactYourSystemAdministrator => 'システム管理者にお問い合わせください';

  @override
  String errorOccured(Object e) {
    return 'エラーが発生しました: $e';
  }

  @override
  String get unsavedChanges => '未保存の変更';

  @override
  String get youHaveUnsavedChangesAreYouSureYouWantTo =>
      '未保存の変更があります。このページから移動してもよろしいですか？';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String accountDeletionDialogBody(Object authority) {
    return 'よろしいですか？ $authorityアカウントを削除しようとしています。';
  }

  @override
  String get language => '言語';

  @override
  String get metricUnitSystem => 'メートル法';

  @override
  String get imperialUnitSystem => 'ヤード・ポンド法';

  @override
  String get hybridUnitSystem => 'ハイブリッド';

  @override
  String get autoUnitSystem => '自動';

  @override
  String get languageAuto => '自動';

  @override
  String get unitSystem => '単位系';

  @override
  String get selectCountry => '国を選択';

  @override
  String get hideHomeDashboardToolbar => 'ホームダッシュボードのツールバーを非表示';

  @override
  String get phoneNumberHelperText => 'E.164形式の電話番号、例: +1201550123';

  @override
  String get homeDashboard => 'ホームダッシュボード';

  @override
  String get security => 'セキュリティ';

  @override
  String get twofactorAuthentication => '二要素認証';

  @override
  String get verificationRequired => '確認が必要';

  @override
  String get twofactorAuthenticationIsRequired => '二要素認証が必要です';

  @override
  String get setUpAVerificationMethodToContinueWithYourLogin =>
      'ログインを続行するには認証方法を設定してください';

  @override
  String get setUpAVerificationMethod => '認証方法を設定';

  @override
  String get totpSetupSuccessDescription => '次回ログイン時は、二要素認証コードの入力が必要です';

  @override
  String get smsSetupSuccessDescription =>
      '次回ログイン時に、電話番号に送信されるセキュリティコードの入力を求められます';

  @override
  String get emailSetupSuccessDescription =>
      '次回ログイン時に、メールアドレスに送信されるセキュリティコードの入力を求められます';

  @override
  String get backupCodeSetupSuccessDescription =>
      '次回ログイン時に、バックアップコードを使用して二要素認証を通過できます';

  @override
  String get loginToApp => 'アプリケーションにログイン';

  @override
  String get goBack => '戻る';

  @override
  String get done => '完了';

  @override
  String get thisWillMakeYourAccountLessSecure => 'これによりアカウントの安全性が低下します';

  @override
  String areYouSureYouWantToDeactivate(Object providerName) {
    return '$providerNameを無効化してもよろしいですか？';
  }

  @override
  String get yesDeactivate => 'はい、無効化します';

  @override
  String get enterAnEmailToUseAsYourAuthenticator => '認証に使用するメールアドレスを入力してください。';

  @override
  String get enterAPhoneNumberToUseAsYourAuthenticator =>
      '認証に使用する電話番号を入力してください';

  @override
  String get sendCode => 'コードを送信';

  @override
  String errorSendingCode(String error) {
    return 'コードの送信エラー: $error';
  }

  @override
  String get copy => 'コピー';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get enter6digitsKeyFromYourAppHere => 'ここに6桁のコードを入力';

  @override
  String digitsCode(int count) {
    return '$count桁のコード';
  }

  @override
  String get copy32digitsKeyToYourAuthenticationAppOrScanQrcode =>
      '32文字のキーを認証アプリにコピーするか、下のQRコードをスキャンしてください';

  @override
  String get applyChanges => '変更を適用';

  @override
  String get discardChanges => '変更を破棄';

  @override
  String get yesDiscard => 'はい、破棄します';

  @override
  String get thisActionCannotBeUndone => 'この操作は取り消せません。';

  @override
  String
  get twofactorAuthenticationProtectsYourAccountFromUnauthorizedAccessAllYou =>
      '二要素認証は、アカウントへの不正アクセスから保護します。ログイン時にセキュリティコードを入力するだけです。';

  @override
  String get calculatedField => '計算フィールド';

  @override
  String get apiKey => 'APIキー';

  @override
  String get aiModel => 'AIモデル';

  @override
  String get adminSettings => '管理者設定';

  @override
  String get job => 'ジョブ';

  @override
  String get mobileAppBundle => 'モバイルバンドル';

  @override
  String get mobileApp => 'モバイルアプリケーション';

  @override
  String get domain => 'ドメイン';

  @override
  String get oauth2Client => 'OAuth 2.0 クライアント';

  @override
  String get queueStats => 'キュー統計';

  @override
  String get phoneIsRequired => '電話番号は必須です。';

  @override
  String get phoneIsInvalid => '電話番号が無効です。';

  @override
  String get addVerificationMethod => '認証方法を追加';

  @override
  String get imageSavedToGallery => 'プラットフォームの「画像ギャラリー」に保存しました';

  @override
  String get failedToSaveImage => '画像の保存に失敗しました';

  @override
  String nSelected(int count) {
    return '$count 件選択中';
  }

  @override
  String get selectAll => '読み込み済みをすべて選択';

  @override
  String failedToPerformOperation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件の操作が失敗しました',
    );
    return '$_temp0';
  }

  @override
  String deleteSelectedNotifications(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件の通知を削除しますか？',
    );
    return '$_temp0';
  }

  @override
  String markSelectedNotificationsAsRead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件の通知を既読にしますか？',
    );
    return '$_temp0';
  }

  @override
  String gettingDataFromHost(Object host) {
    return 'ホスト $host からデータを取得しています。';
  }

  @override
  String loggingYouIntoHost(Object host) {
    return 'ホスト $host にサインインしています。';
  }

  @override
  String switchingToNewHost(Object host) {
    return '新しいホスト $host に切り替えています。';
  }

  @override
  String failedToObtainLoginTokenFromHost(Object host) {
    return '$host からログイントークンを取得できませんでした。新しいQRコードをスキャンしてください。';
  }

  @override
  String failedToConnectToHost(Object host) {
    return '$host への接続に失敗しました。';
  }

  @override
  String hostIsNotThingsBoard(Object host) {
    return '$host はThingsBoardサーバーではありません。';
  }

  @override
  String get qrCodeSessionIsNoLongerValid =>
      'QRコードのセッションは無効になりました。QRコードを更新して、もう一度スキャンしてください。';

  @override
  String get openThisLinkTitle => 'このリンクを開きますか？';

  @override
  String get linkOpensSignInPage =>
      'このリンクはこのサーバーのサインインページを開きます。現在のサーバーからはサインアウトされます。';

  @override
  String get linkOpensSignInPageOnly => 'このリンクはこのサーバーのサインインページを開きます。';

  @override
  String linkSignsInAs(Object email) {
    return 'このリンクは $email としてこのサーバーにサインインします。';
  }

  @override
  String get linkSignsIn => 'このリンクはこのサーバーにサインインします。';

  @override
  String get serverConnectionNotSecure => 'このサーバーは安全な接続を使用していません。';

  @override
  String get linkToOtherServerNotAllowed =>
      'このアプリケーションは自身のサーバーのみで動作し、このリンクを開くことはできません。';

  @override
  String get liveTrackingActive => 'ライブ位置追跡';

  @override
  String get liveTrackingPaused => 'ライブ追跡を一時停止しました';

  @override
  String get liveTrackingFixes => '測位数';

  @override
  String get liveTrackingSaved => '保存済み';

  @override
  String get liveTrackingErrors => 'エラー';

  @override
  String get liveTrackingStop => '停止';

  @override
  String get liveTrackingPause => '一時停止';

  @override
  String get liveTrackingResume => '再開';

  @override
  String get liveTrackingHide => '非表示';

  @override
  String get liveTrackingSessionTitle => 'ライブ位置追跡';

  @override
  String get liveTrackingTarget => '位置情報をエンティティに保存';

  @override
  String get liveTrackingDashboard => 'ダッシュボード';

  @override
  String get liveTrackingStatus => 'ステータス';

  @override
  String get liveTrackingStarted => '開始時刻';

  @override
  String get liveTrackingLastFix => '最終測位';

  @override
  String get liveTrackingLastError => '最終エラー';

  @override
  String get liveTrackingErrorTargetNotFound =>
      'このエンティティは存在しなくなったため、保存できません。追跡は継続します。ダッシュボードのアクションでターゲットを更新してください。';

  @override
  String get liveTrackingErrorNoConnection =>
      'サーバーに接続できません。これらの位置情報は保存されませんでした。オンラインに戻ると保存が再開されます。';

  @override
  String get liveTrackingErrorUnauthorized =>
      'セッションが終了しました。位置情報の保存を続けるには、再度サインインしてください。';

  @override
  String get liveTrackingErrorSavePermissionDenied =>
      'このエンティティには保存できません。権限がありません。追跡は継続します。管理者にアクセス権の付与を依頼してください。';

  @override
  String get liveTrackingErrorSaveFailed =>
      'この位置情報をサーバーに保存できませんでした。次の位置情報の取得時に再試行されます。';

  @override
  String get liveTrackingErrorServicesDisabled => 'このデバイスでは位置情報サービスが無効になっています。';

  @override
  String get liveTrackingErrorPermissionDenied => '位置情報の権限が拒否されました。';

  @override
  String get liveTrackingErrorPermissionDeniedForever =>
      '位置情報の権限が永久に拒否されています。アプリケーションの設定で有効にしてください。';

  @override
  String get liveTrackingErrorLocation => '位置情報を取得できませんでした。';

  @override
  String get liveTrackingMenuTitle => 'ライブ位置追跡';

  @override
  String get liveTrackingNoRecord => 'アクティブな追跡も最近のセッションもありません。';

  @override
  String get liveTrackingLastSession => '前回のセッション';

  @override
  String get liveTrackingStartAgain => 'もう一度開始';

  @override
  String get liveTrackingEnded => '終了日時';

  @override
  String get liveTrackingEndReason => '終了理由';

  @override
  String get liveTrackingEndReasonManual => '手動で停止';

  @override
  String get liveTrackingEndReasonMaxDuration => '最大継続時間に到達';

  @override
  String get liveTrackingEndReasonInterrupted => '中断';

  @override
  String get serverUpdateRequired => 'サーバーの更新が必要です';

  @override
  String get backToLogin => 'ログインに戻る';

  @override
  String serverRequiresVersion(String minVersion) {
    return 'このアプリケーションはThingsBoard $minVersion以降で動作します。';
  }

  @override
  String get serverLabel => 'サーバー';

  @override
  String get versionLabel => 'バージョン';

  @override
  String get askAdminToUpdateServer => 'サーバー管理者にサーバーの更新を依頼してください。';

  @override
  String get deviceClaimFailed => 'デバイスを登録できませんでした。もう一度お試しください。';

  @override
  String get deviceToClaimNotFound => 'デバイスが見つかりません。デバイス提供者にお問い合わせください。';

  @override
  String get enableAuthenticatorApp => '認証アプリを有効化';

  @override
  String get enableSmsAuthenticator => 'SMS認証を有効化';

  @override
  String get enableEmailAuthenticator => 'メール認証を有効化';

  @override
  String get getBackupCode => 'バックアップコードを取得';

  @override
  String get twoFaTotpDescription =>
      'Google Authenticator、Authy、またはDuoなどのアプリを使用して認証します。ログイン用のセキュリティコードを生成します。';

  @override
  String get twoFaSmsDescription =>
      '電話を使用して認証します。ログイン時にSMSメッセージでセキュリティコードを送信します。';

  @override
  String get twoFaEmailDescription => 'セキュリティコードをメールアドレスに送信して認証します。';

  @override
  String get twoFaBackupCodeDescription =>
      'これらの印刷可能な一回限りのパスコードを使用すると、旅行中などに電話が使えないときにサインインできます。';

  @override
  String get openInAuthenticatorApp => '認証アプリで開く';

  @override
  String get noAuthenticatorAppFound => '認証アプリが見つかりません。代わりにキーを認証アプリにコピーしてください。';

  @override
  String twoFaProviderEnabled(String provider) {
    return '$providerが有効です。';
  }

  @override
  String twoFaRequiredByAdmin(String email) {
    return '管理者により$emailの二要素認証が必須となっています。';
  }

  @override
  String get recommended => '推奨';

  @override
  String get addBackupCodesHint => 'バックアップコードも追加しておくと、スマートフォンを紛失してもサインインできます。';

  @override
  String get totpSecretKey => 'シークレットキー';

  @override
  String get backupCodesDescription =>
      'コードを印刷しておくと、アカウントへのログインに必要なときにすぐ使えます。各バックアップコードは1回のみ使用できます。';

  @override
  String get backupCodesWarning =>
      'このページを離れると、これらのコードは再表示できません。以下のオプションを使用して安全に保管してください。';

  @override
  String get downloadTxt => 'ダウンロード (txt)';
}
