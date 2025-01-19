import 'package:brainstock/core/theme/app_theme.dart';
import 'package:brainstock/features/screen/presentation/pages/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrainStock',
      theme: AppTheme.lightTheme,
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Screen();
  }
}
