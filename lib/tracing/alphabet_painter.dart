import 'package:flutter/material.dart';

import 'clipper_custom.dart';

class AlphabetPainter extends CustomPainter {
  final DecoratedClipper decoratedClipper;

  AlphabetPainter(this.decoratedClipper);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = decoratedClipper.color
      ..style = decoratedClipper.paintingStyle
      ..strokeWidth = decoratedClipper.strokeWidth;
    decoratedClipper.paths.forEach((path) {
      canvas.drawPath(path, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
