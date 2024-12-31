import 'package:equatable/equatable.dart';

sealed class VersionInfoState extends Equatable {
  const VersionInfoState({
    required this.storeLink,
    required this.latestVersion,
  });

  final String? storeLink;
  final String latestVersion;

  @override
  List<Object?> get props => [];
}

final class VersionLoadingState extends VersionInfoState {
  const VersionLoadingState() : super(storeLink: null, latestVersion: '');
}

final class VersionInfoCompareState extends VersionInfoState {
  const VersionInfoCompareState({
    required this.minVersion,
    required this.minVersionNotes,
    required super.latestVersion,
    required this.latestVersionNotes,
    required super.storeLink,
  });

  final String minVersion;
  final String minVersionNotes;
  final String latestVersionNotes;

  @override
  List<Object?> get props => [minVersion, minVersionNotes, latestVersionNotes];
}

final class VersionInfoSingleState extends VersionInfoState {
  const VersionInfoSingleState({
    required this.version,
    required this.notes,
    required super.storeLink,
    required super.latestVersion,
  });

  final String version;
  final String notes;

  @override
  List<Object?> get props => [version, notes, latestVersion];
}

final class VersionInfoEmptyState extends VersionInfoState {
  const VersionInfoEmptyState({
    required super.storeLink,
    required super.latestVersion,
  });
}
