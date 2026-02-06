import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/config/themes/tb_text_styles.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/main/providers/navigation_provider.dart';
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
    final morePages = ref.watch(
      navigationProvider.select((n) => n.bottomBarPages),
    );
    final isMainPage =
        morePages
            .where(
              (e) => GoRouterState.of(context).path?.contains(e.path) ?? false,
            )
            .isNotEmpty;

    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: getLeading(context, isMainPage) is EmptyLeading ? 20 : 40,
          titleSpacing: 4,
          leading: getLeading(context, isMainPage),
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

  Widget? getLeading(BuildContext context, bool isMainPage) {
    if (leading != null) return leading;

    if (canGoBack && context.canPop() && !isMainPage) {
      return IconButton(
        icon: backIcon ?? const Icon(Icons.arrow_back),
        onPressed: context.pop,
      );
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
            borderRadius: 4,
            arrowLength: 8,
            arrowBaseWidth: 16,
            top: padding,
            borderColor: Colors.transparent,
            popupDirection: TooltipDirection.left,

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
            shadowColor: Colors.transparent,
            content: Text(
              text.data ?? '',
              style: TbTextStyles.labelSmall.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            controller: _controller,
            barrierColor: Colors.transparent,
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
