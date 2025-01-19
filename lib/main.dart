import 'package:brainstock/config/routes/routes_names.dart';
import 'package:brainstock/core/theme/app_theme.dart';
import 'package:brainstock/views/screen/presentation/pages/screen.dart';
import 'package:flutter/material.dart';

import 'config/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrainStock',
      theme: AppTheme.lightTheme,
      initialRoute: RoutesNames.mainScreen,
      onGenerateRoute: Routes.generateRoutes,
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
