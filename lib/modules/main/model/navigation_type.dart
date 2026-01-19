import 'package:collection/collection.dart';

enum TbNavigationType {
  push,
  mixed;

  static TbNavigationType fromString(String? input) {
    return TbNavigationType.values.firstWhereOrNull((e) => e.name == input) ??
        TbNavigationType.push;
  }
}
