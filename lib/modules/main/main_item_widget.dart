import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class MainItemWidget extends TbContextWidget {
  MainItemWidget(
    super.tbContext, {
    required this.child,
    required this.path,
    super.key,
  });

  final Widget? child;
  final String path;

  @override
  State<StatefulWidget> createState() => _MainItemWidgetState();
}

class _MainItemWidgetState extends TbContextState<MainItemWidget>
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
