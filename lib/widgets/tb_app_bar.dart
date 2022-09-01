import 'dart:async';

import 'package:stream_transform/stream_transform.dart';
import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';

class TbAppBar extends TbContextWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double? elevation;
  final Color? shadowColor;
  final bool showLoadingIndicator;

  @override
  final Size preferredSize;

  TbAppBar(TbContext tbContext,
      {this.leading,
      this.title,
      this.actions,
      this.elevation = 8,
      this.shadowColor,
      this.showLoadingIndicator = false})
      : preferredSize =
            Size.fromHeight(kToolbarHeight + (showLoadingIndicator ? 4 : 0)),
        super(tbContext);

  @override
  _TbAppBarState createState() => _TbAppBarState();
}

class _TbAppBarState extends TbContextState<TbAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    children.add(buildDefaultBar());
    if (widget.showLoadingIndicator) {
      children.add(ValueListenableBuilder(
          valueListenable: loadingNotifier,
          builder: (context, bool loading, child) {
            if (loading) {
              return LinearProgressIndicator();
            } else {
              return Container(height: 4);
            }
          }));
    }
    return Column(
      children: children,
    );
  }

  AppBar buildDefaultBar() {
    return AppBar(
      leading: widget.leading,
      title: widget.title,
      actions: widget.actions,
      elevation: widget.elevation ?? 8,
      shadowColor: widget.shadowColor ?? Color(0xFFFFFFFF).withAlpha(150),
    );
  }
}

class TbAppSearchBar extends TbContextWidget implements PreferredSizeWidget {
  final double? elevation;
  final Color? shadowColor;
  final bool showLoadingIndicator;
  final String? searchHint;
  final void Function(String searchText)? onSearch;

  @override
  final Size preferredSize;

  TbAppSearchBar(TbContext tbContext,
      {this.elevation = 8,
      this.shadowColor,
      this.showLoadingIndicator = false,
      this.searchHint,
      this.onSearch})
      : preferredSize =
            Size.fromHeight(kToolbarHeight + (showLoadingIndicator ? 4 : 0)),
        super(tbContext);

  @override
  _TbAppSearchBarState createState() => _TbAppSearchBarState();
}

class _TbAppSearchBarState extends TbContextState<TbAppSearchBar> {
  final TextEditingController _filter = new TextEditingController();
  final _textUpdates = StreamController<String>();

  @override
  void initState() {
    super.initState();
    // _textUpdates.add('');
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
    List<Widget> children = <Widget>[];
    children.add(buildSearchBar());
    if (widget.showLoadingIndicator) {
      children.add(ValueListenableBuilder(
          valueListenable: loadingNotifier,
          builder: (context, bool loading, child) {
            if (loading) {
              return LinearProgressIndicator();
            } else {
              return Container(height: 4);
            }
          }));
    }
    return Column(
      children: children,
    );
  }

  AppBar buildSearchBar() {
    return AppBar(
        centerTitle: true,
        elevation: widget.elevation ?? 8,
        shadowColor: widget.shadowColor ?? Color(0xFFFFFFFF).withAlpha(150),
        title: TextField(
            controller: _filter,
            autofocus: true,
            // cursorColor: Colors.white,
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Color(0xFF282828).withAlpha((255 * 0.38).ceil()),
              ),
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 15, right: 15),
              hintText: widget.searchHint ?? 'Search',
            )),
        actions: [
          ValueListenableBuilder(
              valueListenable: _filter,
              builder: (context, value, child) {
                if (_filter.text.isNotEmpty) {
                  return IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _filter.text = '';
                    },
                  );
                } else {
                  return Container();
                }
              })
        ]);
  }
}
