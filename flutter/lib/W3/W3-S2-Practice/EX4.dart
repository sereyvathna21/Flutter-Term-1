import 'package:flutter/material.dart';
import 'gradiant_widget.dart';

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
