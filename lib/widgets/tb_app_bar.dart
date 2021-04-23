import 'dart:async';

import 'package:stream_transform/stream_transform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thingsboard_app/config/themes/tb_theme.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class TbAppBar extends TbContextWidget<TbAppBar, _TbAppBarState> implements PreferredSizeWidget {

  final Widget? title;
  final bool? showProfile;
  final bool? showLogout;
  final ValueNotifier<bool>? searchModeNotifier;
  final String? searchHint;
  final void Function(String searchText)? onSearch;
  final void Function()? onSearchClosed;

  @override
  final Size preferredSize;

  TbAppBar(TbContext tbContext, {this.title, this.showProfile = true, this.showLogout = false, this.searchModeNotifier, this.searchHint, this.onSearch, this.onSearchClosed}) :
    preferredSize = Size.fromHeight(kToolbarHeight + 4),
    super(tbContext);

  @override
  _TbAppBarState createState() => _TbAppBarState();

}

class _TbAppBarState extends TbContextState<TbAppBar, _TbAppBarState> {

  final TextEditingController _filter = new TextEditingController();
  final _textUpdates = StreamController<String>();

  @override
  void initState() {
    super.initState();
    if (widget.searchModeNotifier != null) {
      _textUpdates.add('');
      _filter.addListener(() {
        _textUpdates.add(_filter.text);
      });
      _textUpdates.stream.debounce(const Duration(milliseconds: 150)).distinct().forEach((element) => widget.onSearch!(element));
    }
  }

  @override
  void dispose() {
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    if (widget.searchModeNotifier != null) {
      children.add(ValueListenableBuilder(
          valueListenable: widget.searchModeNotifier!,
          builder: (context, bool searchMode, child) {
            if (searchMode) {
              return buildSearchBar();
            } else {
              return buildDefaultBar();
            }
          }
      ));
    } else {
      children.add(buildDefaultBar());
    }
    children.add(
        ValueListenableBuilder(
            valueListenable: loadingNotifier,
            builder: (context, bool loading, child) {
              if (loading) {
                return LinearProgressIndicator();
              } else {
                return Container(height: 4);
              }
            }
        )
    );
    return Column(
      children: children,
    );
  }

  AppBar buildSearchBar() {
    return AppBar(
      centerTitle: true,
      title: Theme(
          data: tbDarkTheme,
          child: TextField(
          controller: _filter,
          cursorColor: Colors.white,
          decoration: new InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 15, right: 15),
              suffixIcon: new Icon(Icons.search, color: Colors.white),
              hintText: widget.searchHint ?? 'Search...',
          ),
        )
      ),
      leading: new IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          _filter.text = '';
          widget.searchModeNotifier!.value = false;
        },
      ),
    );
  }

  AppBar buildDefaultBar() {
    List<Widget> actions = <Widget>[];
    if (widget.showProfile!) {
      actions.add(IconButton(
        icon: Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        onPressed: () {
          navigateTo('/profile');
        },
      ));
    }
    if (widget.showLogout!) {
      actions.add(
          TextButton(
              child: const Text('Logout',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              onPressed: () {
                tbContext.tbClient.logout(
                    requestConfig: RequestConfig(ignoreErrors: true));
              }
          )
      );
    }
    return AppBar(
      title: widget.title,
      actions: actions,
    );
  }
}
