class PlatformVersionMatcher {
  static const int minPlatformVersionInt = 3900;

  static bool isSupportedPlatformVersion(
    PlatformVersion platformVersion, {
    required String type,
  }) {
    if (type != 'PE' && type != 'PAAS') {
      return false;
    }

    try {
      if (platformVersion.versionInt() < minPlatformVersionInt) {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}

class PlatformVersion {
  static RegExp versionRegExp = RegExp(r'([\d|.]+)([A-Z]*)(-SNAPSHOT)?');

  int major;
  int minor;
  int patch;
  int? minorPatch;
  String? versionCode;
  bool isSnapshot;

  PlatformVersion({
    required this.major,
    required this.minor,
    required this.patch,
    this.minorPatch,
    this.versionCode,
    this.isSnapshot = false,
  });

  factory PlatformVersion.fromString(String version) {
    final match = versionRegExp.firstMatch(version);
    if (match != null) {
      final versionStr = match.group(1);
      if (versionStr != null) {
        final versionParts = versionStr.split('.');
        if (versionParts.length >= 3) {
          final major = int.parse(versionParts[0]);
          final minor = int.parse(versionParts[1]);
          final patch = int.parse(versionParts[2]);
          int? minorPatch;
          if (versionParts.length > 3) {
            minorPatch = int.parse(versionParts[3]);
          }
          final versionCode = match.group(2);
          final isSnapshot = match.group(3) != null;
          return PlatformVersion(
            major: major,
            minor: minor,
            patch: patch,
            minorPatch: minorPatch,
            versionCode: versionCode?.isEmpty == true ? null : versionCode,
            isSnapshot: isSnapshot,
          );
        }
      }
    }
    throw ArgumentError('Invalid platform version string: $version');
  }

  int versionInt() {
    return major * 1000 +
        minor * 100 +
        patch * 10 +
        (minorPatch ?? 0);
  }

  String versionString() {
    var version = '$major.$minor.$patch';
    if (minorPatch != null) {
      version += '.$minorPatch';
    }
    if (versionCode != null && versionCode!.isNotEmpty) {
      version += versionCode!;
    }
    if (isSnapshot) {
      version += '-SNAPSHOT';
    }
    return version;
  }

  @override
  String toString() => versionString();
}
