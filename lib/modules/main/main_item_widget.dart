import 'package:flutter/material.dart';

class MainItemWidget extends StatefulWidget {
  const MainItemWidget(this.child, {required this.path, super.key});

  final Widget? child;
  final String path;

  @override
  State<StatefulWidget> createState() => _MainItemWidgetState();
}

class _MainItemWidgetState extends State<MainItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child ??
        Scaffold(
          appBar: AppBar(title: const Text('Not Found')),
          body: Center(
            child: Text('Route not defined: ${widget.path}'),
          ),
        );
  }

  @override
  bool get wantKeepAlive => true;
}
