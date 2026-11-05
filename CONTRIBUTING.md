# Contributing

## Toolchain

The Flutter version is pinned in `.fvmrc` (Flutter 3.41.6, Dart 3.11). Use [FVM](https://fvm.app) or the same Flutter version:

```bash
fvm install              # installs the version from .fvmrc
fvm flutter pub get
```

## Generated code

Generated files are committed and CI checks they are current. After changing a `@riverpod`, `@freezed` or `@JsonSerializable` class, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Translations live in `lib/l10n/*.arb`; `lib/generated/` is generated from them by the Flutter Intl plugin (`intl_utils`). Do not edit generated files by hand.

## Checks

CI runs these on every pull request; run them before pushing:

```bash
flutter analyze
flutter test
flutter build apk --debug
```

Add a test for a bug fix where the code allows it.

## ThingsBoard client

The app talks to the server through [`thingsboard_client`](https://github.com/thingsboard/dart_thingsboard_client), the generated Dart client. Import it directly:

```dart
import 'package:thingsboard_client/thingsboard_client.dart';
```

- Generated API calls throw `DioException`; use `e.thingsboardError` for the server error and `nullIfNotFound(() => call())` where a 404 means "absent".
- Pass `extra: InterceptorConfig(ignoreErrors: true).toExtra()` (or `silentRequestExtra()`) when the screen shows the error itself, so the global error toast does not show too.
- Forward the page link's sort: `sortProperty: pageLink.sortOrder?.property, sortOrder: pageLink.sortOrder?.direction.name`.
- Do not set discriminators (`type`, `entityType`) on generated models; their builders set them.

A missing helper, an awkward API or a wrong model belongs in the client, not in a workaround here: open an issue or pull request in the client repository.

## License headers

Every hand-written Dart file in `lib/` and `test/` starts with the license header (CI checks it):

```dart
// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
```

## Commits

Use [Conventional Commits](https://www.conventionalcommits.org) (`fix: …`, `feat: …`, `refactor: …`, `chore: …`, `test: …`) and explain in the body why the change is needed.
