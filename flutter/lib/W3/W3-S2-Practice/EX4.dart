import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomWidget(
                text: 'OOP',
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                ),
              ),
              CustomWidget(
                text: 'DART',
                color: Colors.blue,
              ),
              CustomWidget(
                text: 'FLUTTER',
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final LinearGradient? gradient;

  const CustomWidget({
    super.key,
    required this.text,
    this.color,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? color : null,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
