// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/entity/contact_info.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/utils/services/custom_translation/i_custom_translation_service.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

abstract class EntityDetailsPage<T extends Object> extends StatefulWidget {
  const EntityDetailsPage({
    required this._defaultTitle,
    required this._entityId,
    this._subTitle,
    this._showLoadingIndicator = true,
    this._hideAppBar = false,
    this._appBarElevation,
    super.key,
  });
  TextStyle get labelTextStyle =>
      const TextStyle(color: Color(0xFF757575), fontSize: 14, height: 20 / 14);

  TextStyle get valueTextStyle =>
      const TextStyle(color: Color(0xFF282828), fontSize: 14, height: 20 / 14);

  /// Shown until the entity, and with it its name, is loaded.
  final String Function(S s) _defaultTitle;
  final String _entityId;
  final String Function(S s)? _subTitle;
  final bool _showLoadingIndicator;
  final bool _hideAppBar;
  final double? _appBarElevation;

  @override
  State<StatefulWidget> createState() => _EntityDetailsPageState();

  Future<T?> fetchEntity(String id);

  Widget buildEntityDetails(BuildContext context, T entity);
}

class _EntityDetailsPageState<T extends Object>
    extends State<EntityDetailsPage<T>> {
  late Future<T?> entityFuture;
  final titleValue = ValueNotifier<String?>(null);
  final ICustomTranslationService customTranslationService = getIt();

  @override
  void initState() {
    super.initState();
    entityFuture = widget.fetchEntity(widget._entityId);
    entityFuture.then(
      (value) => titleValue.value = _entityName(value),
      // The FutureBuilder below shows the failure; keep the default title.
      onError: (_) {},
    );
  }

  @override
  void dispose() {
    titleValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget._hideAppBar
          ? null
          : TbAppBar(
              showLoadingIndicator: widget._showLoadingIndicator,
              elevation: widget._appBarElevation,
              title: ValueListenableBuilder<String?>(
                valueListenable: titleValue,
                builder: (context, name, _) {
                  final s = S.of(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name != null
                            ? customTranslationService.translate(name)
                            : widget._defaultTitle(s),
                        style: widget._subTitle != null
                            ? Theme.of(context).primaryTextTheme.titleLarge!
                                  .copyWith(fontSize: 16)
                            : null,
                      ),
                      if (widget._subTitle != null)
                        Text(
                          widget._subTitle!(s),
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
            final entity = snapshot.data;
            if (entity != null) {
              // SafeArea: in landscape the display cutout covers the sides.
              return SingleChildScrollView(
                child: SafeArea(
                  child: widget.buildEntityDetails(context, entity),
                ),
              );
            } else {
              return Center(
                child: Text(S.of(context).requestedEntityDoesNotExists),
              );
            }
          } else {
            return const Center(child: TbProgressIndicator(size: 50.0));
          }
        },
      ),
    );
  }
}

abstract class ContactBasedDetailsPage<T extends Object>
    extends EntityDetailsPage<T> {
  const ContactBasedDetailsPage({
    required super.defaultTitle,
    required super.entityId,
    super.subTitle,
    super.showLoadingIndicator,
    super.hideAppBar,
    super.appBarElevation,
    super.key,
  });

  @override
  Widget buildEntityDetails(BuildContext context, T entity) {
    final e = ContactInfo.of(entity)!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).title, style: labelTextStyle),
          Text(
            getIt<ICustomTranslationService>().translate(e.title),
            style: valueTextStyle,
          ),
          const SizedBox(height: 16),
          Text(S.of(context).country, style: labelTextStyle),
          Text(e.country ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).city, style: labelTextStyle),
                    Text(e.city ?? '', style: valueTextStyle),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).stateOrProvince, style: labelTextStyle),
                    Text(e.state ?? '', style: valueTextStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(S.of(context).postalCode, style: labelTextStyle),
          Text(e.zip ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text(S.of(context).address, style: labelTextStyle),
          Text(e.address ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text(S.of(context).address2, style: labelTextStyle),
          Text(e.address2 ?? '', style: valueTextStyle),
          const SizedBox(height: 16),
          Text(S.of(context).phone, style: labelTextStyle),
          // A phone number reads left to right in any language; without the
          // isolate its leading plus moves to the end in right-to-left.
          Text(
            e.phone == null ? '' : '\u2066${e.phone}\u2069',
            style: valueTextStyle,
          ),
          const SizedBox(height: 16),
          Text(S.of(context).email, style: labelTextStyle),
          Text(e.email ?? '', style: valueTextStyle),
        ],
      ),
    );
  }
}

/// The generated models share no name interface; these are the entity types
/// shown by [EntityDetailsPage].
String? _entityName(Object? entity) => switch (entity) {
  Device(:final name) => name,
  Asset(:final name) => name,
  Customer(:final title) => title,
  Tenant(:final title) => title,
  _ => null,
};
