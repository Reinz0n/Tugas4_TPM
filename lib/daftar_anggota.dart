import 'package:flutter/material.dart';
import 'package:tugas4_tpm/bottom_navigation_bar.dart';
import 'package:tugas4_tpm/login.dart';

class DaftarAnggota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecommendationItem(
            context,
            'Mikhael Rivandio Rekzadianto',
            '123200078',
          ),
          _buildRecommendationItem(
            context,
            'Muhammad Iqbal Daud Ibrahim',
            '123200076',
          ),
          // Add more recommendation items as needed
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

  Widget _buildRecommendationItem(
      BuildContext context,
      String name,
      String nim,
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Nama : $name'),
          Text('NIM  : $nim'),
          Divider(), // Add a divider between recommendation items
        ],
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
          content: Text("Halaman ini berisi daftar anggota tim"),
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