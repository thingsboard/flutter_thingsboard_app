import 'package:flutter/material.dart';

class ScanAreaClipper extends CustomClipper<Path> {
  ScanAreaClipper({super.reclip, required this.areaSize});

  final Size areaSize;
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // Create the outer path (full container)
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create the inner path (hole) - centered 100x100 rectangle

    final double holeLeft = (size.width - areaSize.width) / 2;
    final double holeTop = (size.height - areaSize.height) / 2;

    final Path holePath = Path();
    holePath.addRect(Rect.fromLTWH(holeLeft, holeTop, areaSize.width, areaSize.height));

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
