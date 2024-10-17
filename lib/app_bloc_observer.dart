import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/logger/tb_logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver(this.logger);

  final TbLogger logger;

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.debug('AppBlocObserver::onCreate($bloc)');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.debug('AppBlocObserver::onEvent($bloc, $event)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.error('AppBlocObserver::onError($bloc, $error, $stackTrace)');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.debug('AppBlocObserver::onClose($bloc)');
  }
}
