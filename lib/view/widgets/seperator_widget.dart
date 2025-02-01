import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  final Color color; // Color of the dashes
  final double dashWidth; // Width of each dash
  final double dashHeight; // Height of each dash
  final double spacing; // Spacing between dashes

  const SeparatorWidget({
    Key? key,
    this.color = Colors.grey, // Default color
    this.dashWidth = 10.0, // Default dash width
    this.dashHeight = 1.0, // Default dash height
    this.spacing = 5.0, // Default spacing between dashes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the number of dashes that can fit in the available width
        final dashCount = (constraints.constrainWidth() / (dashWidth + spacing)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (index) => SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}