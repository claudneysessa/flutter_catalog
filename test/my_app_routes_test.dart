import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/my_app_routes.dart';
import 'package:flutter_catalog/my_route.dart';
import 'package:flutter_test/flutter_test.dart';

/// Integrity checks over the routing table. The table is hand-written and every
/// entry points at a source file that is shipped as an asset and rendered in
/// the "Code" tab, so a typo there is only visible at runtime.
void main() {
  group('routing table', () {
    test('has all three home tabs populated', () {
      expect(kMyAppRoutesBasic, isNotEmpty);
      expect(kMyAppRoutesAdvanced, isNotEmpty);
      expect(kMyAppRoutesInAction, isNotEmpty);
    });

    test('kAllRoutes is the flattened list of every group', () {
      final groupedRoutes = <MyRoute>[
        for (final group in kAllRouteGroups) ...group.routes,
      ];
      expect(kAllRoutes.length, groupedRoutes.length);
    });

    test('route names are unique', () {
      final names = kAllRoutes.map((route) => route.routeName).toList();
      expect(names.toSet().length, names.length,
          reason: 'duplicated route names: '
              '${names.where((n) => names.where((o) => o == n).length > 1).toSet()}');
    });

    test('every route is registered in the routing table', () {
      for (final route in kAllRoutes) {
        expect(kAppRoutingTable.containsKey(route.routeName), isTrue,
            reason: '${route.routeName} is missing from kAppRoutingTable');
      }
      // The routing table also carries the home ('/') and the about entries.
      expect(kAppRoutingTable.containsKey(Navigator.defaultRouteName), isTrue);
      expect(kAppRoutingTable.containsKey(kAboutRoute.routeName), isTrue);
      expect(kAppRoutingTable.length, kAllRoutes.length + 2);
    });

    test('every route has a non-empty title and an absolute route name', () {
      for (final route in [...kAllRoutes, kAboutRoute]) {
        expect(route.title.trim(), isNotEmpty);
        expect(route.routeName, startsWith('/'));
      }
    });

    test('every sourceFilePath points at a file that exists', () {
      for (final route in [...kAllRoutes, kAboutRoute]) {
        expect(File(route.sourceFilePath).existsSync(), isTrue,
            reason: 'missing source file for "${route.title}": '
                '${route.sourceFilePath}');
      }
    });

    test('every declared link is an absolute http(s) URL', () {
      for (final route in kAllRoutes) {
        route.links.forEach((title, url) {
          expect(title.trim(), isNotEmpty);
          final uri = Uri.tryParse(url);
          expect(uri, isNotNull, reason: 'unparseable link on ${route.title}');
          expect(uri!.hasScheme && uri.scheme.startsWith('http'), isTrue,
              reason: '"$url" on ${route.title} is not an http(s) URL');
        });
      }
    });

    test('no route still points at the abandoned upstream repository', () {
      for (final route in kAllRoutes) {
        for (final url in route.links.values) {
          expect(url, isNot(contains('X-Wei/flutter_catalog')),
              reason: '${route.title} still links to the original repository');
        }
      }
    });

    test('every route group has a name and at least one route', () {
      for (final group in kAllRouteGroups) {
        expect(group.groupName.trim(), isNotEmpty);
        expect(group.routes, isNotEmpty,
            reason: 'empty group: ${group.groupName}');
      }
    });
  });
}
