import 'package:flutter/material.dart';

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

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidget(
              text: "Hello 1",
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
              ),
            ),
            CustomWidget(
              text: "Hello 2",
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.red],
              ),
            ),
            CustomWidget(
              text: "Hello 3",
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.yellow],
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
