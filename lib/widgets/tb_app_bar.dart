import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';

class TbAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TbAppBar({
    this.leading,
    this.title,
    this.actions,
    this.elevation = 8,
    this.shadowColor,
    this.canGoBack = false,
    super.key,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double? elevation;
  final Color? shadowColor;
  final bool canGoBack;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _TbAppBarState();
}

class _TbAppBarState extends State<TbAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: widget.canGoBack || Navigator.of(context).canPop()
              ? widget.leading
              : null,
          title: widget.title,
          actions: widget.actions,
          elevation: widget.elevation ?? 8,
          shadowColor:
              widget.shadowColor ?? const Color(0xFFFFFFFF).withAlpha(150),
          centerTitle: false,
        ),
      ],
    );
  }
}

class TbAppSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const TbAppSearchBar({
    this.elevation = 8,
    this.shadowColor,
    this.searchHint,
    this.onSearch,
    this.leading,
    super.key,
  });

  final double? elevation;
  final Color? shadowColor;

  final String? searchHint;
  final void Function(String searchText)? onSearch;
  final Widget? leading;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _TbAppSearchBarState();
}

class _TbAppSearchBarState extends State<TbAppSearchBar> {
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
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          elevation: widget.elevation ?? 8,
          shadowColor:
              widget.shadowColor ?? const Color(0xFFFFFFFF).withAlpha(150),
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
              hintText: widget.searchHint ?? 'Search',
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
        ),
      ],
    );
  }
}
