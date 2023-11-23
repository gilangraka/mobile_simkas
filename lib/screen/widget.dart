// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget fontLogo() {
  return RichText(
    text: TextSpan(
        text: 'Sim',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C4E6D)),
        ),
        children: const <TextSpan>[
          TextSpan(
              text: 'Kas',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC444)))
        ]),
  );
}
