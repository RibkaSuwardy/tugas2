import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerWidget extends StatefulWidget {
  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  int _secondsRemaining = 60; // Ubah ini untuk mengatur waktu awal countdown
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel(); // Hentikan timer ketika mencapai 0
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Batalkan timer saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sisa Waktu: $_secondsRemaining detik',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
