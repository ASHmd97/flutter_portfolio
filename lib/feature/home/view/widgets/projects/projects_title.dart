import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';

class ProjectsTitle extends StatelessWidget {
  const ProjectsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'My ',
          style: isDesktop
              ? FigmaTextStyles().displaytextRegular.copyWith(
                  color: Colors.white,
                )
              : FigmaTextStyles().displaytextMRegular.copyWith(
                  color: Colors.white,
                ),
        ),
        Text(
          'Projects',
          style: isDesktop
              ? FigmaTextStyles().displaytextExtraBold.copyWith(
                  color: Colors.white,
                )
              : FigmaTextStyles().displaytextMExtraBold.copyWith(
                  color: Colors.white,
                ),
        ),
      ],
    );
  }
}
