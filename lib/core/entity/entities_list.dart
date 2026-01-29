import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';

import 'package:thingsboard_app/core/entity/entity_list_card.dart';

mixin EntitiesListStateBase on ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntitiesListState();
}

class _EntitiesListState<T, P> extends BaseEntitiesState<T, P> {
  _EntitiesListState() : super();

  @override
  Widget pagedViewBuilder(BuildContext context) {
    final heading = widget.buildHeading(context);
    final List<Widget> slivers = [];
    if (heading != null) {
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(child: heading),
        ),
      );
    }
    slivers.add(
      SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: PagedSliverList.separated(
          pagingController: pagingController,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          builderDelegate: PagedChildBuilderDelegate<T>(
            itemBuilder: (context, item, index) => EntityListCard<T>(
              item,
              key: widget.getKey(item),
              entityCardWidgetBuilder: widget.buildEntityListCard,
              onEntityTap: (i)=> widget.onEntityTap(i, ref),
            ),
            firstPageProgressIndicatorBuilder:
                firstPageProgressIndicatorBuilder,
            newPageProgressIndicatorBuilder: newPageProgressIndicatorBuilder,
            noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
          ),
        ),
      ),
    );
    return CustomScrollView(slivers: slivers);
  }
}
