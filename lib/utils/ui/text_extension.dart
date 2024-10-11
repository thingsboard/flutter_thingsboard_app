import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

extension BoldSubString on Text {
  Text boldSubString(
    String target, {
    Color? highlightedColor,
    Color? regularColor,
    TextStyle? highlightedTextStyle,
    TextStyle? regularTextStyle,
  }) {
    final textSpans = <TextSpan>[];
    final escapedTarget = RegExp.escape(target);
    final pattern = RegExp(escapedTarget, caseSensitive: false);
    final matches = pattern.allMatches(data!);

    int currentIndex = 0;
    for (final match in matches) {
      final beforeMatch = data!.substring(currentIndex, match.start);
      if (beforeMatch.isNotEmpty) {
        textSpans.add(
          TextSpan(
            text: beforeMatch,
            style: regularTextStyle ??
                TbTextStyles.bodyLarge.copyWith(color: regularColor),
          ),
        );
      }

      final matchedText = data!.substring(match.start, match.end);
      textSpans.add(
        TextSpan(
          text: matchedText,
          style: highlightedTextStyle ??
              TbTextStyles.labelLarge.copyWith(color: highlightedColor),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < data!.length) {
      final remainingText = data!.substring(currentIndex);
      textSpans.add(
        TextSpan(
          text: remainingText,
          style: regularTextStyle ??
              TbTextStyles.bodyLarge.copyWith(color: regularColor),
        ),
      );
    }

    return Text.rich(TextSpan(children: textSpans));
  }
}
