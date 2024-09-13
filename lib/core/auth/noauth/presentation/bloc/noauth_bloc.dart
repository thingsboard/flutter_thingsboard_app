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
    _switchEndpointErrorEvent();
  }

  final SwitchEndpointUseCase switchEndpointUseCase;
  late final StreamSubscription switchEndpointProgressSubscription;

  void _switchEndpointEventHandler() {
    on<SwitchToAnotherEndpointEvent>(
      (event, emit) async {
        if (isClosed) {
          return;
        }

        if (event.parameters == null) {
          emit(
            const NoAuthErrorState(
              message: 'An empty request data received.',
            ),
          );
          return;
        }

        switchEndpointUseCase(
          SwitchEndpointParams(
            data: event.parameters!,
            onDone: () {
              add(const SwitchEndpointDoneEvent());
            },
            onError: (message) {
              if (!isClosed) {
                add(SwitchEndpointErrorEvent(message: message));
              }
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

  void _switchEndpointErrorEvent() {
    on<SwitchEndpointErrorEvent>(
      (event, emit) async {
        emit(NoAuthErrorState(message: event.message));
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
