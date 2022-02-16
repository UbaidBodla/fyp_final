import 'package:flutter/material.dart';

class AlphabetClipper extends CustomClipper<Path> {
  final Path path;

  AlphabetClipper(this.path);
  @override
  Path getClip(Size size) {
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
