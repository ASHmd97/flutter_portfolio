import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_icons.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_strings.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';
import 'package:flutter_portfolio/core/widget/responsive_widget.dart';
import 'package:flutter_portfolio/feature/presentation/footer/widgets/quote_rotator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: Container(
        color: AppColors.black,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
              color: AppColors.kSecondary,
              child: QuoteRotator(quotes: ksQuotes),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ), // padding(16),

              width: double.infinity,
              child: LetsWorkWidget(isMobile: true),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: ContactInfoWidget(),
            ),
            const CopyRightRow(),
          ],
        ),
      ),
      tablet: DesktopFooter(isTablet: true),
      desktop: DesktopFooter(),
    );
  }
}

class DesktopFooter extends StatelessWidget {
  final bool isTablet;
  const DesktopFooter({super.key, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 70,
      color: AppColors.kSecondary,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),

              child: Center(child: QuoteRotator(quotes: ksQuotes)),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
              color: AppColors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LetsWorkWidget(isTablet: isTablet),
                  isTablet ? SizedBox() : Expanded(child: AnimatedLine()),
                  const SizedBox(width: 8),
                  ContactInfoWidget(),
                ],
              ),
            ),
          ),
          const CopyRightRow(),
        ],
      ),
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ksContactInfo,
          style: FigmaTextStyles().headingH2Bold.copyWith(
            color: AppColors.kSecondary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(kiMail, color: AppColors.kSecondary, size: 20),
            const SizedBox(width: 8),
            Text(
              ksWorkEmail,
              style: FigmaTextStyles().paragraphP3Regular.copyWith(
                color: AppColors.kSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(kiPhone, color: AppColors.kSecondary, size: 20),
            const SizedBox(width: 8),
            Text(
              ksWorkPhone,
              style: FigmaTextStyles().paragraphP3Regular.copyWith(
                color: AppColors.kSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Facebook.svg',
              height: 20,
              colorFilter: const ColorFilter.mode(
                AppColors.kSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              ksFacebookLinkSlash,
              style: FigmaTextStyles().paragraphP3Regular.copyWith(
                color: AppColors.kSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/GitHub.svg',
              height: 20,
              colorFilter: const ColorFilter.mode(
                AppColors.kSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              ksGithubLinkSlash,
              style: FigmaTextStyles().paragraphP3Regular.copyWith(
                color: AppColors.kSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Linkedin.svg',
              height: 20,
              colorFilter: const ColorFilter.mode(
                AppColors.kSecondary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              ksLinkedInLinkSlash,
              style: FigmaTextStyles().paragraphP3Regular.copyWith(
                color: AppColors.kSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LetsWorkWidget extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  const LetsWorkWidget({
    super.key,
    this.isMobile = false,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.end,
      children: [
        Text(
          ksLetsWork,
          style: isMobile || isTablet
              ? FigmaTextStyles().displaytextMBold.copyWith(
                  color: AppColors.kSecondary,
                )
              : FigmaTextStyles().displaytextBold.copyWith(
                  color: AppColors.kSecondary,
                ),
        ),
        const SizedBox(height: 16),
        Text(
          ksFreelanceAvailability,
          style: isMobile || isTablet
              ? FigmaTextStyles().paragraphP2Regular.copyWith(
                  color: AppColors.kSecondary,
                )
              : FigmaTextStyles().displaytextMRegular.copyWith(
                  color: AppColors.kSecondary,
                ),
        ),
      ],
    );
  }
}

class CopyRightRow extends StatelessWidget {
  const CopyRightRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    ksBuildUsing,
                    style: FigmaTextStyles().paragraphP2Regular.copyWith(
                      color: AppColors.kSecondary,
                    ),
                  ),

                  SvgPicture.asset('assets/icons/Flutter.svg', height: 20),
                  Text(
                    ksWithMuch,
                    style: FigmaTextStyles().paragraphP2Regular.copyWith(
                      color: AppColors.kSecondary,
                    ),
                  ),
                  Icon(kiHeart, color: Colors.red, size: 20),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    ksCC,
                    style: FigmaTextStyles().paragraphP2Regular.copyWith(
                      color: AppColors.kSecondary,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/my_signature.svg',
                    height: 40,
                    colorFilter: const ColorFilter.mode(
                      AppColors.kSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    ksAllRightsReserved,
                    style: FigmaTextStyles().paragraphP2Regular.copyWith(
                      color: AppColors.kSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedLine extends StatefulWidget {
  const AnimatedLine({super.key});

  @override
  State<AnimatedLine> createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisible() {
    if (!_hasAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("animated_line"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) _onVisible();
      },
      child: CustomPaint(
        painter: LinePainter(animation: _animation),
        child: const SizedBox(height: 100, width: double.infinity),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Animation<double> animation;

  LinePainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.kSecondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 2,
      size.width * 0.5,
      size.height / 2,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      -size.height, // انحناء أعلى
      size.width,
      size.height / 2,
    );

    final totalLength = path.computeMetrics().first.length;
    final drawLength = totalLength * animation.value;

    final PathMetrics metrics = path.computeMetrics();
    final Path animatedPath = Path();

    for (var metric in metrics) {
      animatedPath.addPath(metric.extractPath(0, drawLength), Offset.zero);
    }

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) => true;
}
