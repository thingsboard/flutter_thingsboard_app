import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarms_states.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc(super.initialState);
}
