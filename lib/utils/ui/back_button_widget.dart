import 'dart:io';

import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
      ),
    );
  }
}
