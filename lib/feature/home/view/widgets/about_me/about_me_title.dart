import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';

class AboutMeTitle extends StatelessWidget {
  const AboutMeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'About ',
          style: isDesktop
              ? FigmaTextStyles().displaytextRegular
              : FigmaTextStyles().displaytextMRegular,
        ),
        Text(
          'Me',
          style: isDesktop
              ? FigmaTextStyles().displaytextExtraBold
              : FigmaTextStyles().displaytextMExtraBold,
        ),
      ],
    );
  }
}
