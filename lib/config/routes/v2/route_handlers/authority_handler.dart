
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/config/routes/v2/route_handlers/route_handler.dart';
import 'package:thingsboard_app/core/auth/login/models/login_state.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/thingsboard_client.dart';

abstract class AuthorityHandler extends RouteHandler {
  Authority get authority;
  String get path;
  late final ProviderSubscription<LoginState> _subscription;

  @override
  void subscribe(BuildContext context, WidgetRef ref) {
    
    _subscription = ref.listenManual(loginProvider, (cur, next) {
      if (next.userScope == authority) {
        context.push(path);
      }
    });
  }

  @override
  void dispose() {
    _subscription.close();
  }
}
