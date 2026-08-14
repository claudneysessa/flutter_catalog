# Change Log

## v4.0.0 — 2026 revival
[2026-08-14]

Migration from Flutter 3.7.5 / Dart 2.19 to **Flutter 3.44.6 / Dart 3.12.2**,
by [Claudney Sarti Sessa](https://github.com/claudneysessa). The project no
longer resolved its dependencies and had 117 compilation errors behind them.

### Toolchain

- Gradle 7.2 → **8.14.3**; Android Gradle Plugin 7.1.3 → **8.13.0**; Kotlin
  1.9.10 → **2.2.20**; Java/JVM target 8 → **17**.
- Android build migrated from Groovy to the **Kotlin DSL** and from the legacy
  `apply from: flutter.gradle` to the declarative `pluginManagement` /
  `plugins {}` block (`settings.gradle.kts`).
- `compileSdk`/`targetSdk` 34 → **36**, `minSdk` 21 → **24**, `namespace` added,
  obsolete `dexOptions`/`lintOptions`/`jcenter()` and the okhttp/exifinterface
  `resolutionStrategy` hacks removed.
- `AndroidManifest.xml`: removed the `package` attribute (rejected by AGP 8),
  `USE_FINGERPRINT` → `USE_BIOMETRIC`, `WRITE_EXTERNAL_STORAGE` replaced by the
  granular `READ_MEDIA_*` permissions, `NormalTheme` meta-data and a `<queries>`
  block added for `url_launcher`/`share_plus`.
- `kotlin.incremental=false`: the pub cache and the project live on different
  drives, which breaks Kotlin's relocatable incremental caches.
- R8 keep rules added for the optional ML Kit text-recognition scripts.

### Dependencies

- **Firebase 2.x → 4.x** (`firebase_core` 2.32 → 4.13, `firebase_auth` 4.16 →
  6.5, `cloud_firestore` 4.17 → 6.8, `firebase_analytics` 10 → 12,
  `firebase_crashlytics` 3 → 5, `firebase_database` 10 → 12, `firebase_storage`
  11 → 13). The whole stack was pinned two majors behind by `flutterfire_ui`.
- `flutterfire_ui` (discontinued) → **`firebase_ui_auth` + `firebase_ui_oauth_google`**.
- `flutter_markdown` (discontinued) → **`flutter_markdown_plus`**.
- `hive` / `hive_flutter` / `hive_generator` (unmaintained, blocked on
  `analyzer` <7) → **`hive_ce` / `hive_ce_flutter` / `hive_ce_generator`**.
- `google_ml_kit` umbrella package → the four feature packages actually used
  (`barcode_scanning`, `face_detection`, `image_labeling`, `text_recognition`).
  **Release APK: 334 MB → 196 MB.**
- `animated_radial_menu` **vendored** under `packages/`: upstream pins
  `font_awesome_flutter` 9.x, which no longer compiles against the now-`final`
  `IconData` class.
- Removed: `edge_detection` (unmaintained Android build), the deprecated
  `heatmap_calendar` git dependency, `material_buttonx` (reads the removed
  `TextTheme.headline6`) and the redundant `*_web` Firebase packages.
- `chat_gpt_sdk` 2.0.0 → 3.1.6, `riverpod`/`flutter_riverpod` 2.x → 3.4,
  `fl_chart` → 1.x, `flutter_bloc` → 9.x, `super_editor` → 0.3.0-dev,
  `share_plus` → 13.x, `local_auth` → 3.x, `extended_image` → 10.x.

### Code

- Riverpod 3: `ChangeNotifierProvider`, `StateProvider` and
  `StateNotifierProvider` moved to `package:flutter_riverpod/legacy.dart`.
- `ThemeData.toggleableActiveColor` / `backgroundColor` / `errorColor` removed —
  replaced by `ColorScheme` values and by the checkbox/switch/radio component
  themes.
- `ButtonBar` → `OverflowBar`, `Color.withOpacity` → `withValues`,
  `showBottomSheet<T>` type argument dropped.
- `super_editor`: `DocumentEditor` → `Editor` + `createDefaultDocumentEditor`,
  `MutableDocumentComposer`, positional `AttributedText`.
- `fl_chart`: `tooltipBgColor` → `getTooltipColor` callback.
- `graphview`: `FruchtermanReingoldAlgorithm` now takes a
  `FruchtermanReingoldConfiguration`.
- `local_auth`: `AuthenticationOptions` flattened into named parameters.
- `share_plus`: `Share.shareWithResult`/`shareXFiles` →
  `SharePlus.instance.share(ShareParams(...))`.
- `extended_image`: `rotate(right: false)` → `rotate(degree: -90)`.
- `chat_gpt_sdk`: `CTResponse` → `CompleteResponse`, `onCompleteStream` →
  `onCompletionSSE`, `Model` object instead of a raw model string.
- Freezed regenerated with 3.x; dead `myapistate.*` files removed.

### Project

- **Test suite added** — 18 unit and widget tests covering routing table
  integrity (unique route names, existing source files, valid links), the light
  and dark themes and a set of example widgets.
- Every link that pointed at the original repository now points at this fork.
- The About screen gained a **Credits** section naming the original author
  (X.Wei) and the fork maintainer, and "My Other Apps" now lists the
  maintainer's own projects.
- README rewritten with badges, previews captured on a physical Android 16
  tablet, a before/after toolchain table and the maintainers section.

## v3.7.0
[2023-09-18]
- update app icon to resolve trademark issue(#144)
- upgrade to latest package version and build with flutter 3.13.4

## v3.6.0
[2023-04-02]
- Add ChatGPT example
- Remember last-opened tab
- Show new routes badge at tab level
- Upgrade pacakges and built with Flutter 3.7.9

## v3.5.3
[2023-01-17]
- Add new heatmap calendar example
- Add like button example
- Add youtube player example

## v3.5.2
[2022-12-11]
- add StoreSecretsExample example on how to store secrets
- store ad unit ids in (git-ignored) .env file

## v3.5.1
[2022-12-05]
- add In-App-Purchase (IAP) example
- manage user-Purchases with firstore/riverpod
- add device_preview example
- add Grey App example: R.I.P. for Elder.

## v3.4.0
[2022-11-06]
- Add new "In-Action" tab to home page.
- Add new examples:
  - `IntroScreenExample`
  - `WhatsNewExample`
  - `InAppReviewExample`
  - `SharePlusExample`
  - `MyOtherAppsExample`
- Update Ads demo
  - add option to turn on/off the Ads personalization
  - display number of rewarded coins in RewaredAds demo

## v3.3.0
[2022-10-23]
- better source code syntax highlighting with [widget_with_codeview v3.0.1](https://pub.dev/packages/widget_with_codeview)
- migrate to dart 2.17
- add `TypographyExample`
- add option to change code theme for `CodeHighlightExample`
- other improvements and fixups

## v3.2.0
[2022-10-21]
- add monetization examples
  - banner ads
  - interstitial ads
  - rewarded ads
- add `FlutterFireLoginUiExample`
- add `SelectableExample`
- add crashlytics and analytics event logging
- upgrade packages & fix firestore error