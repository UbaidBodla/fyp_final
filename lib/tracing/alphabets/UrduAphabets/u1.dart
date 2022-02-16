import 'dart:ui';

List<Path> pathu1(Size size) => [
      Path()
        ..moveTo(size.width * 0.4793364, size.height * 0.0766667)
        ..cubicTo(
            size.width * 0.4465949,
            size.height * 0.2841667,
            size.width * 0.4301193,
            size.height * 0.2823167,
            size.width * 0.4356810,
            size.height * 0.3533333)
        ..cubicTo(
            size.width * 0.4343714,
            size.height * 0.4937500,
            size.width * 0.4627823,
            size.height * 0.8985333,
            size.width * 0.4779307,
            size.height * 0.9538500)
        ..quadraticBezierTo(size.width * 0.4901542, size.height * 0.9267667,
            size.width * 0.5093801, size.height * 0.8140667)
        ..quadraticBezierTo(size.width * 0.5328842, size.height * 0.6759667,
            size.width * 0.4793364, size.height * 0.0766667)
        ..close()
    ];
