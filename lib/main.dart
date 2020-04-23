import 'package:flutter/material.dart';

void main() {
  runApp(BajatApp());
}

/// Main Application.
// ignore: use_key_in_widget_constructors
class BajatApp extends StatelessWidget {
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
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

/// Homepage for the app.
class HomePage extends StatelessWidget {
  // ignore: public_member_api_docs
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
