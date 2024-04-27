import 'package:flutter/material.dart';
import 'package:tugas4_tpm/bilangan_prima.dart';
import 'package:tugas4_tpm/daftar_anggota.dart';
import 'package:tugas4_tpm/hitung_keliling.dart';
import 'package:tugas4_tpm/hitung_luas.dart';
import 'package:tugas4_tpm/login.dart';
import 'package:tugas4_tpm/situs_rekomendasi.dart';
import 'package:tugas4_tpm/stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 4 TPM',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,

        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/daftar': (context) => DaftarAnggota(),
        '/prima': (context) => BilanganPrima(),
        '/luas': (context) => HitungLuas(),
        '/keliling': (context) => HitungKeliling(),
        '/situs': (context) => SitusRekomendasi(),
        '/stopwatch': (context) => StopwatchWidget(),
      },
      home: LoginScreen(),
    );
  }
}

