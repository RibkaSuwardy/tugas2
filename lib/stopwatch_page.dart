import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Stopwatch _stopwatch = Stopwatch();
  String _stopwatchText = '00:00:00';
  List<String> _laps = [];

  @override
  void initState() {
    super.initState();
  }

  void startStopwatch() {
    _stopwatch.start();
    Duration interval = Duration(milliseconds: 1);
    // Update stopwatch text every 1 millisecond
    Timer.periodic(interval, (timer) {
      setState(() {
        _stopwatchText = formatStopwatchTime(_stopwatch.elapsedMilliseconds);
      });
    });
  }

  void stopStopwatch() {
    _stopwatch.stop();
  }

  void resetStopwatch() {
    _stopwatch.stop();
    _stopwatch.reset();
    setState(() {
      _stopwatchText = '00:00:00';
      _laps.clear();
    });
  }

  void lapStopwatch() {
    if (_stopwatch.isRunning) {
      _laps.add(_stopwatchText);
    }
  }

  String formatStopwatchTime(int milliseconds) {
    int seconds = (milliseconds / 1000).floor();
    int minutes = (seconds / 60).floor();
    int hours = (minutes / 60).floor();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _stopwatchText,
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!_stopwatch.isRunning) {
                      startStopwatch();
                    }
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_stopwatch.isRunning) {
                      stopStopwatch();
                    }
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    lapStopwatch();
                  },
                  child: Text('Lap'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetStopwatch,
              child: Text('Reset'),
            ),
            SizedBox(height: 20),
            if (_laps.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Laps:',
                    style: TextStyle(fontSize: 24),
                  ),
                  for (int i = 0; i < _laps.length; i++)
                    Text(
                      'Lap ${i + 1}: ${_laps[i]}',
                      style: TextStyle(fontSize: 20),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
