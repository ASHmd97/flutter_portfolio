import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/widget/responsive_widget.dart';
import 'package:flutter_portfolio/feature/home/data/const_data/about_data.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/about_me/about_me_desktop.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/about_me/about_me_mobile.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/about_me/about_me_tablet.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: AboutMeMobile(aboutMeParagraphList: aboutMeParagraphList),
      tablet: AboutMeTablet(aboutMeParagraphList: aboutMeParagraphList),
      desktop: AboutMeDesktop(aboutMeParagraphList: aboutMeParagraphList),
    );
  }
}
