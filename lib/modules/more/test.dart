// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfileScreen(),
//     );
//   }
// }

// // class to draw the profile screen
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: const Color(0xffea5d49),
//           leading: Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//         ),
//         body: Stack(
//           alignment: Alignment.center,
//           children: [
//             CustomPaint(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//               ),
//               painter: HeaderCurvedContainer(),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     'Profile',
//                     style: TextStyle(
//                       fontSize: 35.0,
//                       letterSpacing: 1.5,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,

//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   height: MediaQuery.of(context).size.width / 2,
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                     // image: DecorationImage(
//                     //   image: AssetImage(null),
//                     //   fit: BoxFit.cover,
//                     // ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:thingsboard_app/constants/app_colors.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

// CustomPainter class to for the header curved-container
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.appBarColor;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MorePage extends TbContextWidget {
  MorePage(TbContext tbContext) : super(tbContext);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends TbContextState<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBarColor,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings, color: AppColors.backgroundColor),
              onPressed: () async {
                await navigateTo('/profile');
                setState(() {});
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 48, color: Color(0xFFAFAFAF)),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.settings, color: Color(0xFFAFAFAF)),
                    onPressed: () async {
                      await navigateTo('/profile');
                      setState(() {});
                    })
              ],
            ),
            SizedBox(height: 22),
            Text(_getUserDisplayName(),
                style: TextStyle(
                    color: Color(0xFF282828),
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 23 / 20)),
            SizedBox(height: 2),
            Text(_getAuthorityName(context),
                style: TextStyle(
                    color: Color(0xFFAFAFAF),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    height: 16 / 14)),
            SizedBox(height: 24),
            Divider(color: Color(0xFFEDEDED)),
            SizedBox(height: 8),
            buildMoreMenuItems(context),
            SizedBox(height: 8),
            Divider(color: Color(0xFFEDEDED)),
            SizedBox(height: 8),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                    height: 48,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Icon(Icons.logout, color: Color(0xFFE04B2F)),
                          SizedBox(width: 34),
                          Text('${S.of(context).logout}',
                              style: TextStyle(
                                  color: Color(0xFFE04B2F),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 20 / 14))
                        ]))),
                onTap: () {
                  tbClient.logout(
                      requestConfig: RequestConfig(ignoreErrors: true));
                }),
          ],
        ),
      ),
    );
  }

  Widget buildMoreMenuItems(BuildContext context) {
    List<Widget> items =
        MoreMenuItem.getItems(tbContext, context).map((menuItem) {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
              height: 48,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Icon(menuItem.icon, color: Color(0xFF282828)),
                    SizedBox(width: 34),
                    Text(menuItem.title,
                        style: TextStyle(
                            color: Color(0xFF282828),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 20 / 14))
                  ]))),
          onTap: () {
            navigateTo(menuItem.path);
          });
    }).toList();
    return Column(children: items);
  }

  String _getUserDisplayName() {
    var user = tbContext.userDetails;
    var name = '';
    if (user != null) {
      if ((user.firstName != null && user.firstName!.isNotEmpty) ||
          (user.lastName != null && user.lastName!.isNotEmpty)) {
        if (user.firstName != null) {
          name += user.firstName!;
        }
        if (user.lastName != null) {
          if (name.isNotEmpty) {
            name += ' ';
          }
          name += user.lastName!;
        }
      } else {
        name = user.email;
      }
    }
    return name;
  }

  String _getAuthorityName(BuildContext context) {
    var user = tbContext.userDetails;
    var name = '';
    if (user != null) {
      var authority = user.authority;
      switch (authority) {
        case Authority.SYS_ADMIN:
          name = '${S.of(context).systemAdministrator}';
          break;
        case Authority.TENANT_ADMIN:
          name = '${S.of(context).tenantAdministrator}';
          break;
        case Authority.CUSTOMER_USER:
          name = '${S.of(context).customer}';
          break;
        default:
          break;
      }
    }
    return name;
  }
}

class MoreMenuItem {
  final String title;
  final IconData icon;
  final String path;

  MoreMenuItem({required this.title, required this.icon, required this.path});

  static List<MoreMenuItem> getItems(
      TbContext tbContext, BuildContext context) {
    if (tbContext.isAuthenticated) {
      List<MoreMenuItem> items = [];
      switch (tbContext.tbClient.getAuthUser()!.authority) {
        case Authority.SYS_ADMIN:
          break;
        case Authority.TENANT_ADMIN:
          items.addAll([
            MoreMenuItem(
                title: '${S.of(context).customers}',
                icon: Icons.supervisor_account,
                path: '/customers'),
            MoreMenuItem(
                title: '${S.of(context).assets}',
                icon: Icons.domain,
                path: '/assets'),
            MoreMenuItem(
                title: '${S.of(context).auditLogs}',
                icon: Icons.track_changes,
                path: '/auditLogs')
          ]);
          break;
        case Authority.CUSTOMER_USER:
          items.addAll([
            MoreMenuItem(
                title: '${S.of(context).assets}',
                icon: Icons.domain,
                path: '/assets')
          ]);
          break;
        case Authority.REFRESH_TOKEN:
          break;
        case Authority.ANONYMOUS:
          break;
        case Authority.PRE_VERIFICATION_TOKEN:
          break;
      }
      return items;
    } else {
      return [];
    }
  }
}
