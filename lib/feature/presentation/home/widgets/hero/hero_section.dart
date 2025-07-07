import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_font_style.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_colors.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_sizes.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/feature/presentation/projects/widgets/animated_text_slide_box_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_portfolio/core/resources/assets.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/core/widget/outlined_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return isDesktop ? const HeroSectionDesktop() : const HeroSectionMobile();
  }
}

// ============================
// ========== DESKTOP =========
// ============================

class HeroSectionDesktop extends StatelessWidget {
  const HeroSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: MediaQuery.of(context).size.height - 80,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Stack(
          children: [
            const HeroText(),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                Assets.iconsHero,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(left: 0, bottom: 0, child: const SocialIcons()),
          ],
        ),
      ),
    );
  }
}

// ============================
// ========== MOBILE ==========
// ============================

class HeroSectionMobile extends StatelessWidget {
  const HeroSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.iconsHero,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 32),
          const HeroText(),
          const SizedBox(height: 32),
          const SocialIcons(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ============================
// ========== TEXT ============
// ============================

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    final textWidth = isDesktop
        ? MediaQuery.of(context).size.width * 0.4
        : double.infinity;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Hello I’m ',
              style: isDesktop
                  ? FigmaTextStyles().displaytextRegular
                  : FigmaTextStyles().displaytextMRegular,
            ),
            Text(
              'Ahmed Safwat.',
              style: isDesktop
                  ? FigmaTextStyles().displaytextExtraBold
                  : FigmaTextStyles().displaytextMExtraBold,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Flutter ',
              style: isDesktop
                  ? FigmaTextStyles().displaytextExtraBold
                  : FigmaTextStyles().displaytextMExtraBold,
            ),
            OutlinedText(text: 'Developer'),
          ],
        ),
        Row(
          children: [
            Text(
              'Based In ',
              style: isDesktop
                  ? FigmaTextStyles().displaytextRegular
                  : FigmaTextStyles().displaytextMRegular,
            ),
            Text(
              'Egypt.',
              style: isDesktop
                  ? FigmaTextStyles().displaytextExtraBold
                  : FigmaTextStyles().displaytextMExtraBold,
            ),
          ],
        ),
        const SizedBox(height: 38),
        SizedBox(
          width: textWidth,
          child: Text(
            'Flutter Developer with strong experience in building high-performance, cross-platform mobile applications. Proficient in Agile methodologies, Clean Architecture, and CI/CD implementation. Skilled in state management, API integration, and app performance optimization, I want to work in an environment where I can learn, grow, and add value.',
            style: FigmaTextStyles().paragraphP2Regular,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

// ============================
// ========== ICONS ===========
// ============================

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Bootstrap.facebook)),
        const SizedBox(width: 10),
        IconButton.outlined(onPressed: () {}, icon: Icon(Bootstrap.linkedin)),
        const SizedBox(width: 10),
        IconButton.outlined(onPressed: () {}, icon: Icon(Bootstrap.github)),
      ],
    );
  }
}
