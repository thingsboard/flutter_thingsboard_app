import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/alarms_list.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/bloc.dart';
import 'package:thingsboard_app/widgets/tb_app_search_bar.dart';

class AlarmsSearchPage extends StatelessWidget {
  const AlarmsSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppSearchBar(
        onSearch:
            (searchText) => getIt<AlarmBloc>().add(
              AlarmSearchTextChanged(searchText: searchText),
            ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
          onPressed: () {
            getIt<AlarmBloc>().add(
              const AlarmSearchTextChanged(searchText: null),
            );
           context.pop();
          },
        ),
      ),
      body: const AlarmsList(),
    );
  }
}
