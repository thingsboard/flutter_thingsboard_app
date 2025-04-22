part of 'entities.dart';

@freezed
class TbPlatform with _$TbPlatform {
  const factory TbPlatform({
    required bool isIos,
    required bool isAndroid,
  }) = _TbPlatform;

  @override
  String toString() => isIos
      ? 'IOS'
      : isAndroid
          ? 'ANDROID'
          : throw UnsupportedError('This platform isn\'t support');
}
