import 'package:flutter/widgets.dart';

/// Fixed spacing atom: `BaseGap.v(12)` for vertical, `BaseGap.h(8)` for
/// horizontal.
class BaseGap extends StatelessWidget {
  const BaseGap.v(this.size, {super.key}) : axis = Axis.vertical;

  const BaseGap.h(this.size, {super.key}) : axis = Axis.horizontal;

  final double size;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.vertical
        ? SizedBox(height: size)
        : SizedBox(width: size);
  }
}
