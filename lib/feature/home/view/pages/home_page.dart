import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/resources/assets.dart';

import 'package:flutter_portfolio/core/responsive/responsive_design.dart';
import 'package:flutter_portfolio/core/routes/routes.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_font_style.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/feature/home/view/widgets/home_page_body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<NavModel> navItems = [
      NavModel(title: "About Me", path: Routes.about),
      NavModel(title: "Skills", path: Routes.skills),
      NavModel(title: "Project", path: Routes.projects),
      NavModel(title: "Contact Me", path: Routes.contact),
    ];
    return Scaffold(
      endDrawer: _isMobile(context) ? MobileDrawer(navItems: navItems) : null,
      backgroundColor: AppColors.kPrimary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            SvgPicture.asset(Assets.iconsLogo, height: 40),
            const SizedBox(width: 8),
            Text("Personal", style: FigmaTextStyles().headingH5Bold),
            const Spacer(),

            if (!_isMobile(context))
              Row(
                children: navItems
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).go(item.path);
                          },
                          child: Text(
                            item.title,
                            style: FigmaTextStyles().headingH5Semibold.copyWith(
                              fontFamily: AppFontStyle.shantellSans,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            const Spacer(),

            if (!_isMobile(context))
              SizedBox(
                width: R.w(160),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text("Resume"),
                  icon: SvgPicture.asset(Assets.iconsDownload),
                  iconAlignment: IconAlignment.end,
                ),
              ),
          ],
        ),

        actions: _isMobile(context)
            ? [
                Builder(
                  builder: (context) => Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 50,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.black,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(
                        AntDesign.menu_fold_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ]
            : [],
      ),
      body: HomePageBody(),
    );
  }

  bool _isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.navItems});

  final List<NavModel> navItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
          ...navItems.map(
            (item) => ListTile(
              title: Text(
                item.title,
                style: FigmaTextStyles().headingH5Semibold.copyWith(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                GoRouter.of(context).go(item.path);
              },
            ),
          ),
          Divider(),

          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {},
              label: const Text("Resume"),
              icon: SvgPicture.asset(
                Assets.iconsDownload,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              iconAlignment: IconAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}

class NavModel {
  final String title;
  final String path;

  NavModel({required this.title, required this.path});
}

// class NavItems {
//   static List<NavModel> navItems = [
//     NavModel(title: "About Me", path: Routes.about),
//     NavModel(title: "Skills", path: Routes.skills),
//     NavModel(title: "Project", path: Routes.projects),
//     NavModel(title: "Contact Me", path: Routes.contact),
//   ];
// }
