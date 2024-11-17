import 'package:flutter/material.dart';
import 'package:flutter_lesson/W5/W5-S2-Practice/EX3/screen/welcome.dart';
import 'package:flutter_lesson/W5/W5-S2-Practice/EX3/screen/temperature.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _isWelcomeScreen = true;

  void switchScreen() {
    setState(() {
      _isWelcomeScreen = !_isWelcomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _isWelcomeScreen
              ? Welcome(onStartPressed: switchScreen)
              : Temperature(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
