import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/version/bloc/bloc.dart';
import 'package:thingsboard_app/modules/version/route/version_route_arguments.dart';
import 'package:thingsboard_app/modules/version/view/widgets/version_compare_widget.dart';
import 'package:thingsboard_app/modules/version/view/widgets/version_empty_widget.dart';
import 'package:thingsboard_app/modules/version/view/widgets/version_single_widget.dart';

class UpdateRequiredPage extends TbContextWidget {
  UpdateRequiredPage(
    super.tbContext, {
    required this.arguments,
    super.key,
  });

  final VersionRouteArguments arguments;

  @override
  State<StatefulWidget> createState() => _UpdateRequiredPageState();
}

class _UpdateRequiredPageState extends TbContextState<UpdateRequiredPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VersionInfoBloc>(
      create: (_) =>
          VersionInfoBloc()..add(VersionInfoFetchEvent(widget.arguments)),
      child: BlocBuilder<VersionInfoBloc, VersionInfoState>(
        builder: (context, state) {
          switch (state) {
            case VersionInfoCompareState():
              return VersionCompareWidget(
                tbContext,
                minVersion: state.minVersion,
                minVersionNotes: state.minVersionNotes,
                latestVersion: state.latestVersion,
                latestVersionNotes: state.latestVersionNotes,
                storeLink: state.storeLink,
              );

            case VersionInfoSingleState():
              return VersionSingleWidget(
                tbContext,
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
    );
  }
}
