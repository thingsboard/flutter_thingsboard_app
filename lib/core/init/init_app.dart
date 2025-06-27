import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class ThingsboardInitApp extends TbPageWidget {
  ThingsboardInitApp(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _ThingsboardInitAppState();
}

class _ThingsboardInitAppState extends TbPageState<ThingsboardInitApp> {
  @override
  void initState() {
    super.initState();
    initTbContext();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const TbProgressIndicator(size: 50.0),
    );
  }
}
