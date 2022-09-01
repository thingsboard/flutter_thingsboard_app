import 'package:flutter/material.dart';

class LoginPageBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: CustomPaint(
      painter:
          _LoginPageBackgroundPainter(color: Theme.of(context).primaryColor),
    ));
  }
}

class _LoginPageBackgroundPainter extends CustomPainter {
  final Color color;

  const _LoginPageBackgroundPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withAlpha(14);
    paint.style = PaintingStyle.fill;
    var topPath = Path();
    topPath.moveTo(0, 0);
    topPath.lineTo(size.width / 2, 0);
    topPath.lineTo(0, size.height / 10);
    topPath.close();
    canvas.drawPath(topPath, paint);
    var bottomPath = Path();
    bottomPath.moveTo(0, size.height * 0.98);
    bottomPath.lineTo(size.width, size.height * 0.78);
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(0, size.height);
    bottomPath.close();
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant _LoginPageBackgroundPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
