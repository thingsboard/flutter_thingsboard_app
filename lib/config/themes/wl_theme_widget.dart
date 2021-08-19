import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

typedef WlThemedWidgetBuilder = Widget Function(BuildContext context, ThemeData data, WhiteLabelingParams wlParams);

class WlThemeWidget extends TbContextWidget {

  final WlThemedWidgetBuilder wlThemedWidgetBuilder;

  WlThemeWidget(TbContext tbContext, {required this.wlThemedWidgetBuilder}) : super(tbContext);

  @override
  _WlThemeWidgetState createState() => _WlThemeWidgetState();

  static _WlThemeWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<_WlThemeWidgetState>();
  }

}

class _WlThemeWidgetState extends TbContextState<WlThemeWidget> {

  late WhiteLabelingParams _wlParams;
  late ThemeData _themeData;

  @override
  void initState() {
    super.initState();
    _loadWl();
  }

  void _loadWl() {
    _themeData = tbContext.wlService.themeData;
    _wlParams = tbContext.wlService.wlParams;
    if (mounted) {
      setState(() {});
    }
  }

  void wlUpdated() {
    setState(() {
      _themeData = tbContext.wlService.themeData;
      _wlParams = tbContext.wlService.wlParams;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.wlThemedWidgetBuilder(context, _themeData, _wlParams);
  }

}
