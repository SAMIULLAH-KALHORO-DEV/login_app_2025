import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TextsTheme {
  final heading1sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 30,
    color: Color(0xFF075B5E),
    fontWeight: FontWeight.w700,
  );
  final heading2sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 20,
    color: Color(0xFF075B5E),
    fontWeight: FontWeight.w700,
  );
  final heading3sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 12,
    color: Color(0xFF075B5E),
    fontWeight: FontWeight.bold,
  );
  final heading4sytle = TextStyle(
    fontFamily: 'manrope',
    fontSize: 12,
    color: Color(0xFF075B5E),
    fontWeight: FontWeight.bold,
  );
}

class ColorsTheme {
  final iconColor = Colors.red.shade800;
  final backgroundColor = Color.fromARGB(255, 244, 67, 54);
  final shadowColor = const Color(0x6EB2FF59);
  final borderColor = Color(0xFF075B5E);
}

class ContainerTheme {
  final containerTheme1 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: const Color(0x1C075B5E),
        spreadRadius: 3, // How much the shadow spreads
        blurRadius: 10, // How blurry the shadow is
        // offset: Offset(3, 3), // x and y offset
      ),
    ],
  );
}

class TextFieldBorder extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final String? validationText;

  const TextFieldBorder({super.key, this.hintText, this.textEditingController, this.validationText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
        ),
        suffixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        }
        return null;
      },
    );
  }
}

class TextFieldOutlineborder {
    final textFieldBorder = InputDecoration(
      hintText: '',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorsTheme().borderColor, width: 1.5),
      ),

      suffixIcon: Icon(Icons.person),
    );
  }


class ContainerTheme2 extends StatelessWidget {
  final DecorationImage? image;
  final Widget? child;
  const ContainerTheme2({super.key, this.image, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: image,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1C075B5E),
            spreadRadius: 3, // How much the shadow spreads
            blurRadius: 10, // How blurry the shadow is
            // offset: Offset(3, 3), // x and y offset
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 255, 255), // soft cream
            // Color(0xFF005F63), // teal
            Color(0xFFFF3F33), // red
          ],
          stops: [0.9, 0.1],
        ),
      ),
    );
  }
}
