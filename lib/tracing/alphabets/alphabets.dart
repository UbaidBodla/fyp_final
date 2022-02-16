import 'dart:ui';
import 'package:alphabetgame/tracing/clipper_custom.dart';
import 'package:flutter/material.dart';
import '1.dart';
import '2.dart';
import '3.dart';
import '4.dart';
import '5.dart';
import 'A.dart';
import 'B.dart';
import 'C.dart';
import 'D.dart';
import 'E.dart';
import 'F.dart';
import 'UrduAphabets/u1.dart';
import 'UrduAphabets/u2.dart';
import 'UrduAphabets/u3.dart';

Map<String, DecoratedClipper> getAlphabetsPainter(Size size) => {
      "A": DecoratedClipper(paths: pathA(size)),
      "B": DecoratedClipper(paths: pathB(size)),
      "C": DecoratedClipper(paths: pathC(size)),
      "D": DecoratedClipper(paths: pathD(size)),
      "E": DecoratedClipper(paths: pathE(size)),
      "F": DecoratedClipper(paths: pathF(size)),
      //Counting
      "1": DecoratedClipper(paths: path1(size)),
      "2": DecoratedClipper(paths: path2(size)),
      "3": DecoratedClipper(paths: path3(size)),
      "4": DecoratedClipper(paths: path4(size)),
      "5": DecoratedClipper(paths: path5(size)),
      //Urdu Alphabet
      "u1": DecoratedClipper(paths: pathu1(size)),
      "u2": DecoratedClipper(paths: pathu2(size)),
      "u3": DecoratedClipper(paths: pathu3(size)),
    };
Map<String, Path> getAlphabetClipper(Size s) => {
      "A": pathA(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "B": pathB(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "C": pathC(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "D": pathD(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "E": pathE(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "F": pathF(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),

      //Counting
      "1": path1(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "2": path2(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "3": path3(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "4": path4(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "5": path5(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      //Urdu Alphabets
      "u1": pathu1(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "u2": pathu2(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
      "u3": pathu3(s)
          .reduce((a, b) => Path.combine(PathOperation.difference, a, b)),
    };
