import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/resources/assets.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/about_me/about_me_title.dart';
import 'package:flutter_svg/svg.dart';

class AboutMeTablet extends StatelessWidget {
  final List<String> aboutMeParagraphList;

  const AboutMeTablet({super.key, required this.aboutMeParagraphList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SvgPicture.asset(Assets.iconsAboutMe, fit: BoxFit.contain),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutMeTitle(),
                ...aboutMeParagraphList.map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 0,
                    ),
                    child: Text(
                      e,
                      style: FigmaTextStyles().paragraphP2Regular.copyWith(
                        color: AppColors.zinc500,
                      ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
