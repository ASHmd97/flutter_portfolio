import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/widget/responsive_widget.dart';
import 'package:flutter_portfolio/feature/home/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/projects/project_card.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/projects/projects_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        color: AppColors.black,
        child: Column(
          children: [
            const ProjectsTitle(),
            const SizedBox(height: 28),
            ProjectCard(project: ksShowcaseProjects[0]),
            ProjectCard(project: ksShowcaseProjects[1]),
            ProjectCard(project: ksShowcaseProjects[2]),
          ],
        ),
      ),
      tablet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        color: AppColors.black,
        child: Column(
          children: [
            const ProjectsTitle(),
            const SizedBox(height: 28),
            ProjectCard(project: ksShowcaseProjects[0]),
            ProjectCard(project: ksShowcaseProjects[1]),
            ProjectCard(project: ksShowcaseProjects[2]),
          ],
        ),
      ),
      desktop: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        color: AppColors.black,
        child: Column(
          children: [
            const ProjectsTitle(),
            const SizedBox(height: 28),
            ProjectCard(project: ksShowcaseProjects[0]),
            ProjectCard(project: ksShowcaseProjects[1]),
            ProjectCard(project: ksShowcaseProjects[2]),
          ],
        ),
      ),
    );
  }
}
