import 'package:flutter/material.dart';

/// Specifies if and how the child order should be reversed.
///
/// - [row]: Reverse only when using Row layout.
/// - [column]: Reverse only when using Column layout.
/// - [none]: Do not reverse the child order.
enum ReverseDirection {
  row,
  column,
  none,
}

/// Specifies the layout direction to use in portrait mode.
///
/// - [row]: Use Row in portrait, Column in landscape.
/// - [column]: Use Column in portrait, Row in landscape.
enum LayoutPreference {
  row,
  column,
}

/// A layout widget that automatically switches between [Row] and [Column]
/// based on screen orientation and layout preference.
///
/// Supports reversing the order of children in specific orientations and
/// allows spacing between them.
class FlexLinearLayout extends StatelessWidget {
  /// The widgets to display in a linear layout.
  final List<Widget> children;

  /// Alignment along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How much space the layout should occupy in the main axis.
  final MainAxisSize mainAxisSize;

  /// Alignment along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// The text direction to use when in row layout.
  final TextDirection? textDirection;

  /// The direction to use when in column layout.
  final VerticalDirection verticalDirection;

  /// The baseline used for aligning text.
  final TextBaseline? textBaseline;

  /// Space between children (currently unused due to limitation).
  final double spacing;

  /// The external BuildContext (optional; not used in build).
  final BuildContext context;

  /// Whether and how to reverse the child order.
  final ReverseDirection direction;

  /// Layout behavior preference in portrait mode.
  final LayoutPreference layoutPreference;

  /// Creates a [FlexLinearLayout].
  const FlexLinearLayout({
    Key? key,
    required this.context,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing = 0.0,
    this.direction = ReverseDirection.none,
    this.layoutPreference = LayoutPreference.column,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.of(context).size;
    return (layoutPreference == LayoutPreference.column
            ? mySize.width > mySize.height
            : mySize.width < mySize.height)
        ? Row(
            
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            textDirection: textDirection,
            textBaseline: textBaseline,
            verticalDirection: verticalDirection,
            crossAxisAlignment: crossAxisAlignment,
            children: direction == ReverseDirection.row
                ? children.reversed.toList()
                : children,
          )
        : Column(
           
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            textDirection: textDirection,
            textBaseline: textBaseline,
            verticalDirection: verticalDirection,
            crossAxisAlignment: crossAxisAlignment,
            children: direction == ReverseDirection.column
                ? children.reversed.toList()
                : children,
          );
  }
}
