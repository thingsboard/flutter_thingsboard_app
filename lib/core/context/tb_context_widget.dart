import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/overlay_service/i_overlay_service.dart';

abstract class RefreshableWidget extends Widget {
  const RefreshableWidget({super.key});

  void refresh();
}

abstract class TbContextStatelessWidget extends StatelessWidget
    with HasTbContext {
  TbContextStatelessWidget(TbContext tbContext, {super.key}) {
    setTbContext(tbContext);
  }
}

abstract class TbContextWidget extends StatefulWidget with HasTbContext {
  TbContextWidget(TbContext tbContext, {super.key}) {
    setTbContext(tbContext);
  }
}

abstract class TbContextState<T extends TbContextWidget> extends State<T>
    with HasTbContext {

  TbContextState({this.handleLoading = false});
  final bool handleLoading;
  bool closeMainFirst = false;

  @override
  void initState() {
    super.initState();
    setupTbContext(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> willPop() async {
    return true;
  }
}

mixin TbMainState {
  bool canNavigate(String path);

 void  navigateToPath(String path);

  bool isHomePage();
}

abstract class TbPageWidget extends TbContextWidget {
  TbPageWidget(super.tbContext, {super.key});
}

abstract class TbPageState<W extends TbPageWidget> extends TbContextState<W>
    with RouteAware {
  TbPageState() : super(handleLoading: true);
  final IOverlayService overlayService = getIt();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    subscribeRouteObserver(this);
  }

  @override
  void dispose() {
    unsubscribeRouteObserver(this);
    super.dispose();
  }

  @override
  void didPush() {
    setupCurrentState(this);
  }

  @override
  void didPopNext() {
  overlayService.hideNotification();
    setupCurrentState(this);
  }
}

class TextContextWidget extends TbContextWidget {

  TextContextWidget(super.tbContext, this.text, {super.key});
  final String text;

  @override
  State<StatefulWidget> createState() => _TextContextWidgetState();
}

class _TextContextWidgetState extends TbContextState<TextContextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(widget.text)));
  }
}
