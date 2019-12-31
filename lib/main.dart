import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  String _dateString = '';

  AppState() {
    Timer.periodic(new Duration(seconds: 1), (_) {
      setState(() => _dateString = _formatTime(DateTime.now()));
    });
  }

  _formatTime(DateTime time) {
    var formatValue = (int value) => '${value < 10 ? '0' : ''}$value';
    return '${formatValue(time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour))}:'
        '${formatValue(time.minute)}:'
        '${formatValue(time.second)} '
        '${time.hour >= 12 ? 'PM' : 'AM'}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Clock',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            _dateString,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.amberAccent,
            ),
          ),
        ),
      ),
    );
  }
}
