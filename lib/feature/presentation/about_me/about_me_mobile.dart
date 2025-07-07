import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/resources/assets.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/presentation/about_me/about_me_title.dart';
import 'package:flutter_svg/svg.dart';

class AboutMeMobile extends StatelessWidget {
  final List<String> aboutMeParagraphList;
  const AboutMeMobile({super.key, required this.aboutMeParagraphList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            SvgPicture.asset(Assets.iconsAboutMe, fit: BoxFit.contain),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutMeTitle(),
                ...aboutMeParagraphList.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 0,
                    ),
                    child: Text(
                      e,
                      style: FigmaTextStyles().paragraphP2Regular.copyWith(
                        color: AppColors.zinc500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
