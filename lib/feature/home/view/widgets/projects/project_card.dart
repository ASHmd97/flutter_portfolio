import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/responsive/responsive.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/home/data/configs/configs.dart';
import 'package:flutter_portfolio/feature/home/data/models/showcase_project.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectCard extends StatelessWidget {
  final ShowcaseProject project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    bool isOod = ksShowcaseProjects.indexOf(project) % 2 == 0;
    return Responsive.isDesktop(context) || Responsive.isTablet(context)
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            height: Responsive.isDesktop(context) ? 500 : 400,
            child: isOod
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: ProjectImage(project: project)),
                      const SizedBox(width: 24),
                      Expanded(child: ProjectInfo(project: project)),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: ProjectInfo(project: project)),
                      const SizedBox(width: 24),
                      Expanded(child: ProjectImage(project: project)),
                    ],
                  ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  project.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),
              ProjectInfo(project: project),
            ],
          );
  }
}

class ProjectImage extends StatelessWidget {
  const ProjectImage({super.key, required this.project});

  final ShowcaseProject project;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      project.image,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({super.key, required this.project});

  final ShowcaseProject project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '0${ksShowcaseProjects.indexOf(project) + 1}',
          style: FigmaTextStyles().displaytextExtraBold.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          project.title,
          style: FigmaTextStyles().headingH2Bold.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 28),
        Text(
          project.shortDescription,
          style: FigmaTextStyles().paragraphP2Regular.copyWith(
            color: AppColors.zinc500,
          ),
        ),
        const SizedBox(height: 28),
        SvgPicture.asset('assets/icons/export.svg'),
      ],
    );
  }
}
