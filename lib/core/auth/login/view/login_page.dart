import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thingsboard_app/core/auth/login/di/login_di.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_page_background.dart';
import 'package:thingsboard_app/core/auth/login/widgets/login_widget.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key, required this.riderectUrl});
  final String? riderectUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      LoginDi.init();
      return () => LoginDi.dispose();
    }, []);
    return const Scaffold(
      
      body: Stack(children: [LoginPageBackground(), LoginWidget()]),
    );
  }
}
