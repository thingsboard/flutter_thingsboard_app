import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/provider/login_provider.dart';
import 'package:thingsboard_app/core/auth/login/provider/oauth_provider.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';

class RefreshListenable extends ChangeNotifier {
  RefreshListenable(this._ref) {
    _ref.listen(loginProvider, (current, next) {
      notifyListeners();
    });
    _ref.listen(oauthProvider, (current, next) {
      notifyListeners();
    });
    _ref.listen(navigationProvider, (current, next) {
      notifyListeners();
    });
  }
  final Ref _ref;
}
