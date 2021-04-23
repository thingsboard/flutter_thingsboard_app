import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class HomePage extends TbPageWidget<HomePage, _HomePageState> {

  HomePage(TbContext tbContext) : super(tbContext);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends TbPageState<HomePage, _HomePageState> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: const Text('ThingsBoard'),
      ),
      body: Builder(
          builder: (BuildContext context) {
            return Center(child:
                Column(
                  children: [
                    ElevatedButton(
                      child: Text('Devices'),
                      onPressed: () {
                        navigateTo('/devices');
                      },
                    )
                  ],
                )
            );
          }),
    );
  }
}
