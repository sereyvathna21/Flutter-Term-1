import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            // Method 1: Using a traditional for loop
            for (int i = 0; i < colors.length; i++) Label(colors[i]),
            const SizedBox(height: 20),

            const Label("Method 2: Map", bold: true),
            // Method 2: Using the map() method
            ...colors.map((color) => Label(color)).toList(),
            const SizedBox(height: 20),

            const Label("Method 3: Dedicated Function", bold: true),
            // Method 3: Using a dedicated function
            ...buildColorList(),
          ],
        ),
      ),
    ),
  ));
}

List<Widget> buildColorList() {
  List<Widget> colorWidgets = [];
  for (String color in colors) {
    colorWidgets.add(Label(color));
  }
  return colorWidgets;
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
