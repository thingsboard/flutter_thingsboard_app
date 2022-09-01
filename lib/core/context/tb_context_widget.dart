import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

abstract class RefreshableWidget extends Widget {
  refresh();
}

abstract class TbContextStatelessWidget extends StatelessWidget
    with HasTbContext {
  TbContextStatelessWidget(TbContext tbContext, {Key? key}) : super(key: key) {
    setTbContext(tbContext);
  }
}

abstract class TbContextWidget extends StatefulWidget with HasTbContext {
  TbContextWidget(TbContext tbContext, {Key? key}) : super(key: key) {
    setTbContext(tbContext);
  }
}

abstract class TbContextState<T extends TbContextWidget> extends State<T>
    with HasTbContext {
  final bool handleLoading;
  bool closeMainFirst = false;

  TbContextState({this.handleLoading = false});

  @override
  void initState() {
    super.initState();
    setupTbContext(this);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

mixin TbMainState {
  bool canNavigate(String path);

  navigateToPath(String path);

  bool isHomePage();
}

abstract class TbPageWidget extends TbContextWidget {
  TbPageWidget(TbContext tbContext, {Key? key}) : super(tbContext, key: key);
}

abstract class TbPageState<W extends TbPageWidget> extends TbContextState<W>
    with RouteAware {
  TbPageState({bool handleUserLoaded = false}) : super(handleLoading: true);

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
    hideNotification();
    setupCurrentState(this);
  }
}

class TextContextWidget extends TbContextWidget {
  final String text;

  TextContextWidget(TbContext tbContext, this.text) : super(tbContext);

  @override
  _TextContextWidgetState createState() => _TextContextWidgetState();
}

class _TextContextWidgetState extends TbContextState<TextContextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(widget.text)));
  }
}
