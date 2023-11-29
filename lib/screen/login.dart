// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController inputEmail = new TextEditingController();
  TextEditingController inputPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Login',
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Color(0xFF0C4E6D))),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20,
            color: Colors.black,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 147,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/login.png'),
            )),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            'Selamat Datang!',
            style: TextStyle(fontSize: 21),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Dengan melakukan login, kamu telah',
            style: TextStyle(fontSize: 16, color: Color(0xFF6B5E5E)),
          ),
          SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
              text: 'menyetujui ',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 16, color: Color(0xFF6B5E5E))),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Syarat dan Ketentuan',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF0C4E6D))),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: inputFile(
                label: 'Email Address',
                icon: Icons.email_outlined,
                controller: inputEmail),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: inputFile(
                label: 'Password',
                obscureText: true,
                icon: Icons.key,
                controller: inputPass),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: MaterialButton(
              onPressed: () async {
                String emailAddress = inputEmail.text;
                String password = inputPass.text;
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailAddress, password: password);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              minWidth: double.infinity,
              height: 50,
              color: Color(0xFF0C4E6D),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFF0C4E6D),
                  ),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget inputFile({label, obscureText = false, icon, controller}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: label,
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            icon,
          ),
        )),
  );
}
