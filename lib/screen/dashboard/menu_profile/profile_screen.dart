// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_simkas/screen/home.dart';
import 'terms_conditions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _myBox = Hive.box('mybox');

  String getID() {
    var uid = _myBox.get("uid").toString();
    return uid;
  }

  String _nama = "";
  bool _status_bayar = true;
  String _role = "";

  Future<void> getData() async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("mahasiswa/${getID()}");
    DatabaseEvent event = await ref.once();
    Map dataUser = event.snapshot.value as Map;
    setState(() {
      _nama = dataUser['nama'].toString();
      bool status_bayar = dataUser['status_pembayaran'];
      int role = dataUser['role'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFF1F5FF),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUserProfile(),
            SizedBox(height: 40.0),
            Divider(height: 10, thickness: 1),
            buildMenuItem(Icons.notifications, 'Notifikasi'),
            Divider(height: 10, thickness: 1),
            buildMenuItem(Icons.description, 'Syarat dan Ketentuan'),
            Divider(height: 10, thickness: 1),
            buildMenuItem(Icons.exit_to_app, 'Logout'),
            Divider(height: 10, thickness: 1),
          ],
        ),
      ),
    );
  }

  Widget buildUserProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage:
              AssetImage('images/pp.jpg'), // Ganti dengan path gambar profil
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _nama,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _role,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMenuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        if (title == 'Syarat dan Ketentuan') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TermsConditions()), // <-- Ganti SyaratPage() dengan halaman yang sesuai
          );
        } else if (title == 'Logout') {
          _showLogoutConfirmationDialog();
        } else {
          // Aksi lain jika diperlukan untuk item lainnya
          print('Clicked $title');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.0,
              color: Color(0xFF0C4E6D),
            ),
            SizedBox(width: 16.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog() async {
    bool? confirmLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Konfirmasi Keluar Akun'),
          content: Text('Apa kamu yakin ingin keluar akun ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Nanti Dulu'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); //
              },
              child: Text('Ya!'),
            ),
          ],
        );
      },
    );

    if (confirmLogout == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }
}
