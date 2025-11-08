import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextsTheme {
  final heading1sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  final heading2sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  final heading3sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

class ColorsTheme {
  final iconColor = Colors.red.shade800;
  final backgroundColor = Color.fromARGB(255, 244, 67, 54);
  final shadowColor = const Color(0x6EB2FF59);
}

class ContainerTheme {
  final ContainerTheme1 = BoxDecoration(
    color: const Color(0xFFFFE3E6),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(129, 255, 205, 210),
        spreadRadius: 2, // How much the shadow spreads
        blurRadius: 5, // How blurry the shadow is
        offset: Offset(3, 3), // x and y offset
      ),
    ],
  );
}
