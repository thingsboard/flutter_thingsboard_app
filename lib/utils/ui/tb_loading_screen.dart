import 'package:flutter/material.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class TbLoadingScreen extends StatelessWidget {
  const TbLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: const Color(0x99FFFFFF),
        child: const Center(
          child: TbProgressIndicator(size: 50),
        ),
      ),
    );
  }
}
