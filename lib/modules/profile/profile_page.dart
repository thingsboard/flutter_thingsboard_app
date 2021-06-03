import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class ProfilePage extends TbPageWidget<ProfilePage, _ProfilePageState> {

  final bool _fullscreen;

  ProfilePage(TbContext tbContext, {bool fullscreen = false}) : _fullscreen = fullscreen, super(tbContext);

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
          actions: [
            if (widget._fullscreen) IconButton(
              icon: Icon(
                  Icons.logout
              ),
              onPressed: () {
                tbClient.logout();
              }
            )
          ],
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
              return Center(child: TbProgressIndicator(
                size: 50.0,
              ));
            }
          },
        )
    );
  }
}
