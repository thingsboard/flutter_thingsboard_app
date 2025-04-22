import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/routes/router.dart';
import 'package:thingsboard_app/features/alarm/alarms_list.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarms_bloc.dart';
import 'package:thingsboard_app/features/alarm/presentation/bloc/alarms_events.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/ui/back_button_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class AlarmsSearchPage extends StatelessWidget {
  const AlarmsSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppSearchBar(
        onSearch: (searchText) => getIt<AlarmBloc>().add(
          AlarmSearchTextChanged(
            searchText: searchText,
          ),
        ),
        leading: BackButtonWidget(
          onPressed: () {
            getIt<AlarmBloc>().add(
              const AlarmSearchTextChanged(
                searchText: null,
              ),
            );

            getIt<ThingsboardAppRouter>().router.pop(context);
          },
        ),
      ),
      body: const AlarmsList(),
    );
  }
}
