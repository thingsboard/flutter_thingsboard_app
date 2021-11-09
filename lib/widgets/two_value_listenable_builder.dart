import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TwoValueListenableBuilder<A, B> extends StatelessWidget {
  TwoValueListenableBuilder({
    Key? key,
    required this.firstValueListenable,
    required this.secondValueListenable,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueListenable<A> firstValueListenable;
  final ValueListenable<B> secondValueListenable;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: firstValueListenable,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: secondValueListenable,
          builder: (context, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
