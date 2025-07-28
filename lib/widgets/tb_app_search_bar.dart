import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/generated/l10n.dart';

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
