import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoAvatarWidget extends StatelessWidget {
  const UserInfoAvatarWidget({
    required this.shortName,
    required this.color,
    super.key,
  }) : assert(shortName.length <= 2, 'shortName is $shortName');

  final String shortName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      padding: const EdgeInsets.all(4),
      height: 32,
      width: 32,
      child: Center(
        child: Text(
          shortName,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            letterSpacing: 1,
            height: 1.14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
