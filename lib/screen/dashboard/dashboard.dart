// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:mobile_simkas/screen/dashboard/konfirmasi.dart';
import 'package:mobile_simkas/screen/dashboard/menu_profile/profile_screen.dart';
import 'package:mobile_simkas/screen/dashboard/riwayat.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  List<Transaction> transactions = [
    Transaction(
      date: DateTime.now(),
      userName: '',
      category: '',
      amount: 25000,
    ),
    Transaction(
      date: DateTime.now(),
      userName: 'lalalall',
      category: '',
      amount: 25000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Color(0xFF003F5F)),
        ),
        backgroundColor: Color(0xFFF1F5FF),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF003F5F),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/pp.jpg'),
                    ),
                  ),
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Gilang~!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Riwayat Kas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Riwayat()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Konfirmasi Kas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HistoryScreen(transactions: transactions)),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 22,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/pp.jpg'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Gilang~!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildContainer(
                "Tagihan Kas Bulanan", "Nominal: Rp. 25,000", 'Bayar'),
            SizedBox(height: 40),
            buildContainer(
                "Data Uang Masuk/Keluar", "", 'Tampilkan Lebih Banyak'),
            SizedBox(height: 20),
            buildContainer("Konfirmasi Pembayaran Kas", "", 'Lihat Konfirmasi'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Riwayat()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Riwayat()),
              );
            }
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF003F5F),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildContainer(String title, String subTitle, String buttonText) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF1F5FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          subTitle.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (buttonText == 'Bayar') {
                          _onBayarPressed();
                        } else {
                          // Handle other button clicks if needed
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF003F5F),
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    if (buttonText == 'Lihat Konfirmasi') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HistoryScreen(transactions: transactions)),
                      );
                    }
                    if (buttonText == 'Tampilkan Lebih Banyak') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Riwayat()),
                      );
                    }
                    // You can add more conditions if needed
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF003F5F),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Metode Pembayaran'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                  _onCashPayment(); // Pilih metode pembayaran Cash
                },
                child: Text('Cash'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                  _onTransferPayment(); // Pilih metode pembayaran Transfer
                },
                child: Text('Transfer'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onBayarPressed() {
    _showPaymentDialog(); // Tampilkan dialog pembayaran
  }

  void _onCashPayment() {
    // Logika untuk pembayaran dengan metode Cash
  }

  void _onTransferPayment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload Pembayaran'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Silakan upload bukti transfer'),
              ElevatedButton(
                onPressed: () {
                  // Logika untuk mengupload pembayaran
                  Navigator.pop(context); // Tutup dialog
                },
                child: Text('Upload'),
              ),
            ],
          ),
        );
      },
    );
  }
}
