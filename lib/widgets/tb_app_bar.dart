// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/domain/models/navigation_item_data.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_helper.dart';
import 'package:thingsboard_app/modules/main/presentation/providers/navigation_provider.dart';
import 'package:thingsboard_app/utils/services/loading_service/i_loading_service.dart';

class TbAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  TbAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.elevation = 8,
    this.shadowColor,
    this.showLoadingIndicator = false,
    this.canGoBack = true,
    this.backIcon,
  }) : preferredSize = Size.fromHeight(
         kToolbarHeight + (showLoadingIndicator ? 4 : 0),
       );
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double? elevation;
  final Color? shadowColor;
  final bool showLoadingIndicator;
  final bool canGoBack;
  final Widget? backIcon;

  @override
  final Size preferredSize;

  final _controller = SuperTooltipController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(navigationProvider);
    final path = GoRouterState.of(context).path;
    bool isAt(NavigationItemData page) => path?.contains(page.path) ?? false;
    final isMainPage = navigation.bottomBarPages.any(isAt);
    // A page opened as a landscape tab has nothing below it; back in
    // portrait it is behind More again, so it goes back there.
    final isMorePage = navigation.morePages.any(isAt);

    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          leadingWidth:
              getLeading(context, isMainPage, isMorePage) is EmptyLeading
              ? 20
              : 40,
          titleSpacing: 4,
          leading: getLeading(context, isMainPage, isMorePage),
          title: buildTitle(context),
          actions: actions,
          elevation: elevation ?? 8,
          shadowColor: shadowColor ?? const Color(0xFFFFFFFF).withAlpha(150),
          centerTitle: false,
        ),
        if (showLoadingIndicator)
          ValueListenableBuilder(
            valueListenable: getIt<ILoadingService>().isLoading,
            builder: (context, bool loading, child) {
              if (loading) {
                return const LinearProgressIndicator();
              } else {
                return Container(height: 4);
              }
            },
          ),
      ],
    );
  }

  Widget? getLeading(BuildContext context, bool isMainPage, bool isMorePage) {
    if (leading != null) return leading;

    if (canGoBack && !isMainPage) {
      if (context.canPop()) {
        return IconButton(
          icon: backIcon ?? const Icon(Icons.arrow_back),
          onPressed: context.pop,
        );
      }
      if (isMorePage) {
        return IconButton(
          icon: backIcon ?? const Icon(Icons.arrow_back),
          onPressed: () => context.go(morePath),
        );
      }
    }
    return const EmptyLeading();
  }

  Widget? buildTitle(BuildContext context) {
    if (title == null) {
      return title;
    }
    if (title is Text) {
      return buildTooltip(title! as Text, context);
    }
    if (title is Column) {
      final column = title! as Column;
      final newContent = <Widget>[];
      bool isTitleFound = false;
      for (final e in (title! as Column).children) {
        if (e is Text) {
          if (!isTitleFound) {
            newContent.add(buildTooltip(e, context));
            isTitleFound = true;
            continue;
          }
        }
        newContent.add(e);
      }
      return Column(
        mainAxisAlignment: column.mainAxisAlignment,
        mainAxisSize: column.mainAxisSize,
        crossAxisAlignment: column.crossAxisAlignment,
        spacing: column.spacing,
        children: newContent,
      );
    }
    return title;
  }

  Widget buildTooltip(Text text, BuildContext context) {
    final padding = MediaQueryData.fromView(View.of(context)).padding.top;
    return AutoSizeText(
      text.data ?? '',
      maxLines: 1,
      style: text.style,
      overflowReplacement: Row(
        children: [
          Flexible(child: text),
          SuperTooltip(
            style: TooltipStyle(
              borderRadius: 4,
              borderColor: Colors.transparent,
              shadowColor: Colors.transparent,
              boxShadows: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .15),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .3),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            arrowConfig: const ArrowConfiguration(length: 8, baseWidth: 16),
            positionConfig: PositionConfiguration(
              top: padding,
              preferredDirection: TooltipDirection.left,
            ),
            content: Text(
              text.data ?? '',
              style: TbTextStyles.labelSmall.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            controller: _controller,
            barrierConfig: const BarrierConfiguration(
              color: Colors.transparent,
            ),
            child: InkWell(
              onTap: () {
                _controller.showTooltip();
              },
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.info_outline),
              ),
            ),
          ),
        ],
      ),
      minFontSize: text.style?.fontSize ?? 12,
    );
  }
}

class EmptyLeading extends StatelessWidget {
  const EmptyLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
