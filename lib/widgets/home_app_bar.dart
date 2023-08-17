import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight = 90;
  final String goodKeyword;
  final String name;

  const HomeAppBar({
    Key? key,
    required this.goodKeyword,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: toolbarHeight,
      flexibleSpace: Container(
        decoration: _boxDecoration(),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Good $goodKeyword',
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(1.6), // Border width
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30), // Image radius
                  child: Image.asset('assets/photo.png', fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 206, 7, 186), Color(0xFFFFB228)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [0.01, 1.0]
        ));
  }
}
