import 'dart:ui';

List<Path> pathD(Size size) => [
      Path()
        ..moveTo(size.width * 0.3527183, size.height * 0.0283740)
        ..lineTo(size.width * 0.5064290, size.height * 0.0243604)
        ..quadraticBezierTo(size.width * 0.6271973, size.height * 0.0401074,
            size.width * 0.6506577, size.height * 0.2622070)
        ..cubicTo(
            size.width * 0.6499549,
            size.height * 0.3610840,
            size.width * 0.6480646,
            size.height * 0.5588379,
            size.width * 0.6478463,
            size.height * 0.6577148)
        ..cubicTo(
            size.width * 0.6510070,
            size.height * 0.8478955,
            size.width * 0.5294005,
            size.height * 0.9209473,
            size.width * 0.4976717,
            size.height * 0.9111328)
        ..quadraticBezierTo(size.width * 0.4610012, size.height * 0.9111328,
            size.width * 0.3509895, size.height * 0.9111328)
        ..lineTo(size.width * 0.3527183, size.height * 0.0283740)
        ..close(),
      Path()
        ..moveTo(size.width * 0.4435390, size.height * 0.1787109)
        ..cubicTo(
            size.width * 0.4919965,
            size.height * 0.1776123,
            size.width * 0.4919965,
            size.height * 0.1776123,
            size.width * 0.5081490,
            size.height * 0.1772461)
        ..quadraticBezierTo(size.width * 0.5584837, size.height * 0.2098682,
            size.width * 0.5583003, size.height * 0.2882520)
        ..quadraticBezierTo(size.width * 0.5575735, size.height * 0.5641296,
            size.width * 0.5573312, size.height * 0.6560889)
        ..quadraticBezierTo(size.width * 0.5456141, size.height * 0.7523291,
            size.width * 0.4949651, size.height * 0.7548779)
        ..lineTo(size.width * 0.4454773, size.height * 0.7576465)
        ..quadraticBezierTo(size.width * 0.4435390, size.height * 0.6104736,
            size.width * 0.4435390, size.height * 0.1787109)
        ..close()
    ];
