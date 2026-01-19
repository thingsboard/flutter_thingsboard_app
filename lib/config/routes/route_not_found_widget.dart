import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

class RouteNotFoundWidget extends StatelessWidget {
  const RouteNotFoundWidget({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(title: Text(S.of(context).notFound), ),
      body: Center(
        child: Text(S.of(context).routeNotDefined(path)),
      ),
    );
  }
}
