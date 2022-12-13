import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    this.onPressed,
    required this.borderColor,
    this.borderWidth,
    required this.child,
    this.bgColor,
  }) : super(key: key);
  /// callback of button press
  final Function()? onPressed;
  /// bordercolor of the button
  final Color borderColor;
  /// button background color
  /// if null primary theme color used
  final Color? bgColor;
  /// border width
  /// set this to zero if you don't want it
  final double? borderWidth;
  /// the child to be displayed in button
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: borderWidth ?? 1,
          ),
          color: bgColor ?? Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(1000.0),
          onTap: onPressed ?? () {},
          child: child,
        ),
      ),
    );
  }
}


