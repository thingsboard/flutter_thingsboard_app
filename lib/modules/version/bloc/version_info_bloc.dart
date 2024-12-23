import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/modules/version/bloc/bloc.dart';

class VersionInfoBloc extends Bloc<VersionInfoEvent, VersionInfoState> {
  VersionInfoBloc() : super(const VersionLoadingState()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    VersionInfoEvent event,
    Emitter<VersionInfoState> emit,
  ) async {
    switch (event) {
      case VersionInfoFetchEvent():
        final minVersion = event.args.versionInfo.minVersion;
        final minVersionNotes = event.args.versionInfo.minVersionReleaseNotes;
        final latestVersion = event.args.versionInfo.latestVersion;
        final latestVersionNotes =
            event.args.versionInfo.latestVersionReleaseNotes;

        if (minVersionNotes.isNotEmpty && latestVersionNotes.isNotEmpty) {
          emit(
            VersionInfoCompareState(
              minVersion: minVersion?.toString() ?? 'min',
              minVersionNotes: minVersionNotes,
              latestVersion: latestVersion?.toString() ?? 'latest',
              latestVersionNotes: latestVersionNotes,
              storeLink: event.args.storeInfo?.storeLink,
            ),
          );
        } else if (minVersionNotes.isNotEmpty) {
          emit(
            VersionInfoSingleState(
              version: minVersion?.toString() ?? 'min',
              notes: minVersionNotes,
              storeLink: event.args.storeInfo?.storeLink,
              latestVersion: latestVersion?.toString() ?? 'latest',
            ),
          );
        } else if (latestVersionNotes.isNotEmpty) {
          emit(
            VersionInfoSingleState(
              version: latestVersion?.toString() ?? 'latest',
              notes: latestVersionNotes,
              storeLink: event.args.storeInfo?.storeLink,
              latestVersion: latestVersion?.toString() ?? 'latest',
            ),
          );
        } else {
          emit(
            VersionInfoEmptyState(
              storeLink: event.args.storeInfo?.storeLink,
              latestVersion: latestVersion?.toString() ?? 'latest',
            ),
          );
        }
    }
  }
}
