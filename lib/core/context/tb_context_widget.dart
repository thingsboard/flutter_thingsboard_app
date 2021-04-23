import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';

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

  void updateState() {
    setState(() {});
  }
}

abstract class TbPageWidget<W extends TbPageWidget<W,S>, S extends TbPageState<W,S>> extends TbContextWidget<W,S> {
  TbPageWidget(TbContext tbContext, {Key? key}) : super(tbContext, key: key);
}

abstract class TbPageState<W extends TbPageWidget<W,S>, S extends TbPageState<W,S>> extends TbContextState<W,S> with RouteAware {
  TbPageState({bool handleUserLoaded = false}): super(handleLoading: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tbContext.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    tbContext.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    setupCurrentState(this);
  }

  @override
  void didPopNext() {
    tbContext.hideNotification();
    setupCurrentState(this);
  }

}
