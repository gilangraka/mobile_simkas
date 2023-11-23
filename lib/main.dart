// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_simkas/screen/home.dart';
import 'package:mobile_simkas/screen/login_success.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simkas Apps',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFFFFF)),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: const LoginSuccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}
