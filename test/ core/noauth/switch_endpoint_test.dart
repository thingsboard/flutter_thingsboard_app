import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thingsboard_app/core/auth/noauth/di/noauth_di.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/firebase/i_firebase_service.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

import '../../mocks.dart';

void main() {
  late final TbContext tbContext;
  late final ThingsboardClient tbClient;
  late final IFirebaseService firebaseService;

  setUpAll(() {
    tbContext = MockTbContext();
    tbClient = MockTbClient();
    firebaseService = MockFirebaseService();

    when(() => tbContext.tbClient).thenReturn(tbClient);
    when(() => firebaseService.removeApp()).thenAnswer((_) => Future.value());

    getIt.registerLazySingleton(() => TbLogger());
    getIt.registerLazySingleton<IFirebaseService>(() => firebaseService);

    NoAuthDi.init(tbContext: tbContext);
  });

  tearDownAll(() {
    getIt<NoAuthBloc>().close();
    NoAuthDi.dispose();
  });

  group('Switch Endpoint Group Test', () {
    group('SwitchToAnotherEndpointEvent', () {
      blocTest(
        'An empty request data',
        build: () {
          return NoAuthBloc(
            switchEndpointUseCase: getIt(),
          );
        },
        act: (bloc) => bloc.add(
          const SwitchToAnotherEndpointEvent(parameters: null),
        ),
        expect: () => [
          isA<NoAuthErrorState>().having(
            (e) => e.message,
            'error message',
            'An empty request data received.',
          )
        ],
      );

      blocTest(
        'JWT Token is invalid',
        setUp: () {
          when(
            () => tbClient.getLoginDataBySecretKey(
              host: any(named: 'host'),
              key: any(named: 'key'),
            ),
          ).thenThrow(
            ThingsboardError(message: 'JWT Token is invalid'),
          );
        },
        build: () {
          return NoAuthBloc(
            switchEndpointUseCase: getIt(),
          );
        },
        act: (bloc) => bloc.add(
          const SwitchToAnotherEndpointEvent(
            parameters: {
              'host': 'host',
              'secret': 'key',
              'uri': 'uri',
            },
          ),
        ),
        expect: () => [
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Getting data from your host host',
          ),
          isA<NoAuthErrorState>().having(
            (e) => e.message,
            'error message',
            'JWT Token is invalid',
          ),
        ],
      );

      blocTest(
        'An error on TbClient re-init',
        setUp: () {
          when(
            () => tbClient.getLoginDataBySecretKey(
              host: any(named: 'host'),
              key: any(named: 'key'),
            ),
          ).thenAnswer(
            (_) => Future.value(LoginResponse('token', 'refreshToken')),
          );

          when(
            () => tbContext.logout(
              requestConfig: any(named: 'requestConfig'),
              notifyUser: any(named: 'notifyUser'),
            ),
          ).thenAnswer((_) => Future.value());

          when(
            () => tbClient.setUserFromJwtToken(any(), any(), any()),
          ).thenAnswer((_) => Future.value());

          when(
            () => tbContext.reInit(
              endpoint: any(named: 'endpoint'),
              onDone: any(named: 'onDone'),
              onError: any(named: 'onError'),
            ),
          ).thenAnswer(
            (invocation) {
              final onError = invocation.namedArguments[Symbol('onError')];
              onError(
                ThingsboardError(message: 'TBClient re-init error message'),
              );

              return Future.value();
            },
          );
        },
        build: () {
          return NoAuthBloc(
            switchEndpointUseCase: getIt(),
          );
        },
        act: (bloc) => bloc.add(
          const SwitchToAnotherEndpointEvent(
            parameters: {
              'host': 'https://host.com',
              'secret': 'key',
              'uri': 'uri',
            },
          ),
        ),
        expect: () => [
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Getting data from your host https://host.com',
          ),
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Logout you ...',
          ),
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Switching you to the new host https://host.com',
          ),
          isA<NoAuthErrorState>().having(
            (e) => e.message,
            'error message',
            'TBClient re-init error message',
          ),
        ],
      );

      blocTest(
        'Switch endpoint success',
        setUp: () {
          when(
            () => tbClient.getLoginDataBySecretKey(
              host: any(named: 'host'),
              key: any(named: 'key'),
            ),
          ).thenAnswer(
            (_) => Future.value(LoginResponse('token', 'refreshToken')),
          );

          when(
            () => tbContext.logout(
              requestConfig: any(named: 'requestConfig'),
              notifyUser: any(named: 'notifyUser'),
            ),
          ).thenAnswer((_) => Future.value());

          when(
            () => tbClient.setUserFromJwtToken(any(), any(), any()),
          ).thenAnswer((_) => Future.value());

          when(
            () => tbContext.reInit(
              endpoint: any(named: 'endpoint'),
              onDone: any(named: 'onDone'),
              onError: any(named: 'onError'),
            ),
          ).thenAnswer(
            (invocation) {
              final onDone = invocation.namedArguments[Symbol('onDone')];
              onDone();

              return Future.value();
            },
          );
        },
        build: () {
          return NoAuthBloc(
            switchEndpointUseCase: getIt(),
          );
        },
        act: (bloc) => bloc.add(
          const SwitchToAnotherEndpointEvent(
            parameters: {
              'host': 'https://host.com',
              'secret': 'key',
              'uri': 'uri',
            },
          ),
        ),
        expect: () => [
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Getting data from your host https://host.com',
          ),
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Logout you ...',
          ),
          isA<NoAuthWipState>().having(
            (e) => e.currentStateMessage,
            'progress message',
            'Switching you to the new host https://host.com',
          ),
          isA<NoAuthDoneState>(),
        ],
      );
    });
  });
}
