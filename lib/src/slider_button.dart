import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  ///To make button more customizable add your child widget
  final Widget? child;

  ///Sets the radius of corners of a button.
  final double radius;

  ///Use it to define a height and width of widget.
  final double height;
  final double width;
  final double? buttonSize;

  ///Use it to define a color of widget.
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;

  ///Change it to gave a label on a widget of your choice.
  final Text? label;

  ///Gives a alignment to a slider icon.
  final Alignment alignLabel;
  final BoxShadow? boxShadow;
  final Widget? icon;
  final Function action;

  ///Make it false if you want to deactivate the shimmer effect.
  final bool shimmer;

  ///Make it false if you want maintain the widget in the tree.
  final bool dismissible;

  final bool vibrationFlag;

  ///The offset threshold the item has to be dragged in order to be considered
  ///dismissed e.g. if it is 0.4, then the item has to be dragged
  /// at least 40% towards one direction to be considered dismissed
  final double dismissThresholds;

  final bool disable;

  const SliderButton({
    super.key,
    required this.action,
    this.radius = 100,
    this.boxShadow,
    this.child,
    this.vibrationFlag = false,
    this.shimmer = true,
    this.height = 70,
    this.buttonSize,
    this.width = 250,
    this.alignLabel = const Alignment(0.6, 0),
    this.backgroundColor = const Color(0xffe0e0e0),
    this.baseColor = Colors.black87,
    this.buttonColor = Colors.white,
    this.highlightedColor = Colors.white,
    this.label,
    this.icon,
    this.dismissible = true,
    this.dismissThresholds = 0.75,
    this.disable = false,
  }) : assert((buttonSize ?? 60) <= (height));

  @override
  SliderButtonState createState() => SliderButtonState();
}

class SliderButtonState extends State<SliderButton> {
  late bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true
        ? _control()
        : widget.dismissible == true
            ? Container()
            : _control();
  }

  Widget _control() => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.disable ? Colors.grey.shade700 : widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              alignment: widget.alignLabel,
              child: widget.label ?? const Text(''),
              // child: widget.shimmer && !widget.disable
              //     ? Shimmer.fromColors(
              //   baseColor: widget.disable ? Colors.grey : widget.baseColor,
              //   highlightColor: widget.highlightedColor,
              //   child: widget.label ?? const Text(''),
              // )
              //     : widget.label,
            ),
            widget.disable
                ? Tooltip(
                    verticalOffset: 50,
                    message: 'Button is disabled',
                    child: Container(
                      width: (widget.width) - (widget.height),
                      height: (widget.height - 70),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: (widget.height -
                                (widget.buttonSize ?? widget.height * 0.9)) /
                            2,
                      ),
                      child: widget.child ??
                          Container(
                            height: widget.buttonSize ?? widget.height,
                            width: widget.buttonSize ?? widget.height,
                            decoration: BoxDecoration(
                                boxShadow: widget.boxShadow != null
                                    ? [
                                        widget.boxShadow!,
                                      ]
                                    : null,
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.circular(widget.radius)),
                            child: Center(child: widget.icon),
                          ),
                    ),
                  )
                : Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    dismissThresholds: {
                      DismissDirection.startToEnd: widget.dismissThresholds
                    },

                    ///gives direction of swiping in argument.
                    onDismissed: (dir) async {
                      setState(() {
                        if (widget.dismissible) {
                          flag = false;
                        } else {
                          flag = !flag;
                        }
                      });
                      widget.action();
                    },
                    child: Container(
                      width: widget.width - widget.height,
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: (widget.height -
                                (widget.buttonSize == null
                                    ? widget.height
                                    : widget.buttonSize!)) /
                            2,
                      ),
                      child: widget.child ??
                          Container(
                            height: widget.buttonSize ?? widget.height,
                            width: widget.buttonSize ?? widget.height,
                            decoration: BoxDecoration(
                              boxShadow: widget.boxShadow != null
                                  ? [
                                      widget.boxShadow!,
                                    ]
                                  : null,
                              color: widget.buttonColor,
                              borderRadius:
                                  BorderRadius.circular(widget.radius),
                            ),
                            child: Center(child: widget.icon),
                          ),
                    ),
                  ),
          ],
        ),
      );
}
