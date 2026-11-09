// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' show Bidi;

/// The direction of user content (names, titles), like the web UI's
/// `dir="auto"`: the first strong character decides, else the layout.
TextDirection contentDirection(BuildContext context, String? text) {
  if (text != null && Bidi.startsWithRtl(text)) return TextDirection.rtl;
  if (text != null && Bidi.startsWithLtr(text)) return TextDirection.ltr;
  return Directionality.of(context);
}

/// The layout's start side as an absolute alignment, so content in the other
/// direction still lines up with the rest of the layout.
TextAlign layoutStart(BuildContext context) =>
    Directionality.of(context) == TextDirection.rtl
    ? TextAlign.right
    : TextAlign.left;

/// The layout's end side as an absolute alignment, see [layoutStart].
TextAlign layoutEnd(BuildContext context) =>
    Directionality.of(context) == TextDirection.rtl
    ? TextAlign.left
    : TextAlign.right;
