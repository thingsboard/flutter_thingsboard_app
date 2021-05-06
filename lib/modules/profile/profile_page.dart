import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class ProfilePage extends TbPageWidget<ProfilePage, _ProfilePageState> {

  ProfilePage(TbContext tbContext) : super(tbContext);

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends TbPageState<ProfilePage, _ProfilePageState> {

  late Future<User> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = tbClient.getUserService().getUser(tbClient.getAuthUser()!.userId!);
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
        body: FutureBuilder<User>(
          future: userFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var user = snapshot.data!;
              return ListTile(
                title: Text('${user.email}'),
                subtitle: Text('${user.firstName} ${user.lastName}'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );
  }
}
