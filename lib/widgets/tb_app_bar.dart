import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:thingsboard_app/config/themes/app_colors.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/utils/ui/tb_text_styles.dart';
import 'package:thingsboard_app/widgets/text_overflow_builder.dart';

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
    return DetectTextOverflowBuilder(
      textWidget: text,
      builder: (context, overflow) {
        final padding = MediaQueryData.fromView(View.of(context)).padding.top;
        return overflow
            ? Row(
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
            )
            : text;
      },
    );
  }
}

class TbAppSearchBar extends TbContextWidget implements PreferredSizeWidget {
  TbAppSearchBar(
    super.tbContext, {
    super.key,
    this.elevation = 8,
    this.shadowColor,
    this.showLoadingIndicator = false,
    this.searchHint,
    this.onSearch,
    this.leading,
  }) : preferredSize = Size.fromHeight(
         kToolbarHeight + (showLoadingIndicator ? 4 : 0),
       );
  final double? elevation;
  final Color? shadowColor;
  final bool showLoadingIndicator;
  final String? searchHint;
  final void Function(String searchText)? onSearch;
  final Widget? leading;

  @override
  final Size preferredSize;

  @override
  State<StatefulWidget> createState() => _TbAppSearchBarState();
}

class _TbAppSearchBarState extends TbContextState<TbAppSearchBar> {
  final TextEditingController _filter = TextEditingController();
  final _textUpdates = StreamController<String>();

  @override
  void initState() {
    super.initState();
    _filter.addListener(() {
      _textUpdates.add(_filter.text);
    });
    _textUpdates.stream
        .skip(1)
        .debounce(const Duration(milliseconds: 150))
        .distinct()
        .forEach((element) => widget.onSearch!(element));
  }

  @override
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    children.add(buildSearchBar());
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

  AppBar buildSearchBar() {
    return AppBar(
      centerTitle: true,
      elevation: widget.elevation ?? 8,
      shadowColor: widget.shadowColor ?? const Color(0xFFFFFFFF).withAlpha(150),
      title: TextField(
        controller: _filter,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: const Color(0xFF282828).withAlpha((255 * 0.38).ceil()),
          ),
          contentPadding: const EdgeInsets.only(
            left: 15,
            bottom: 11,
            top: 15,
            right: 15,
          ),
          hintText: widget.searchHint ?? S.of(context).search,
        ),
      ),
      leading: widget.leading,
      actions: [
        ValueListenableBuilder(
          valueListenable: _filter,
          builder: (context, value, child) {
            if (_filter.text.isNotEmpty) {
              return IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _filter.text = '';
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
