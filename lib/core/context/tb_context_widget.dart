import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

abstract class RefreshableWidget extends Widget {
  const RefreshableWidget({super.key});

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

  Future<bool> willPop() async {
    return true;
  }
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
    // TODO rework, delete this class at all, create a new navigator observer with logs and possibility to hide toast notifications
    // hideNotification();
    setupCurrentState(this);
  }
}

class TextContextWidget extends TbContextWidget {
  final String text;

  TextContextWidget(TbContext tbContext, this.text, {super.key})
      : super(tbContext);

  @override
  State<StatefulWidget> createState() => _TextContextWidgetState();
}

class _TextContextWidgetState extends TbContextState<TextContextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(widget.text)));
  }
}
