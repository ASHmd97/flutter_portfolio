import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/data/models/showcase_project.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';

class LeftSection extends StatelessWidget {
  final List<ShowcaseProject> projects;
  const LeftSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 60),
          ProjectLeftItem(
            image: projects[0].image,
            number: '01',
            marginLeft: 0,
            marginRight: 40,
          ),
          ProjectLeftItem(
            image: projects[1].image,
            number: '02',
            marginLeft: 60,
            marginRight: 0,
          ),
          ProjectLeftItem(
            image: projects[2].image,
            number: '03',
            marginLeft: 0,
            marginRight: 40,
          ),
        ],
      ),
    );
  }
}

class ProjectLeftItem extends StatelessWidget {
  final String number;
  final String image;
  final double marginLeft;
  final double marginRight;
  const ProjectLeftItem({
    super.key,
    required this.number,
    required this.image,
    required this.marginLeft,
    required this.marginRight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          bottom: 20,
          top: 20,
        ),

        decoration: BoxDecoration(
          color: AppColors.kSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: Text(
                    number,
                    style: FigmaTextStyles().displaytextExtraBold.copyWith(
                      fontSize: 80,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Opacity(
              opacity: 0.5,
              child: Image.asset(image, height: 200, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
