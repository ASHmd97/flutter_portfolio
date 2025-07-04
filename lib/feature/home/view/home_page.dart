import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/resources/assets.dart';

import 'package:flutter_portfolio/core/responsive/responsive_design.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navItems = ['About Me', 'Skills', 'Project', 'Contact Me'];
    return Scaffold(
      endDrawer: _isMobile(context)
          ? Drawer(
              backgroundColor: AppColors.backgroundDark,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ...navItems.map((item) => ListTile(title: Text(item))),
                ],
              ),
            )
          : null,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            SvgPicture.asset(Assets.iconsLogo, height: 40),
            SizedBox(width: 8),
            Text("Personal", style: FigmaTextStyles().headingH5Bold),

            Spacer(),
            if (!_isMobile(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: navItems
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            item,
                            style: FigmaTextStyles().headingH5Semibold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),

            Spacer(),
            if (!_isMobile(context))
              SizedBox(
                width: R.w(160),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Resume"),
                  icon: SvgPicture.asset(Assets.iconsDownload),
                  iconAlignment: IconAlignment.end,
                ),
              ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black), // hamburger icon
      ),
      body: Center(child: Text("Body Content")),
    );
  }

  bool _isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;
}
