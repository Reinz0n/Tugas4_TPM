import 'package:flutter/material.dart';
import 'package:tugas4_tpm/login.dart';
import 'package:tugas4_tpm/bottom_navigation_bar.dart';

class BilanganPrima extends StatefulWidget {
  @override
  _BilanganPrimaState createState() => _BilanganPrimaState();
}

class _BilanganPrimaState extends State<BilanganPrima> {
  int number = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan angka',
              ),
              onChanged: (value) {
                setState(() {
                  number = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = _isPrime(number) ? '$number adalah prima' : '$number bukan prima';
                });
              },
              child: Text('Check'),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Current index of the selected bottom navigation item
        onTap: (index) {
          _onBottomNavItemTapped(context, index);
        },
      ),
    );
  }

  bool _isPrime(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  // Function to handle bottom navigation item tap
  void _onBottomNavItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/stopwatch');
    } else if (index == 1) {
      _showHelpDialog(context);
    } else if (index == 2) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  // Function to show help dialog
  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Help"),
          content: Text("Halaman ini berfungsi untuk mengecek apakah sebuah bilangan tersebut adalah prima atau tidak"),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
