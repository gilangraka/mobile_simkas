// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mobile_simkas/screen/dashboard/dashboard.dart';

class Transaction {
  final DateTime date;
  final String userName;
  final String category;
  final double amount;

  Transaction({
    required this.date,
    required this.userName,
    required this.category,
    required this.amount,
  });
}

class KonfirmasiKas extends StatefulWidget {
  final Transaction transaction;

  KonfirmasiKas({required this.transaction});

  @override
  _KonfirmasiKasState createState() => _KonfirmasiKasState();
}

class _KonfirmasiKasState extends State<KonfirmasiKas> {
  bool isConfirmationEnabled = true;

  void _onKonfirmasiPressed() {
    // Add your confirmation logic here
    setState(() {
      isConfirmationEnabled = false; // Disable the button after it's clicked
    });
  }

  void _onBuktiTransferPressed() {
    // Add your "Bukti Transfer" logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bukti Transfer'),
          content: Column(
            children: [
              Image.network(
                  'https://s0.bukalapak.com/img/0657559704/large/Screenshot_2018_11_22_20_41_14_33.png'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialogF
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        tileColor: Colors.white,
        title: Text('Date: ${widget.transaction.date.toString()}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: ${widget.transaction.userName}'),
            Text('Kategori: ${widget.transaction.category}'),
            Text('Total: ${widget.transaction.amount.toString()}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      isConfirmationEnabled ? _onKonfirmasiPressed : null,
                  child: Text(
                    'Konfirmasi',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003F5F),
                  ),
                ),
                ElevatedButton(
                  onPressed: _onBuktiTransferPressed,
                  child: Text(
                    'Bukti Transfer',
                    style: TextStyle(color: Color(0xFF003F5F)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final List<Transaction> transactions;

  HistoryScreen({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionHistoryPage(transactions: transactions),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionHistoryPage({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Kas Kelas'),
        backgroundColor: Color(0xFFF1F5FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Dashboard()), // Ganti HomeScreen dengan nama sesuai halaman utama Anda
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return KonfirmasiKas(transaction: transactions[index]);
        },
      ),
    );
  }
}
