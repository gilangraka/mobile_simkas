// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_simkas/screen/dashboard/dashboard.dart';
import 'package:mobile_simkas/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_simkas/screen/login.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseDatabase database = FirebaseDatabase.instance;

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
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
