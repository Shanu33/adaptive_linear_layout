import 'package:flutter/material.dart';

enum ReverseDirection{
  Row,
  Column,
  None
}
enum LayoutPreference{
  Row,
  Column,
}


class FlexLinearLayout extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final double spacing;
  final BuildContext Context;
  final direction;
  final childPlacement;

  const FlexLinearLayout({
    Key? key,
    required this.Context,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing = 0.0,
    this.direction=ReverseDirection.None,
    this.childPlacement=LayoutPreference.Column
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    var mySize=MediaQuery.of(Context).size;
    return (childPlacement==LayoutPreference.Column? mySize.width>mySize.height : mySize.width<mySize.height)?
    Row(
      spacing: spacing,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      textBaseline: textBaseline,
      verticalDirection: verticalDirection,
      crossAxisAlignment: crossAxisAlignment,
      children: direction == ReverseDirection.Row? children.reversed.toList():children,

    )
        :Column(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        textBaseline: textBaseline,
        verticalDirection: verticalDirection,
        crossAxisAlignment: crossAxisAlignment,
        children: direction == ReverseDirection.Column? children.reversed.toList():children,

    );

  }
}