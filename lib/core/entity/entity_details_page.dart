import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract class EntityDetailsPage<T extends BaseData> extends TbPageWidget<EntityDetailsPage<T>, _EntityDetailsPageState<T>> {

  final String _defaultTitle;
  final String _entityId;
  final bool _showLoadingIndicator;
  final bool _hideAppBar;
  final double? _appBarElevation;

  EntityDetailsPage(TbContext tbContext,
                   {required String defaultTitle,
                    required String entityId,
                    bool showLoadingIndicator = true,
                    bool hideAppBar = false,
                    double? appBarElevation}):
      this._defaultTitle = defaultTitle,
      this._entityId = entityId,
      this._showLoadingIndicator = showLoadingIndicator,
      this._hideAppBar = hideAppBar,
      this._appBarElevation = appBarElevation,
      super(tbContext);

  @override
  _EntityDetailsPageState createState() => _EntityDetailsPageState();

  Future<T> fetchEntity(String id);

  ValueNotifier<String>? detailsTitle() {
    return null;
  }

  Widget buildEntityDetails(BuildContext context, T entity);

}

class _EntityDetailsPageState<T extends BaseData> extends TbPageState<EntityDetailsPage<T>, _EntityDetailsPageState<T>> {

  late Future<T> entityFuture;
  late ValueNotifier<String> titleValue;

  @override
  void initState() {
    super.initState();
    entityFuture = widget.fetchEntity(widget._entityId);
    ValueNotifier<String>? detailsTitle = widget.detailsTitle();
    if (detailsTitle == null) {
      titleValue = ValueNotifier(widget._defaultTitle);
      entityFuture.then((value) {
        if (value is HasName) {
          titleValue.value =  (value as HasName).getName();
        }
      });
    } else {
      titleValue = detailsTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget._hideAppBar ? null : TbAppBar(
        tbContext,
        showLoadingIndicator: widget._showLoadingIndicator,
        elevation: widget._appBarElevation,
        title: ValueListenableBuilder<String>(
          valueListenable: titleValue,
          builder: (context, title, widget) {
            return FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.centerLeft,
                child: Text(title)
            );
          },
        ),
      ),
      body: FutureBuilder<T>(
        future: entityFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var entity = snapshot.data!;
            return widget.buildEntityDetails(context, entity);
          } else {
            return Center(child: TbProgressIndicator(
              size: 50.0,
            ));
          }
        },
      ),
    );
  }

}
