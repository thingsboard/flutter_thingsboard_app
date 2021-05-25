import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

abstract class RefreshableWidget extends Widget {
  refresh();
}

abstract class TbContextStatelessWidget extends StatelessWidget with HasTbContext {
  TbContextStatelessWidget(TbContext tbContext, {Key? key}) : super(key: key) {
    setTbContext(tbContext);
  }
}

abstract class TbContextWidget<W extends TbContextWidget<W,S>, S extends TbContextState<W,S>> extends StatefulWidget with HasTbContext {
  TbContextWidget(TbContext tbContext, {Key? key}) : super(key: key) {
    setTbContext(tbContext);
  }
}

abstract class TbContextState<W extends TbContextWidget<W,S>, S extends TbContextState<W,S>> extends State<W> with HasTbContext {

  final bool handleLoading;

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

}

abstract class TbPageWidget<W extends TbPageWidget<W,S>, S extends TbPageState<W,S>> extends TbContextWidget<W,S> {
  TbPageWidget(TbContext tbContext, {Key? key}) : super(tbContext, key: key);
}

abstract class TbPageState<W extends TbPageWidget<W,S>, S extends TbPageState<W,S>> extends TbContextState<W,S> with RouteAware {
  TbPageState({bool handleUserLoaded = false}): super(handleLoading: true);

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

class TextContextWidget extends TbContextWidget<TextContextWidget, _TextContextWidgetState> {

  final String text;

  TextContextWidget(TbContext tbContext, this.text) : super(tbContext);

  @override
  _TextContextWidgetState createState() => _TextContextWidgetState();

}

class _TextContextWidgetState extends TbContextState<TextContextWidget, _TextContextWidgetState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(widget.text)));
  }

}
