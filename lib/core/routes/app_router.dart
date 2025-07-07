// GoRouter configuration
import 'package:flutter_portfolio/core/routes/routes.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/feature/presentation/about_me/page/about_me_page.dart';
import 'package:flutter_portfolio/feature/presentation/contact_me/contact_me_view.dart';
import 'package:flutter_portfolio/feature/presentation/home/pages/home_page.dart';
import 'package:flutter_portfolio/feature/presentation/project_details/pages/project_details_page.dart';
import 'package:flutter_portfolio/feature/presentation/projects/projects_view.dart';
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
        GoRoute(
          path: Routes.contactMe,
          builder: (context, state) => ContactMeView(),
        ),

        GoRoute(
          path: Routes.projects,
          builder: (context, state) => ProjectsView(),
          routes: [
            GoRoute(
              path: '${Routes.projectDetails}/:id',
              builder: (context, state) => ProjectDetailsView(
                project: ksShowcaseProjects.firstWhere(
                  (p) => p.id == state.pathParameters['id'],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
