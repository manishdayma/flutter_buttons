import 'package:flutter/material.dart';

class RectIconButton extends StatelessWidget {
  const RectIconButton({
    Key? key,
    this.onPressed,
    required this.borderColor,
    this.borderWidth,
    required this.child,
    this.bgColor,
  }) : super(key: key);

  final Function()? onPressed;
  final Color borderColor;
  final Color? bgColor;
  final double? borderWidth;
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
          shape: BoxShape.rectangle,
        ),
        child: InkWell(
          onTap: onPressed ?? () {},
          child: child,
        ),
      ),
    );
  }
}


