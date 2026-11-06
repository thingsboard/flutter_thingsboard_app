// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:thingsboard_app/generated/l10n.dart';

class MainItemWidget extends StatefulWidget {
  const MainItemWidget({required this.child, required this.path, super.key});

  final Widget? child;
  final String path;

  @override
  State<StatefulWidget> createState() => _MainItemWidgetState();
}

class _MainItemWidgetState extends State<MainItemWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child ??
        Scaffold(
          appBar: AppBar(title: Text(S.of(context).notFound)),
          body: Center(child: Text(S.of(context).routeNotDefined(widget.path))),
        );
  }

  @override
  bool get wantKeepAlive => true;
}
