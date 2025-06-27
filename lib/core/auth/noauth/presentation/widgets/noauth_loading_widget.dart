import 'package:flutter/material.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

class NoAuthLoadingWidget extends StatelessWidget {
  const NoAuthLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ColoredBox(
        color: Color(0x99FFFFFF),
        child: Center(
          child: TbProgressIndicator(size: 50.0),
        ),
      ),
    );
  }
}
