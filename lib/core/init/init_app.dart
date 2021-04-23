import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class ThingsboardInitApp extends TbPageWidget<ThingsboardInitApp, _ThingsboardInitAppState> {

  ThingsboardInitApp(TbContext tbContext, {Key? key}) : super(tbContext, key: key);

  @override
  _ThingsboardInitAppState createState() => _ThingsboardInitAppState();

}

class _ThingsboardInitAppState extends TbPageState<ThingsboardInitApp, _ThingsboardInitAppState> {

  @override
  void initState() {
    super.initState();
    tbContext.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ThingsBoard Init'),
        ),
        body: Center(
          child: CircularProgressIndicator()
        )
     );
  }
}
