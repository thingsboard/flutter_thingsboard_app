import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/thingsboard_client.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';

abstract class EntityDetailsPage<T extends BaseData> extends TbContextWidget {
  final labelTextStyle =
      const TextStyle(color: Color(0xFF757575), fontSize: 14, height: 20 / 14);

  final valueTextStyle =
      const TextStyle(color: Color(0xFF282828), fontSize: 14, height: 20 / 14);

  final String _defaultTitle;
  final String _entityId;
  final String? _subTitle;
  final bool _hideAppBar;
  final double? _appBarElevation;

  EntityDetailsPage(
    TbContext tbContext, {
    required String defaultTitle,
    required String entityId,
    String? subTitle,
    bool showLoadingIndicator = true,
    bool hideAppBar = false,
    double? appBarElevation,
    super.key,
  })  : _defaultTitle = defaultTitle,
        _entityId = entityId,
        _subTitle = subTitle,
        _hideAppBar = hideAppBar,
        _appBarElevation = appBarElevation,
        super(tbContext);

  @override
  State<StatefulWidget> createState() => _EntityDetailsPageState();

  Future<T?> fetchEntity(String id);

  ValueNotifier<String>? detailsTitle() {
    return null;
  }

  Widget buildEntityDetails(BuildContext context, T entity);
}

class _EntityDetailsPageState<T extends BaseData>
    extends TbContextState<EntityDetailsPage<T>> {
  late Future<T?> entityFuture;
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
          titleValue.value = (value as HasName).getName();
        }
      });
    } else {
      titleValue = detailsTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget._hideAppBar
          ? null
          : TbAppBar(
              elevation: widget._appBarElevation,
              title: ValueListenableBuilder<String>(
                valueListenable: titleValue,
                builder: (context, title, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: widget._subTitle != null
                            ? Theme.of(context)
                                .primaryTextTheme
                                .titleLarge!
                                .copyWith(fontSize: 16)
                            : null,
                      ),
                      if (widget._subTitle != null)
                        Text(
                          widget._subTitle!,
                          style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .titleLarge!
                                .color!
                                .withAlpha((0.38 * 255).ceil()),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            height: 16 / 12,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
      body: FutureBuilder<T?>(
        future: entityFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var entity = snapshot.data;
            if (entity != null) {
              return widget.buildEntityDetails(context, entity);
            } else {
              return const Center(
                child: Text('Requested entity does not exists.'),
              );
            }
          } else {
            return const Center(
              child: TbProgressIndicator(
                size: 50.0,
              ),
            );
          }
        },
      ),
    );
  }
}

abstract class ContactBasedDetailsPage<T extends ContactBased>
    extends EntityDetailsPage<T> {
  ContactBasedDetailsPage(
    TbContext tbContext, {
    required String defaultTitle,
    required String entityId,
    String? subTitle,
    bool showLoadingIndicator = true,
    bool hideAppBar = false,
    double? appBarElevation,
    super.key,
  }) : super(
          tbContext,
          defaultTitle: defaultTitle,
          entityId: entityId,
          subTitle: subTitle,
          showLoadingIndicator: showLoadingIndicator,
          hideAppBar: hideAppBar,
          appBarElevation: appBarElevation,
        );

  @override
  Widget buildEntityDetails(BuildContext context, T entity) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Title', style: labelTextStyle),
          Text(entity.getName(), style: valueTextStyle),
          const SizedBox(height: 16),
          Text('Country', style: labelTextStyle),
          Text(entity.country ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('City', style: labelTextStyle),
                    Text(entity.city ?? '', style: valueTextStyle),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('State / Province', style: labelTextStyle),
                    Text(entity.state ?? '', style: valueTextStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Zip / Postal Code', style: labelTextStyle),
          Text(entity.zip ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text('Address', style: labelTextStyle),
          Text(entity.address ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text('Address 2', style: labelTextStyle),
          Text(entity.address2 ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text('Phone', style: labelTextStyle),
          Text(entity.phone ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text('Email', style: labelTextStyle),
          Text(entity.email ?? '', style: valueTextStyle),
        ],
      ),
    );
  }
}
