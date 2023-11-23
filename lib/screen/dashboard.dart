// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(),
      ),
    );
  }
}
