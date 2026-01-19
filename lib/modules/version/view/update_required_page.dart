import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/modules/version/bloc/bloc.dart';
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart';
import 'package:thingsboard_app/modules/version/view/widgets/version_compare_widget.dart';
import 'package:thingsboard_app/modules/version/view/widgets/version_empty_widget.dart';
import 'package:thingsboard_app/modules/version/view/widgets/version_single_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

class UpdateRequiredPage extends ConsumerWidget {
  const UpdateRequiredPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proivders = ref.read(oauthProvider);
    if (proivders is AsyncData<LoginMobileInfo>) {
      return PopScope(
        canPop: false,
     
        child: BlocProvider<VersionInfoBloc>(
          create:
              (_) =>
                  VersionInfoBloc()..add(
                    VersionInfoFetchEvent(
                      VersionRouteArguments(
                        storeInfo: proivders.value.storeInfo,
                        versionInfo: proivders.value.versionInfo!,
                      ),
                    ),
                  ),
          child: BlocBuilder<VersionInfoBloc, VersionInfoState>(
            builder: (context, state) {
              switch (state) {
                case VersionInfoCompareState():
                  return VersionCompareWidget(
                    minVersion: state.minVersion,
                    minVersionNotes: state.minVersionNotes,
                    latestVersion: state.latestVersion,
                    latestVersionNotes: state.latestVersionNotes,
                    storeLink: state.storeLink,
                  );
        
                case VersionInfoSingleState():
                  return VersionSingleWidget(
                    version: state.version,
                    notes: state.notes,
                    storeLink: state.storeLink,
                    latestVersion: state.latestVersion,
                  );
        
                case VersionInfoEmptyState():
                  return VersionEmptyWidget(
                    storeLink: state.storeLink,
                    latestVersion: state.latestVersion,
                  );
        
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
