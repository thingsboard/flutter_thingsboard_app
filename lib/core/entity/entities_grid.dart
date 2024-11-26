import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'entities_base.dart';
import 'entity_grid_card.dart';

mixin EntitiesGridStateBase on StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EntitiesGridState();
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

    return OrientationBuilder(
      builder: (context, orientation) => CustomScrollView(
        slivers: [
          ...slivers,
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: PagedSliverGrid(
              showNewPageProgressIndicatorAsGridChild: false,
              showNewPageErrorIndicatorAsGridChild: false,
              showNoMoreItemsIndicatorAsGridChild: false,
              pagingController: pagingController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: gridChildAspectRatio,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: Orientation.portrait == orientation
                    ? (isMobile(context) ? 2 : 4)
                    : (isMobile(context) ? 4 : 5),
              ),
              builderDelegate: PagedChildBuilderDelegate<T>(
                itemBuilder: (context, item, index) => EntityGridCard<T>(
                  item,
                  key: widget.getKey(item),
                  entityCardWidgetBuilder: widget.buildEntityGridCard,
                  onEntityTap: widget.onEntityTap,
                  settings: widget.entityGridCardSettings(item),
                ),
                firstPageProgressIndicatorBuilder:
                    firstPageProgressIndicatorBuilder,
                newPageProgressIndicatorBuilder:
                    newPageProgressIndicatorBuilder,
                noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isMobile(BuildContext context) {
    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    return shortestSide < 600;
  }
}
