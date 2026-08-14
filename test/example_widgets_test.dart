import 'package:flutter/material.dart';
import 'package:flutter_catalog/routes/layouts_wrap_ex.dart';
import 'package:flutter_catalog/routes/lists_expansion_tile_ex.dart';
import 'package:flutter_catalog/routes/widgets_icon_ex.dart';
import 'package:flutter_catalog/routes/widgets_text_ex.dart';
import 'package:flutter_catalog/routes/widgets_typography_ex.dart';
import 'package:flutter_catalog/themes.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) =>
    MaterialApp(theme: kLightTheme, home: Scaffold(body: child));

void main() {
  group('example widgets render', () {
    testWidgets('TypographyExample lists every text style', (tester) async {
      await tester.pumpWidget(_host(const TypographyExample()));
      expect(find.text('headline1'), findsOneWidget);
      expect(find.text('bodyText2'), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('TextExample renders its sample text', (tester) async {
      await tester.pumpWidget(_host(const TextExample()));
      expect(find.text('Simple text demo.'), findsOneWidget);
    });

    testWidgets('IconExample renders a single icon', (tester) async {
      await tester.pumpWidget(_host(const IconExample()));
      expect(find.byIcon(Icons.image), findsOneWidget);
    });

    testWidgets('WrapExample renders one chip per name', (tester) async {
      await tester.pumpWidget(_host(const WrapExample()));
      expect(find.byType(Chip), findsNWidgets(7));
      expect(find.text('Lebesgue'), findsOneWidget);
    });

    testWidgets('ExpansionTileExample reveals its sections on tap',
        (tester) async {
      await tester.pumpWidget(_host(const ExpansionTileExample()));
      expect(find.text('Chapter A'), findsOneWidget);
      expect(find.text('Section A1'), findsNothing);
      await tester.tap(find.text('Chapter A'));
      await tester.pumpAndSettle();
      expect(find.text('Section A1'), findsOneWidget);
    });
  });
}
