# Contributing

## Toolchain

The Flutter version is pinned in `.fvmrc` (Flutter 3.47.9, Dart 3.13). Use [FVM](https://fvm.app) or the same Flutter version:

```bash
fvm install              # installs the version from .fvmrc
fvm flutter pub get
```

## Project structure

The code is organised **feature-first**, with layers inside each feature, as described in [Flutter project structure: feature-first or layer-first?](https://codewithandrea.com/articles/flutter-project-structure/). Code shared by several features is grouped by type, as the [Flutter architecture case study](https://docs.flutter.dev/app-architecture/case-study) does for its data layer. The REST layer itself is a separate package, [`thingsboard_client`](https://github.com/thingsboard/dart_thingsboard_client), as in the [Very Good layered architecture](https://engineering.verygood.ventures/architecture/architecture/).

```
lib/
  main.dart, thingsboard_app.dart, locator.dart   app entry, root widget, get_it setup
  modules/<feature>/                               one folder per user task (alarms, devices, provisioning, ...)
  core/                                            app-wide concerns: auth and session, entity list/details base, context, logger
  config/routes/, config/themes/                   routing (one *_routes.dart per feature) and themes
  utils/services/                                  services shared by several features (client, endpoint, overlay, storage, white-labeling, ...)
  utils/, widgets/, constants/                     shared helpers, widgets and constants
  l10n/ (sources), generated/ (generated)          translations
test/                                              mirrors lib/: a test sits at the path of the file it covers
```

### Feature template

A feature has only the layers it needs:

```
modules/<feature>/
  presentation/
    view/          pages (screens)
    widgets/       widgets of this feature
    bloc/ | providers/ | controllers/   state: Blocs, Riverpod providers, page-key controllers
  application/     services of this feature (orchestration, platform integration)
  domain/
    models/        app models of this feature
    usecases/      use cases, only when they add something over calling a repository
  data/            repositories and data sources over thingsboard_client or the device
  di/              get_it registrations of this feature
```

Rules:

- Code used by one feature lives in that feature. Move it to `utils/services/` (or `core/`) only when a second feature needs it.
- Organise features around what the user does, not around screens: device provisioning is its own feature, not part of the device list.
- Do not add an empty layer "for symmetry". Most features need only `presentation/`, and a domain layer is optional (see [Flutter's recommendations](https://docs.flutter.dev/app-architecture/recommendations)).
- Keep dependencies between features few and one-way. Routing (`config/routes/`) and the app root compose the features and import them. Other shared code (`core/`, `utils/`, `widgets/`, `constants/`) should not import a feature when that is easy to avoid: move a widget, model or helper that two places need into shared code. Do not add interfaces, registries or provider overrides only to remove such an import. The known exceptions are the login notifier (`core/auth`), which starts and stops push notifications and live tracking, and the app bar and QR endpoint switch, which read the navigation shell (`modules/main`).
- Generated files (`*.g.dart`, `*.freezed.dart`) sit next to their sources.

## Generated code

Generated files are committed and CI checks they are current. After changing a `@riverpod`, `@freezed` or `@JsonSerializable` class, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Translations live in `lib/l10n/intl_<language>.arb`; `flutter gen-l10n` (also run by `flutter pub get` and builds, configured in `l10n.yaml`) generates the `S` class in `lib/generated/`. Do not edit generated files by hand. Name a file by language only (`intl_de.arb`); add a region (`intl_zh_TW.arb`) only next to the language file. ThingsBoard stores the user language as `ll_CC` (`de_DE`): when adding a language, add its code to `_tbLocaleCodes` in `lib/utils/providers/app_locale/app_locale_provider.dart`.

## Checks

CI runs these on every pull request; run them before pushing:

```bash
dart format lib test
flutter analyze        # CI fails on any info, warning or error
flutter test
```

CI does not build the app. After changing `android/`, the local `packages/`, the dependencies in `pubspec.yaml` or the Flutter version, also build it once:

```bash
flutter build apk --debug
```

The lint rules come from `package:lint` (strict) with the overrides in `analysis_options.yaml`. Fix a lint rather than silencing it; when an `// ignore:` is right, say why on the line above. To keep `git blame` useful across the formatting commit, run `git config blame.ignoreRevsFile .git-blame-ignore-revs` once.

Add a test for a bug fix where the code allows it.

## E2E tests

End-to-end tests drive the app on an Android emulator or an iOS simulator with [Patrol](https://patrol.leancode.co) and live in `patrol_test/`, one folder per suite: `smoke/` runs after every merge, `full/` (with `smoke/`) before a release. The full suite covers only critical journeys (signing in, dashboards, two-factor login, switching users, an ended session, alarms), each as a customer created for the run. It needs TOTP allowed in the server's two-factor settings. They sign in to a real server as the E2E tenant administrator, create what they need through the REST API (customers and users named `e2e-…`, the `e2e-dashboard` dashboard) and delete it afterwards.

The `E2E` workflow runs them on an Android emulator and an iOS simulator after every merge into `develop/**`, on pull requests labeled `e2e:android` or `e2e:ios` (each label runs its platform; add `e2e:full` to run the full suite with smoke) and from the Run workflow button, where the `platform` input picks Android (the default), iOS or both. Pull requests from forks are skipped, because GitHub gives them no secrets; open pull requests from a branch of this repository to run E2E.

It needs, in the repository settings:

- variable `E2E_SERVER_URL`, the server (for example `https://tbqa.cloud`);
- secrets `E2E_TENANT_EMAIL` and `E2E_TENANT_PASSWORD`, a tenant administrator on that server without two-factor login.

Until they are set, the workflow skips E2E with a warning. The tests sign in that account once per run and stop on failure without retrying, so a wrong password cannot lock the account.

To run them locally, install the Patrol CLI once (`dart pub global activate patrol_cli 4.9.0`), start an Android emulator and put the same values in a file outside the repository, for example `~/e2e_defines.json`:

```json
{
  "thingsboardApiEndpoint": "https://tbqa.cloud",
  "E2E_TENANT_EMAIL": "…",
  "E2E_TENANT_PASSWORD": "…"
}
```

```bash
patrol test --target patrol_test/smoke --dart-define-from-file=$HOME/e2e_defines.json
```

On iOS the tests run on a simulator through the `RunnerUITests` target. Boot a simulator and pass its name or identifier, and its iOS version unless it is the newest one installed:

```bash
patrol test --target patrol_test/smoke --dart-define-from-file=$HOME/e2e_defines.json --device "iPhone 17" --ios 26.5
```

Patrol starts the app by the bundle id in the `patrol:` section of `pubspec.yaml`, the default `org.thingsboard.app`, so leave `iosApplicationId` out of the file.

The dashboard is a web view, so a test checks it by waiting for the text of its widget (`e2e-ready`) through the native accessibility tree (`$.platform.mobile.waitUntilVisible`).

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
