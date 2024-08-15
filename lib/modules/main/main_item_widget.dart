import 'package:flutter/material.dart';

class MainItemWidget extends StatefulWidget {
  const MainItemWidget(this.child, {super.key});

  final Widget child;

  @override
  State<StatefulWidget> createState() => _MainItemWidgetState();
}

class _MainItemWidgetState extends State<MainItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
