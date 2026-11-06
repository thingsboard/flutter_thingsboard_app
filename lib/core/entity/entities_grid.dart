// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entity_grid_card.dart';

mixin EntitiesGridStateBase on ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntitiesGridState();
}

class _EntitiesGridState<T, P> extends BaseEntitiesState<T, P> {
  _EntitiesGridState() : super();

  @override
  Widget pagedViewBuilder(BuildContext context) {
    final heading = widget.buildHeading(context);
    final gridChildAspectRatio = widget.gridChildAspectRatio() ?? 156 / 150;

    final slivers = <Widget>[];
    if (heading != null) {
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(child: heading),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        ...slivers,
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: PagingListener(
            controller: pagingController,
            builder: (context, state, fetchNextPage) => PagedSliverGrid(
              showNewPageProgressIndicatorAsGridChild: false,
              showNewPageErrorIndicatorAsGridChild: false,
              showNoMoreItemsIndicatorAsGridChild: false,
              state: state,
              fetchNextPage: fetchNextPage,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: gridChildAspectRatio,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount:
                    Orientation.portrait == MediaQuery.of(context).orientation
                    ? (isMobile(context) ? 2 : 4)
                    : (isMobile(context) ? 4 : 5),
              ),
              builderDelegate: PagedChildBuilderDelegate<T>(
                itemBuilder: (context, item, index) => EntityGridCard<T>(
                  item,
                  key: widget.getKey(item),
                  entityCardWidgetBuilder: widget.buildEntityGridCard,
                  onEntityTap: (i) => widget.onEntityTap(i, ref),
                  settings: widget.entityGridCardSettings(item),
                ),
                firstPageErrorIndicatorBuilder: (context) =>
                    const Text("first page error"),
                newPageErrorIndicatorBuilder: (context) =>
                    const Text("new page error"),
                firstPageProgressIndicatorBuilder:
                    firstPageProgressIndicatorBuilder,
                newPageProgressIndicatorBuilder:
                    newPageProgressIndicatorBuilder,
                noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool isMobile(BuildContext context) {
    // The equivalent of the "smallestWidth" qualifier on Android.
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    return shortestSide < 600;
  }
}
