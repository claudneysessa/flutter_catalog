import 'package:community_material_icon/community_material_icon.dart';
// ! `EmailAuthProvider`/`AuthProvider` exist in both firebase_auth and
// ! firebase_ui_auth, hide the firebase_auth ones so that the UI providers are
// ! the ones in scope.
import 'package:firebase_auth/firebase_auth.dart'
    hide AuthProvider, EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ! Since riverpod 3.x, `StateProvider` lives in the `legacy` library.
import 'package:flutter_riverpod/legacy.dart';

import '../constants.dart';

/// ! We use riverpod to watch the login state change, and rebuild screen.
/// ! For more details see the riverpod example.
final currentUserStreamProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges());

final currentUserProvider = StateProvider<User?>((ref) {
  return ref.watch(currentUserStreamProvider).maybeWhen(
        data: (user) => user,
        orElse: () => null,
      );
});

/// ! The `flutterfire_ui` package was discontinued and split into
/// ! `firebase_ui_auth` + `firebase_ui_oauth_*`. Provider *configurations* are
/// ! now provider *instances*.
final kLoginProviders = <AuthProvider>[
  GoogleProvider(
    //! The clientId is copied from the app's Firebase console.
    clientId:
        '785184947614-k4q21aq3rmasodkrj5gjs9qtqtkp89tt.apps.googleusercontent.com',
  ),
  EmailAuthProvider(),
];

class FlutterFireLoginUiExample extends ConsumerWidget {
  const FlutterFireLoginUiExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserStreamProvider).when(
          data: (user) =>
              user == null ? _buildLoginScreen() : _buildProfileScreen(),
          error: (e, _) => Text(e.toString()),
          loading: () => const LinearProgressIndicator(),
        );
  }

  Widget _buildLoginScreen() {
    /// This SignInScreen comes from the Firebase UI package.
    return SignInScreen(
      providers: kLoginProviders,
      headerBuilder: (_, __, ___) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: kAppIcon,
      ),
      // ! Currently there's no provider for anonymous sign in, so we add a btn
      // ! ourselves.
      footerBuilder: (context, _) {
        return ElevatedButton.icon(
          icon: const Icon(CommunityMaterialIcons.incognito),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
          label: const Text('Log in anonymously'),
          onPressed: FirebaseAuth.instance.signInAnonymously,
        );
      },
    );
  }

  Widget _buildProfileScreen() {
    return ProfileScreen(
      providers: kLoginProviders,
      children: const [
        Text(
            '🚀We could add more content to the profile screen via the `children` param.')
      ],
    );
  }
}
