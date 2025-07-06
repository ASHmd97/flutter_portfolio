import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/core/widget/responsive_widget.dart';
import 'package:flutter_svg/svg.dart';

class SkillCard extends StatelessWidget {
  final String skillName;
  final String image;
  const SkillCard({super.key, required this.skillName, required this.image});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: SkillCardMobile(skillName: skillName, image: image),
      tablet: SkillCardTablet(skillName: skillName, image: image),
      desktop: SkillCardDesktop(skillName: skillName, image: image),
    );
  }
}

class SkillCardDesktop extends StatelessWidget {
  final String skillName;
  final String image;
  const SkillCardDesktop({
    super.key,
    required this.skillName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(image, height: 70, width: 70),
          Text(
            skillName,
            style: FigmaTextStyles().headingH5Semibold.copyWith(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCardMobile extends StatelessWidget {
  final String skillName;
  final String image;
  const SkillCardMobile({
    super.key,
    required this.skillName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(image, height: 60, width: 60),
          Text(
            skillName,
            style: FigmaTextStyles().paragraphP2Semibold.copyWith(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCardTablet extends StatelessWidget {
  final String skillName;
  final String image;
  const SkillCardTablet({
    super.key,
    required this.skillName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(image, height: 60, width: 60),
          Text(
            skillName,
            style: FigmaTextStyles().paragraphP3Semibold.copyWith(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
