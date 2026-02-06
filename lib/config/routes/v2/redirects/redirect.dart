import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Redirect {
  Future<String?> redirect(BuildContext context, GoRouterState state, Ref ref);
}
