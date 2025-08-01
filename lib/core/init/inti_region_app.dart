import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:thingsboard_app/constants/app_constants.dart';
import 'package:thingsboard_app/core/auth/login/select_region/model/region.dart';
import 'package:thingsboard_app/core/auth/login/select_region/select_region_screen.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/endpoint/i_endpoint_service.dart';
import 'package:thingsboard_app/utils/services/local_database/i_local_database_service.dart';
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

         if ((snapshot.hasError || snapshot.data == null) &&
            !ThingsboardAppConstants.ignoreRegionSelection) {
                FlutterNativeSplash.remove();
          return SelectRegionScreen(tbContext);
        }
        if (ThingsboardAppConstants.ignoreRegionSelection) {
          getIt<IEndpointService>().setEndpoint(
            ThingsboardAppConstants.thingsBoardApiEndpoint,
          );
           getIt<IEndpointService>().setRegion(Region.custom);
        }
 final future = initTbContext();
        return FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              return Scaffold(
                body: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: !snapshot.hasData ? const SizedBox() :  const TbProgressIndicator(size: 50.0),
                ),
              );
            });
      },
    );
  }
}
