// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_simkas/screen/login.dart';
import 'package:mobile_simkas/screen/widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            height: 46,
          ),
          Container(
            padding: EdgeInsets.only(right: 40, left: 40),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              padding: EdgeInsets.only(left: 40, right: 40),
              minWidth: double.infinity,
              height: 60,
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFF0C4E6D),
                  ),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'LOGIN APLIKASI',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF0C4E6D),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
