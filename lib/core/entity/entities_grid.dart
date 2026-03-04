import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entity_grid_card.dart';
import 'package:thingsboard_app/utils/signals/app_signals.dart';

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
          sliver: PagedSliverGrid(
            showNewPageProgressIndicatorAsGridChild: false,
            showNewPageErrorIndicatorAsGridChild: false,
            showNoMoreItemsIndicatorAsGridChild: false,
            pagingController: pagingController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: gridChildAspectRatio,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount:
                  Orientation.portrait == orientationSignal.watch(context)
                      ? (isMobile(context) ? 2 : 4)
                      : (isMobile(context) ? 4 : 5),
            ),
            builderDelegate: PagedChildBuilderDelegate<T>(
              itemBuilder:
                  (context, item, index) => EntityGridCard<T>(
                    item,
                    key: widget.getKey(item),
                    entityCardWidgetBuilder: widget.buildEntityGridCard,
                    onEntityTap: (i) => widget.onEntityTap(i, ref),
                    settings: widget.entityGridCardSettings(item),
                  ),
              firstPageErrorIndicatorBuilder:
                  (context) => Text("first page error"),
              newPageErrorIndicatorBuilder: (context) => Text("new page error"),
              firstPageProgressIndicatorBuilder:
                  firstPageProgressIndicatorBuilder,
              newPageProgressIndicatorBuilder: newPageProgressIndicatorBuilder,
              noItemsFoundIndicatorBuilder: noItemsFoundIndicatorBuilder,
            ),
          ),
        ),
      ],
    );
  }

  bool isMobile(BuildContext context) {
    return isMobileSignal.watch(context);
  }
}
