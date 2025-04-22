import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/features/authentication/presentation/select_region_screen.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/services/local_database/i_local_database_service.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ThingsboardInitRegionApp extends TbPageWidget {
  ThingsboardInitRegionApp(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _ThingsboardInitAppState();
}

class _ThingsboardInitAppState extends TbPageState<ThingsboardInitRegionApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt<ILocalDatabaseService>().getSelectedRegion(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: const TbProgressIndicator(size: 50.0),
            ),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const SelectRegionScreen();
        }

        initTbContext();

        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: const TbProgressIndicator(size: 50.0),
          ),
        );
      },
    );
  }
}
