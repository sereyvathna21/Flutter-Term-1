import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String text;
  final Color? start;
  final Color? end;

  const CustomWidget({
    super.key,
    required this.text,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: end == null ? start : null,
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
              start: Colors.blue,
              end: Colors.black,
            ),
            CustomWidget(
              text: "Hello 2",
              start: Colors.blue,
              end: Colors.red,
            ),
            CustomWidget(
              text: "Hello 3",
              start: Colors.purple,
              end: Colors.yellow,
            ),
          ],
        ),
      ),
    ),
  ));
}
