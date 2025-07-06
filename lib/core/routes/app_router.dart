// GoRouter configuration
import 'package:flutter_portfolio/core/routes/routes.dart';
import 'package:flutter_portfolio/core/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/feature/about_me/page/about_me_page.dart';
import 'package:flutter_portfolio/feature/home/view/pages/home_page.dart';
import 'package:flutter_portfolio/feature/project_details/view/pages/project_details_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: '${Routes.projectDetails}/:id',
          builder: (context, state) => ProjectDetailsView(
            project: ksShowcaseProjects.firstWhere(
              (p) => p.id == state.pathParameters['id'],
            ),
          ),
        ),
        GoRoute(path: Routes.about, builder: (context, state) => AboutMePage()),
      ],
    ),
  ],
);
