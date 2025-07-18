import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class RouteNotFoundWidget extends StatelessWidget {
  const RouteNotFoundWidget({
    super.key,
    required this.settings,
  });

  final RouteSettings? settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(S.of(context).notFound)),
      body: Center(child: Text(S.of(context).routeNotDefined(settings?.name ?? ''))),
    );
  }
}
