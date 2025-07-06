import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/core/widget/responsive_widget.dart';
import 'package:flutter_portfolio/core/data/const_data/about_data.dart';
import 'package:flutter_portfolio/feature/about_me/about_me_desktop.dart';
import 'package:flutter_portfolio/feature/about_me/about_me_mobile.dart';
import 'package:flutter_portfolio/feature/about_me/about_me_tablet.dart';
import 'package:go_router/go_router.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimary,
        automaticallyImplyLeading: false,

        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About Me',
                style: FigmaTextStyles().headingH1Extrabold.copyWith(
                  color: AppColors.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
      body: ResponsiveWidget(
        mobile: AboutMeMobile(aboutMeParagraphList: aboutMeParagraphList),
        tablet: AboutMeTablet(aboutMeParagraphList: aboutMeParagraphList),
        desktop: AboutMeDesktop(aboutMeParagraphList: aboutMeParagraphList),
      ),
    );
  }
}
