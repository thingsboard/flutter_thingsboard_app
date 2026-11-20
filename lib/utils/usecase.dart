// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

abstract class UseCase<Output, Input> {
  const UseCase();

  Output call(Input params);
}

class NoParams {
  const NoParams();
}
