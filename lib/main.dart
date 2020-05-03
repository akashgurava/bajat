import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './config/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const BajatApp());
}

/// Main Application.
class BajatApp extends StatelessWidget {
  // ignore: public_member_api_docs
  const BajatApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bajat',
      theme: ThemeData(
        brightness: Brightness.light,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      // Use this instead of home so that we get the modal effect
      // for home screen
      onGenerateRoute: router,
    );
  }
}
