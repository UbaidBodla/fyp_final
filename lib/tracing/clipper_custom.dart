import 'package:flutter/material.dart';

class DecoratedClipper {
  final Color color;
  final List<Path> paths;
  final double strokeWidth;
  final PaintingStyle paintingStyle;

  DecoratedClipper({
    this.color = Colors.black,
    @required this.paths,
    this.strokeWidth = 4,
    this.paintingStyle = PaintingStyle.stroke,
  });
}
