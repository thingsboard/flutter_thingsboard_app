// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Scrolls [child] above [footer], which stays pinned below the scroll while
/// the keyboard is closed. While the keyboard is open, [footer] scrolls after
/// [child] instead, so the focused field gets all the room the keyboard
/// leaves. Without a [footer] it is a plain scroll view.
class PinnedFooterScrollView extends StatelessWidget {
  const PinnedFooterScrollView({
    super.key,
    required this.child,
    this.footer,
    this.padding = EdgeInsets.zero,
    this.pinnedFooterPadding = EdgeInsets.zero,
  });

  final Widget child;
  final Widget? footer;

  /// Padding of the scrolling content, the footer included while it scrolls.
  final EdgeInsets padding;

  /// Padding around [footer] while it is pinned.
  final EdgeInsets pinnedFooterPadding;

  @override
  Widget build(BuildContext context) {
    // Rebuilt by the layout change the keyboard causes; the inset is read from
    // the view because a Scaffold body's MediaQuery has it removed.
    return LayoutBuilder(
      builder: (context, _) {
        final footer = this.footer;
        final keyboardOpen = View.of(context).viewInsets.bottom > 0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    child,
                    if (footer != null && keyboardOpen) ...[
                      const SizedBox(height: 16),
                      footer,
                    ],
                  ],
                ),
              ),
            ),
            if (footer != null && !keyboardOpen)
              Padding(padding: pinnedFooterPadding, child: footer),
          ],
        );
      },
    );
  }
}
