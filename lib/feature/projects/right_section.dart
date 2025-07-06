import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/data/models/showcase_project.dart';
import 'package:flutter_portfolio/core/routes/routes.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class RightSection extends StatelessWidget {
  final List<ShowcaseProject> projects;

  const RightSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Crafted With', style: FigmaTextStyles().displaytextExtraBold),
        Text(
          'Here are a selection of my recent',
          style: FigmaTextStyles().paragraphP2Regular,
        ),
        const SizedBox(height: 32),
        ...projects.map(
          (project) => ProjectRightItem(
            number: '0${projects.indexOf(project) + 1}',
            title: project.title,
            shortDescription: project.shortDescription,
            onPress: () {
              GoRouter.of(context).go('${Routes.projectDetails}/${project.id}');
            },
          ),
        ),
      ],
    );
  }
}

class ProjectRightItem extends StatelessWidget {
  final String title;
  final String shortDescription;
  final String number;
  final VoidCallback onPress;
  const ProjectRightItem({
    super.key,
    required this.number,
    required this.title,
    required this.shortDescription,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 16),
      height: 140,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 5,
            child: Text(
              number,
              style: FigmaTextStyles().displaytextExtraBold.copyWith(
                fontSize: 100,
                color: AppColors.kSecondary,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FigmaTextStyles().paragraphP1Extrabold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                Text(
                  shortDescription,
                  style: FigmaTextStyles().paragraphP2Regular,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: CustomButton(
              label: 'View Project',
              onPressed: onPress,
              icon: Icons.arrow_right_alt_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
