import 'package:flutter/foundation.dart' show compute;
import 'package:flutter/material.dart' show Size, Orientation;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thingsboard_app/constants/enviroment_variables.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/communication/i_communication_service.dart';
import 'package:thingsboard_app/services/dashboard/i_dashboard_service.dart';
import 'package:thingsboard_app/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/services/legacy/i_legacy_service.dart';
import 'package:thingsboard_app/services/logger/i_logger_service.dart';
import 'package:thingsboard_app/services/mobile/i_mobile_service.dart';
import 'package:thingsboard_app/services/system/i_system_service.dart';
import 'package:thingsboard_app/services/tb_client/i_tb_client_service.dart';
import 'package:thingsboard_app/services/toast_notification/i_toast_notification_service.dart';
import 'package:thingsboard_app/services/user/i_user_service.dart';
import 'package:thingsboard_app/thingsboard_client.dart'
    show ThingsboardClient, ThingsboardError, VersionInfo, StoreInfo;

part 'core_bloc.freezed.dart';
part 'core_events.dart';
part 'core_states.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  CoreBloc({
    required this.endpointService,
    required this.loggerService,
    required this.toastNotificationService,
    required this.communicationService,
    required this.systemService,
  }) : super(const CoreStateLoading()) {
    on<CoreEventInit>(_init);
    on<CoreEventInitWithRegions>(_initWithRegions);
    on<CoreEventUserLoaded>(_onUserLoaded);
    on<CoreEventLogout>(_logout);
  }

  factory CoreBloc.create() => CoreBloc(
        endpointService: getIt(),
        loggerService: getIt(),
        toastNotificationService: getIt(),
        communicationService: getIt(),
        systemService: getIt(),
      );

  final IEndpointService endpointService;
  final ILoggerService loggerService;
  final IToastNotificationService toastNotificationService;
  final ICommunicationService communicationService;
  final ISystemService systemService;

  ITbClientService get tbClientService => getIt<ITbClientService>();

  IMobileService get mobileService => getIt<IMobileService>();

  IUserService get userService => getIt<IUserService>();

  Future<void> _init(CoreEventInit event, Emitter<CoreState> emit) async {
    getIt.registerServices();

    final tbClient = ThingsboardClient(
      await endpointService.getEndpoint(),
      storage: getIt(),
      onUserLoaded: () => add(const CoreEventUserLoaded()),
      onError: (tbError) {
        loggerService.error('ThingsboardClient::onError() ->', tbError.message);
        if (tbError.message != null) {
          toastNotificationService.showErrorNotification(tbError.message!);
        }
      },
      computeFunc: <Q, R>(callback, message) => compute(callback, message),
      debugMode: EnvironmentVariables.apiCalls || EnvironmentVariables.verbose,
    );

    if (getIt.hasScope(tbClientScopeName)) {
      await getIt.dropScope(tbClientScopeName);
    }
    getIt.registerThingsBoardClient(tbClient);
    mobileService.setDeviceScreenSize(
      event.screenSize,
      orientation: event.orientation,
    );

    try {
      await tbClient.init();
      // TODO Delete the whole service once the new architecture will be fully adopted
      await getIt<ILegacyService>().initTbContext();
    } catch (e) {
      loggerService.error('CoreAuthenticationBloc::TbClient init error -> $e');
      emit(
        CoreStatesFatalError(
          e is ThingsboardError ? e.message ?? 'Unknown error.' : e.toString(),
        ),
      );
    }
  }

  Future<void> _initWithRegions(
    CoreEventInitWithRegions event,
    Emitter<CoreState> emit,
  ) async {}

  Future<void> _onUserLoaded(
    CoreEventUserLoaded event,
    Emitter<CoreState> emit,
  ) async {
    final isFullyAuthenticated = tbClientService.isUserFullyAuthenticated();
    if (isFullyAuthenticated) {
      try {
        final mobileInfo =
            await tbClientService.mobileService.getUserMobileInfo();

        userService.setUser(
          mobileInfo!.user!,
          authUser: tbClientService.getAuthUser()!,
        );
        getIt<IDashboardService>()
            .setHomeDashboard(mobileInfo.homeDashboardInfo);
        systemService
          ..setStoreInfo(mobileInfo.storeInfo)
          ..setVersionInfo(mobileInfo.versionInfo);
        // Means if the minimal client version configured on the TB Mobile
        // Center level is higher than the current mobile app version
        final clientIsSuitable = systemService.isClientVersionSuitable();
        if (!clientIsSuitable) {
          emit(
            CoreStateRequireClientUpdate(
              versionInfo: mobileInfo.versionInfo!,
              storeInfo: mobileInfo.storeInfo,
            ),
          );
        }

        mobileService.cachePageLayouts(
          mobileInfo.pages,
          authority: userService.getAuthority()!,
        );
      } catch (e) {
        loggerService.error(
          'CoreAuthenticationBloc::getUserMobileInfo error -> $e',
        );

        emit(CoreStatesFatalError(e is ThingsboardError ? e.message : null));
        return;
      }
    }

    emit(
      CoreStateUserLoaded(
        isFullyAuthenticated: isFullyAuthenticated,
        defaultDashboardId: userService.getDefaultDashboardId(),
        fullscreenDashboard: userService.fullScreenDefaultDashboard(),
      ),
    );
  }

  Future<void> _logout(CoreEventLogout event, Emitter<CoreState> emit) async {
    communicationService.fire(const GlobalLogoutEvent());
    getIt.dropScope(tbServicesScopeName);
  }

  @override
  Future<void> close() {
    getIt.dropScope(tbClientScopeName);
    return super.close();
  }
}
