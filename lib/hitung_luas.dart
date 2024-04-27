import 'package:flutter/material.dart';
import 'package:tugas4_tpm/login.dart';
import 'package:tugas4_tpm/bottom_navigation_bar.dart';

class HitungLuas extends StatefulWidget {
  @override
  _HitungLuasState createState() => _HitungLuasState();
}

class _HitungLuasState extends State<HitungLuas> {
  double alas = 0;
  double tinggi = 0;
  double luas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang alas',
              ),
              onChanged: (value) {
                setState(() {
                  alas = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan tinggi',
              ),
              onChanged: (value) {
                setState(() {
                  tinggi = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  luas = _hitungLuas(alas, tinggi);
                });
              },
              child: Text('Hitung Luas'),
            ),
            SizedBox(height: 20),
            Text(
              'Luas: $luas',
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

  double _hitungLuas(double a, double t) {
    return 0.5 * a * t;
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
          content: Text("Halaman ini berfungsi menghitung luas segitiga"),
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
