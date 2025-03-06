import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationListWidget<T, B> extends StatelessWidget {
  const PaginationListWidget({
    required this.pagingController,
    required this.builderDelegate,
    this.separatorWidgetBuilder,
    this.heading,
    super.key,
  });

  final Widget? heading;
  final PagingController<T, B> pagingController;
  final PagedChildBuilderDelegate<B> builderDelegate;
  final IndexedWidgetBuilder? separatorWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          sliver: PagedSliverList<T, B>.separated(
            pagingController: pagingController,
            builderDelegate: builderDelegate,
            separatorBuilder:
                separatorWidgetBuilder ?? (_, __) => const SizedBox(height: 16),
          ),
        ),
      ],
    );
  }
}
