import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/data/models/showcase_project.dart';
import 'package:flutter_portfolio/core/widget/responsive_widget.dart';
import 'package:flutter_portfolio/core/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/feature/projects/left_section.dart';
import 'package:flutter_portfolio/feature/projects/right_section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ShowcaseProject> projects = ksShowcaseProjects.sublist(0, 3);
    return ResponsiveWidget(
      mobile: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: RightSection(projects: projects),
      ),
      tablet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        height: MediaQuery.of(context).size.height - 70,
        child: Row(
          children: [
            LeftSection(projects: projects),
            const SizedBox(width: 30),
            Expanded(child: RightSection(projects: projects)),
          ],
        ),
      ),
      desktop: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        height: MediaQuery.of(context).size.height - 70,
        child: Row(
          children: [
            LeftSection(projects: projects),
            const SizedBox(width: 40),
            Expanded(child: RightSection(projects: projects)),
          ],
        ),
      ),
    );
  }
}
