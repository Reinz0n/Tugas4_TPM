import 'package:flutter/material.dart';
import 'package:tugas4_tpm/bottom_navigation_bar.dart';
import 'package:tugas4_tpm/login.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildMenuItem(context, 'Daftar Anggota', '/daftar'),
          _buildMenuItem(context, 'Bilangan Prima', '/prima'),
          _buildMenuItem(context, 'Hitung Luas', '/luas'),
          _buildMenuItem(context, 'Hitung Keliling', '/keliling'),
          _buildMenuItem(context, 'Situs Rekomendasi', '/situs'),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Current index of the selected bottom navigation item
        onTap: (index) {
          _onBottomNavItemTapped(context, index);
        },
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(title),
      ),
    );
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
          content: Text("Halaman Utama yang berisi 5 menu daftar anggota, bilangan prima, hitung luas, hitung keliling, dan situs rekomendasi"),
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
