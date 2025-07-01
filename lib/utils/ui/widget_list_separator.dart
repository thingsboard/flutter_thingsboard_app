import 'package:flutter/material.dart';

extension WidgetListSeparator on List<Widget> {
  List<Widget> separateWith(double size) {
    if (isEmpty || length == 1) return this;

    final List<Widget> separated = [];

    for (int i = 0; i < length; i++) {
      separated.add(this[i]);

      // Add separator between items (not after the last item)
      if (i < length - 1) {
        separated.add(SizedBox(width: size, height: size));
      }
    }

    return separated;
  }
}
