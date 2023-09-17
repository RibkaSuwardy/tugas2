import 'package:flutter/material.dart';
import 'stopwatch_page.dart';
import 'countdown.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch & Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/stopwatch': (context) => StopwatchScreen(),
        '/timer': (context) => CountdownTimerWidget(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch & Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stopwatch');
              },
              child: Text('Stopwatch'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/timer');
              },
              child: Text('Countdown Timer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}
