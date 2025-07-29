import 'package:thingsboard_app/core/auth/noauth/data/datasource/remote/i_noauth_remote_datasource.dart';
import 'package:thingsboard_app/core/auth/noauth/data/datasource/remote/noauth_remote_datasource.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/noauth_repository.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/repository/i_noauth_repository.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/usecases/switch_endpoint_usecase.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';

abstract final class NoAuthDi {
  static void init({required TbContext tbContext}) {
     if (getIt.hasScope("NoAuthDi")) {
      return;
    }
    getIt.pushNewScope(
      scopeName: 'NoAuthDi',
      init: (locator) {
        // Datasource
        locator.registerFactory<INoAuthRemoteDatasource>(
          () => NoAuthRemoteDatasource(
            thingsboardClient: tbContext.tbClient,
            tbLogger: locator(),
            tbContext: tbContext,
          ),
        );

        // Repository
        locator.registerFactory<INoAuthRepository>(
          () => NoAuthRepository(
            remoteDatasource: locator(),
          ),
        );

        // UseCases
        locator.registerFactory(
          () => SwitchEndpointUseCase(
            repository: locator(),
            logger: locator(),
          ),
        );

        // Bloc
        locator.registerLazySingleton(
          () => NoAuthBloc(
            switchEndpointUseCase: locator(),
          ),
        );
      },
    );
  }

  static void dispose() {
  if(getIt.hasScope('NoAuthDi')) {
      getIt.dropScope('NoAuthDi');
    }
  }
}
