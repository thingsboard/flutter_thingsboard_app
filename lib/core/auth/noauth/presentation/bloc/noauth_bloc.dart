import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/auth/noauth/domain/usecases/switch_endpoint_usecase.dart';
import 'package:thingsboard_app/core/auth/noauth/presentation/bloc/bloc.dart';

class NoAuthBloc extends Bloc<NoAuthEvent, NoAuthState> {
  NoAuthBloc({required this.switchEndpointUseCase})
      : super(const NoAuthLoadingState()) {
    switchEndpointProgressSubscription = switchEndpointUseCase.stream.listen(
      (event) => add(SwitchEndpointProgressUpdateEvent(progressMessage: event)),
    );

    _switchEndpointEventHandler();
    _switchEndpointUpdatesHandler();
    _switchEndpointDoneEvent();
  }

  final SwitchEndpointUseCase switchEndpointUseCase;
  late final StreamSubscription switchEndpointProgressSubscription;

  void _switchEndpointEventHandler() {
    on<SwitchToAnotherEndpointEvent>(
      (event, emit) async {
        if (event.parameters == null) {
          emit(const NoAuthErrorState(message: 'add message'));
          return;
        }

        switchEndpointUseCase(
          SwitchEndpointParams(
            data: event.parameters!,
            onDone: () {
              print('SwitchEndpointParams:onDone()');
              add(const SwitchEndpointDoneEvent());
            },
          ),
        );
      },
    );
  }

  void _switchEndpointUpdatesHandler() {
    on<SwitchEndpointProgressUpdateEvent>(
      (event, emit) async {
        emit(NoAuthWipState(currentStateMessage: event.progressMessage));
      },
    );
  }

  void _switchEndpointDoneEvent() {
    on<SwitchEndpointDoneEvent>(
      (event, emit) async {
        emit(const NoAuthDoneState());
      },
    );
  }

  @override
  Future<void> close() {
    switchEndpointProgressSubscription.cancel();
    switchEndpointUseCase.dispose();
    return super.close();
  }
}
