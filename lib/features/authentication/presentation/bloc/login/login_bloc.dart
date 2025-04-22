import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/features/authentication/entities/entities.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/oauth2/i_ouath2_service.dart';
import 'package:thingsboard_app/services/oauth2/ouath2_service.dart';
import 'package:thingsboard_app/services/system/i_system_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/services/toast_notification/i_toast_notification_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show StoreInfo, VersionInfo;

part 'login_bloc.freezed.dart';
part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.tbClientService,
    required this.systemService,
    required this.loggerService,
    required this.oauth2service,
    required this.toastNotificationService,
  }) : super(const LoginLoadingState()) {
    on<LoginFetchEvent>(_fetch);
    on<Login>(_login);
    on<LoginWithOauth2Event>(_loginWithOauth2);
  }

  factory LoginBloc.create() {
    if (!getIt.isRegistered<IOauth2Service>()) {
      getIt.registerFactory<IOauth2Service>(() => Oath2Service());
    }

    return LoginBloc(
      tbClientService: getIt(),
      systemService: getIt(),
      loggerService: getIt(),
      oauth2service: getIt(),
      toastNotificationService: getIt(),
    );
  }

  final ITbClientService tbClientService;
  final ISystemService systemService;
  final ILoggerService loggerService;
  final IOauth2Service oauth2service;
  final IToastNotificationService toastNotificationService;

  Future<void> _fetch(LoginFetchEvent event, Emitter<LoginState> emit) async {
    try {
      final loginInfo =
          await tbClientService.mobileService.getLoginMobileInfo();

      if (loginInfo != null) {
        systemService
          ..setStoreInfo(loginInfo.storeInfo)
          ..setVersionInfo(loginInfo.versionInfo);
        // Means if the minimal client version configured on the TB Mobile
        // Center level is higher than the current mobile app version
        final clientIsSuitable = systemService.isClientVersionSuitable();
        if (!clientIsSuitable) {
          emit(
            LoginStateRequireClientUpdate(
              versionInfo: loginInfo.versionInfo!,
              storeInfo: loginInfo.storeInfo,
            ),
          );

          return;
        }
      }

      final mfaRequired = tbClientService.isPreVerificationToken();
      if (mfaRequired) {
        emit(const LoginStateMfa());
      } else {
        emit(
          LoginDataState(
            oAuthClients: loginInfo?.oAuth2Clients
                    .map((e) => Oauth2Entity.fromModel(e))
                    .toList() ??
                [],
          ),
        );
      }
    } catch (e) {
      loggerService.error('LoginBloc::LoginFetchEvent error -> $e');
      emit(const LoginDataState(oAuthClients: []));
    }
  }

  Future<void> _login(Login event, Emitter<LoginState> emit) async {
    try {
      await tbClientService.login(
        userName: event.username,
        password: event.password,
      );
    } catch (e) {
      loggerService.error('Login error -> $e');
    }
  }

  Future<void> _loginWithOauth2(
    LoginWithOauth2Event event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final result = await oauth2service.authenticate(
        event.oauth2.url,
        platformType: systemService.getPlatform(),
        packageName: await systemService.getPackageName(),
      );
      if (result.success) {
        await tbClientService.setUserFromJwtToken(
          result.accessToken,
          result.refreshToken,
          true,
        );
      } else {
        toastNotificationService.showErrorNotification(result.error!);
      }
    } catch (e) {
      loggerService.error('Oauth2Auth error -> $e');
    }
  }
}
