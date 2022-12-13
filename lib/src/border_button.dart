import 'package:flutter/material.dart';

/// A Border Button Just Like [OutlinedButton].

class BorderButton extends StatelessWidget {
  final Color? borderColor;
  final Function()? onPressed;
  final Widget child;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const BorderButton({
    super.key,

    /// The Background color for button is not specified
    /// then theme's primary color will be used.
    this.borderColor,
    required this.child,

    /// Border radius for the button.
    this.borderRadius,

    /// padding for the child of the button.
    this.padding,

    /// margin of the button.
    this.margin,

    /// function that will be triggered on button press.
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(10),
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 5),
            ),
          ),
          child: InkWell(
            onTap: onPressed,
            radius: borderRadius ?? 5,
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            child: Container(
              padding: padding ?? const EdgeInsets.all(10),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
