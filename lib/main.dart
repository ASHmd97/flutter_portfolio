import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/routes/app_router.dart';
import 'package:flutter_portfolio/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      routerConfig: goRouter,
    );
  }
}
