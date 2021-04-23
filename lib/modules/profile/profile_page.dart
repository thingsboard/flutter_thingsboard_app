import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class ProfilePage extends TbPageWidget<ProfilePage, _ProfilePageState> {

  ProfilePage(TbContext tbContext) : super(tbContext);

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends TbPageState<ProfilePage, _ProfilePageState> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TbAppBar(
          tbContext,
          title: const Text('Profile'),
          showProfile: false,
          showLogout: true,
        ),
        body: Builder(
            builder: (BuildContext context) {
              return Center(child: const Text('TODO: Implement!'));
            }),
    );
  }
}
