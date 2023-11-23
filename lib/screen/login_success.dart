// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, annotate_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_simkas/screen/dashboard.dart';
import 'package:mobile_simkas/screen/widget.dart';
import 'package:lottie/lottie.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          fontLogo(),
          SizedBox(
            height: 45,
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/before_login/before_login1.png'),
            )),
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            'Meminimalisir Kesalahan',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF0C4E6D)),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Kurangi kesalahan pencatatan dan',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color(0xFF0C4E6D))),
          Text(
            'kesalahan lainnya',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Color(0xFF0C4E6D)),
          ),
          SizedBox(
            height: 45,
          ),
          Container(
            height: 75,
            width: 75,
            child: Lottie.asset('images/animations/loadingAnimation.json'),
          ),
        ],
      ),
    );
  }
}
