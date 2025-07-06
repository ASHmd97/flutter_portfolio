import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_theme.dart';
import 'package:flutter_portfolio/feature/home/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/feature/home/view/pages/home_page.dart';

import 'package:flutter_portfolio/feature/project_details/view/pages/project_details_page.dart';
import 'package:go_router/go_router.dart';

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
      routerConfig: _router,
      // home: ProjectDetailsView(project: ksShowcaseProjects[0]),
      // ProjectDetailsView(project: ksShowcaseProjects[0]),
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/project/:id',
      builder: (context, state) => ProjectDetailsView(
        project: ksShowcaseProjects.firstWhere(
          (p) => p.id == state.pathParameters['id'],
        ),
      ),
    ),
  ],
);
