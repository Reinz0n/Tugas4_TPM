import 'package:flutter/material.dart';
import 'package:tugas4_tpm/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugas4_tpm/bottom_navigation_bar.dart';

class SitusRekomendasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Rekomendasi', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecommendationItem(
            context,
            'Flutter Dev',
            'https://flutter.dev/',
            'https://yt3.googleusercontent.com/ytc/AIdro_nqx_sCd8ZIeIcodS0sfeMKJ8rVTslmQHUe_udwGNH2Pg=s900-c-k-c0x00ffffff-no-rj',
          ),
          _buildRecommendationItem(
            context,
            'Youtube',
            'https://www.youtube.com/',
            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png',
          ),
          _buildRecommendationItem(
            context,
            'Shopee',
            'https://shopee.co.id/',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFgSnzQ1LXpLise_jgH3HO6yt95VUStwsDU03FPY3vAg&s',
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
      String title,
      String url,
      String imageUrl,
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _launchURL(url);
            },
            child: Image.network(
              imageUrl,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          TextButton(
            onPressed: () {
              _launchURL(url);
            },
            child: Text('Visit Site'),
          ),
          Divider(), // Add a divider between recommendation items
        ],
      ),
    );
  }

  // Function to launch URL
  Future <void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)){
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
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
          content: Text("Halaman ini berisi rekomendasi situs yang dapat dikunjungi"),
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
