import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationGridWidget<T, B> extends StatelessWidget {
  const PaginationGridWidget({
    required this.pagingController,
    required this.builderDelegate,
    this.heading,
    this.gridDelegate,
    this.gridChildAspectRatio,
    super.key,
  });

  final Widget? heading;
  final PagingController<T, B> pagingController;
  final PagedChildBuilderDelegate<B> builderDelegate;
  final SliverGridDelegate? gridDelegate;
  final double? gridChildAspectRatio;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => CustomScrollView(
        slivers: [
          SliverVisibility(
            visible: heading != null,
            sliver: SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              sliver: SliverToBoxAdapter(child: heading),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: PagedSliverGrid<T, B>(
              pagingController: pagingController,
              builderDelegate: builderDelegate,
              gridDelegate: gridDelegate ??
                  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: gridChildAspectRatio ?? 156 / 150,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: Orientation.portrait == orientation
                        ? (isMobile(context) ? 2 : 4)
                        : (isMobile(context) ? 4 : 5),
                  ),
            ),
          ),
        ],
      ),
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
