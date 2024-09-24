import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

abstract class UiUtils {
  static Future<T?> showModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color barrierColor = Colors.black54,
    Widget? topControl,
  }) async {
    return showBarModalBottomSheet(
      context: context,
      builder: builder,
      barrierColor: barrierColor,
      topControl: topControl,
    );
  }
}
