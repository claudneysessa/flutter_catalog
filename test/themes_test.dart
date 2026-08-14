import 'package:flutter/material.dart';
import 'package:flutter_catalog/themes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('themes', () {
    test('light theme keeps the brand colors', () {
      expect(kLightTheme.brightness, Brightness.light);
      expect(kLightTheme.colorScheme.primary, const Color(0xFF0175c2));
      expect(kLightTheme.colorScheme.secondary, const Color(0xFF13B9FD));
      expect(kLightTheme.colorScheme.error, const Color(0xFFB00020));
    });

    test('dark theme keeps the brand colors', () {
      expect(kDarkTheme.brightness, Brightness.dark);
      expect(kDarkTheme.colorScheme.primary, const Color(0xFF0175c2));
      expect(kDarkTheme.colorScheme.secondary, const Color(0xFF13B9FD));
      expect(kDarkTheme.colorScheme.error, const Color(0xFFB00020));
    });

    // `ThemeData.toggleableActiveColor` was removed from Flutter; the colour is
    // now carried by the individual component themes.
    test('selection colour moved to the toggleable component themes', () {
      const selected = <WidgetState>{WidgetState.selected};
      expect(kLightTheme.checkboxTheme.fillColor?.resolve(selected),
          const Color(0xFF1E88E5));
      expect(kLightTheme.switchTheme.thumbColor?.resolve(selected),
          const Color(0xFF1E88E5));
      expect(kLightTheme.radioTheme.fillColor?.resolve(selected),
          const Color(0xFF1E88E5));
      expect(kDarkTheme.checkboxTheme.fillColor?.resolve(selected),
          const Color(0xFF6997DF));
    });

    testWidgets('both themes can build a MaterialApp', (tester) async {
      for (final theme in [kLightTheme, kDarkTheme]) {
        await tester.pumpWidget(
          MaterialApp(theme: theme, home: const Scaffold(body: Text('hi'))),
        );
        expect(find.text('hi'), findsOneWidget);
      }
    });
  });
}
