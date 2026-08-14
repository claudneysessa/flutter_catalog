import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

/// ! The original app advertised the original author's own apps. Since this is
/// ! the 2026 revival, the list now points to the maintainer's own projects.
class MyOtherAppsExample extends StatelessWidget {
  const MyOtherAppsExample({super.key});

  static const _projects = <_OtherProject>[
    _OtherProject(
      title: 'Flutter Playground',
      subtitle: 'Playground app with examples to learn and tinker with Flutter.',
      icon: Icons.science_outlined,
      repoUrl: 'https://github.com/claudneysessa/flutter-playground',
      siteUrl: 'https://claudneysessa.github.io/flutter-playground/',
    ),
    _OtherProject(
      title: 'Flutter UI Challenges',
      subtitle: 'A collection of UI challenges implemented in Flutter.',
      icon: Icons.palette_outlined,
      repoUrl: 'https://github.com/claudneysessa/flutter-ui-challenges',
      siteUrl: 'https://claudneysessa.github.io/flutter-ui-challenges/',
    ),
    _OtherProject(
      title: 'PayGO SDK',
      subtitle:
          'Flutter SDK for commercial automation with PayGO Integrado (URI + Android Intent).',
      icon: Icons.point_of_sale_outlined,
      repoUrl: 'https://github.com/claudneysessa/paygo_sdk',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Divider(),
        for (final project in _projects) ...[
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(project.icon),
                  title: Text(project.title),
                  subtitle: Text(project.subtitle),
                ),
                ListTile(
                  leading: const Icon(CommunityMaterialIcons.github),
                  title: const Text('View on GitHub'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () => launchUrl(Uri.parse(project.repoUrl)),
                ),
                if (project.siteUrl != null)
                  ListTile(
                    leading: const Icon(Icons.open_in_browser),
                    title: const Text('Open the live demo'),
                    trailing: const Icon(Icons.open_in_new),
                    onTap: () => launchUrl(Uri.parse(project.siteUrl!)),
                  ),
              ],
            ),
          ),
          const Divider(),
        ],
        Card(
          child: ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('All projects by $MAINTAINER_NAME'),
            subtitle: const Text(MAINTAINER_GITHUB_URL),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => launchUrl(Uri.parse(MAINTAINER_GITHUB_URL)),
          ),
        ),
      ],
    );
  }
}

class _OtherProject {
  const _OtherProject({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.repoUrl,
    this.siteUrl,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String repoUrl;
  final String? siteUrl;
}
