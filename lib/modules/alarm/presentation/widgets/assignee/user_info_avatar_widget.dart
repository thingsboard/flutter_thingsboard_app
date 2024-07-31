import 'package:flutter/material.dart';

class UserInfoAvatarWidget extends StatelessWidget {
  const UserInfoAvatarWidget({
    required this.shortName,
    required this.color,
    super.key,
  }) : assert(shortName.length <= 2);

  final String shortName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      height: 24,
      width: 24,
      child: Center(
        child: Text(
          shortName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
