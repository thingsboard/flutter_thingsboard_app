
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';

class TbAppBar extends TbContextWidget implements PreferredSizeWidget {
  TbAppBar(
    super.tbContext, {
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.elevation = 8,
    this.shadowColor,
    this.showLoadingIndicator = false,
    this.canGoBack = false,
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

  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() => _TbAppBarState();
}

class _TbAppBarState extends TbContextState<TbAppBar> {
  final _controller = SuperTooltipController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    children.add(buildDefaultBar());
    if (widget.showLoadingIndicator) {
      children.add(
        ValueListenableBuilder(
          valueListenable: loadingNotifier,
          builder: (context, bool loading, child) {
            if (loading) {
              return const LinearProgressIndicator();
            } else {
              return Container(height: 4);
            }
          },
        ),
      );
    }
    return Column(children: children);
  }

  AppBar buildDefaultBar() {
    return AppBar(
      titleTextStyle: TbTextStyles.titleXs.copyWith(
        color: AppColors.textPrimary,
      ),
      leading:
          widget.canGoBack || Navigator.of(context).canPop()
              ? widget.leading
              : null,
      title: buildTitle(),
      actions: widget.actions,
      elevation: widget.elevation ?? 8,
      shadowColor: widget.shadowColor ?? const Color(0xFFFFFFFF).withAlpha(150),
      centerTitle: false,
    );
  }

  Widget? buildTitle() {
    if (widget.title == null) {
      return widget.title;
    }
    if (widget.title is Text) {
      return buildTooltip(widget.title! as Text);
    }
    if (widget.title is Column) {
      final column = widget.title! as Column;
      final newContent = <Widget>[];
      bool isTitleFound = false;
      for (final e in (widget.title! as Column).children) {
        if (e is Text) {
          if (!isTitleFound) {
            newContent.add(buildTooltip(e));
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
    return widget.title;
  }

  Widget buildTooltip(Text text) {
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
