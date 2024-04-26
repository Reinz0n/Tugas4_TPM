import 'package:flutter/material.dart';

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
}
