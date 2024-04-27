import 'package:flutter/material.dart';
import 'package:tugas4_tpm/login.dart';
import 'package:tugas4_tpm/bottom_navigation_bar.dart';

class HitungKeliling extends StatefulWidget {
  @override
  _HitungKelilingState createState() => _HitungKelilingState();
}

class _HitungKelilingState extends State<HitungKeliling> {
  double sisiA = 0;
  double sisiB = 0;
  double sisiC = 0;
  double keliling = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Keliling', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang sisi A',
              ),
              onChanged: (value) {
                setState(() {
                  sisiA = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang sisi B',
              ),
              onChanged: (value) {
                setState(() {
                  sisiB = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan panjang sisi C',
              ),
              onChanged: (value) {
                setState(() {
                  sisiC = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  keliling = _hitungKeliling(sisiA, sisiB, sisiC);
                });
              },
              child: Text('Hitung Keliling'),
            ),
            SizedBox(height: 20),
            Text(
              'Keliling: $keliling',
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

  double _hitungKeliling(double a, double b, double c) {
    return a + b + c;
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
          content: Text("Halaman ini berfungsi menghitung keliling segitiga"),
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
