import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class RouteHandler {
  bool subscribed = false;

  void init(BuildContext context, WidgetRef ref) {
    if (subscribed) {
      return;
    }
    subscribed = true;
    subscribe(context, ref);
  }

  @protected
  void subscribe(BuildContext context, WidgetRef ref);

  void dispose();
}
