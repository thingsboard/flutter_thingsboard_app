import 'package:flutter/material.dart';

/// Checks the text provided and style, and then calls
/// the provided builder function with whether the text
/// will overflow the maxLines value
class DetectTextOverflowBuilder extends StatelessWidget {

  const DetectTextOverflowBuilder({
    super.key,
    required this.textWidget,
    required this.builder,
    this.maxLines = 1,
  });
  final Text textWidget;
  final Widget Function(BuildContext, bool) builder;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: textWidget.data,
          style: textWidget.style ?? defaultTextStyle,
        );

        // Use a textpainter to determine if it will exceed max lines
        final tp = TextPainter(
          maxLines: maxLines,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          text: span,
        );

        // trigger it to layout
        tp.layout(maxWidth: constraints.maxWidth);

        // whether the text overflowed or not
        final exceeded = tp.didExceedMaxLines;

        return builder(context, exceeded);
      },
    );
  }
}