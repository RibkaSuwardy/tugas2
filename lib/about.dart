import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/fti_si_logo.png', // Ganti dengan path ke gambar Anda
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text('Nama: Ribka Suwardy'),
            Text('NPM: 825210036'),
          ],
        ),
      ),
    );
  }
}
