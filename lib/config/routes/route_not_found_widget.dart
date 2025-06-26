import 'package:flutter/material.dart';

class RouteNotFoundWidget extends StatelessWidget {
  const RouteNotFoundWidget({
    super.key,
    required this.settings,
  });

  final RouteSettings? settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: Center(child: Text('Route not defined: ${settings!.name}')),
    );
  }
}
