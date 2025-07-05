import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/extensions.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.label,
    this.bgColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.shadowColor,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
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
    final labelStyle = context.adaptive(
      Theme.of(context).textTheme.bodySmall,
      Theme.of(context).textTheme.bodyMedium,
    );
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onHover: (PointerEvent event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (PointerEvent event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: <Widget>[
          AnimatedPositioned(
            left: _isHovered ? 8 : 0,
            bottom: _isHovered ? 8 : 0,
            duration: const Duration(milliseconds: 300),
            child:
                <Widget>[
                  Text(
                    widget.label.toUpperCase(),
                    style: labelStyle?.copyWith(
                      color: widget.shadowColor ?? Colors.amberAccent,
                    ),
                  ),
                  // customSpace(w: _isHovered ? 10 : 5),
                  Icon(
                    widget.icon,
                    color: widget.shadowColor ?? Colors.amberAccent,
                  ),
                ].addRow().addCenter().addContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: context.adaptive(6, 14),
                    horizontal: context.adaptive(24, 42),
                  ),
                  decoration: BoxDecoration(
                    color: widget.shadowColor ?? Colors.amberAccent,
                    border: Border.all(
                      color: widget.shadowColor ?? Colors.amberAccent,
                    ),
                  ),
                ),
          ),
          <Widget>[
            Text(widget.label.toUpperCase(), style: labelStyle),
            AnimatedContainer(
              width: _isHovered ? 10 : 5,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            Icon(widget.icon),
          ].addRow().addCenter().addContainer(
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            padding: EdgeInsets.symmetric(
              vertical: context.adaptive(6, 14),
              horizontal: context.adaptive(24, 42),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: widget.foregroundColor),
            ),
          ),
        ].addStack(),
      ),
    );
  }
}
