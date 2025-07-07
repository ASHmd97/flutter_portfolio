import 'package:flutter/material.dart';

import 'package:flutter_portfolio/core/extensions/extensions.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:go_router/go_router.dart';

import 'subviews/project_list_page.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kSecondary,
        automaticallyImplyLeading: false,

        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Projects',
                style: FigmaTextStyles().headingH1Extrabold.copyWith(
                  color: AppColors.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.kSecondary,
                ),
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
      body: const <Widget>[ProjectListPage()].addListView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
