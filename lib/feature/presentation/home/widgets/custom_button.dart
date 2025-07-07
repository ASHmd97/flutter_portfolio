import 'package:flutter/material.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_colors.dart';
import 'package:flutter_portfolio/feature/data/configs/constant_sizes.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.bgColor = kWhite,
    this.foregroundColor = kBlack,
    this.shadowColor,
    required this.onPressed,
    required this.icon,
  });
  final String label;
  final Color bgColor;
  final Color foregroundColor;
  final Color? shadowColor;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final labelStyle = _isHovered
        ? FigmaTextStyles().paragraphP2Bold
        : FigmaTextStyles().paragraphP2Regular;
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onHover: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _isHovered ? 8 : 0,
              bottom: _isHovered ? 8 : 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: _isHovered ? 22 : 18,
                ),
                decoration: BoxDecoration(
                  color: widget.shadowColor ?? kSecondary,
                  border: Border.all(color: widget.shadowColor ?? kSecondary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.label.toUpperCase(),
                      style: labelStyle.copyWith(
                        color: widget.shadowColor ?? kSecondary,
                      ),
                    ),
                    SizedBox(width: _isHovered ? s10 : s5),
                    Icon(widget.icon, color: widget.shadowColor ?? kSecondary),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, bottom: 8),
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: _isHovered ? 22 : 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: widget.foregroundColor),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.label.toUpperCase(), style: labelStyle),
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: SizedBox(width: _isHovered ? s10 : s5),
                  ),
                  Icon(widget.icon, color: widget.foregroundColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
