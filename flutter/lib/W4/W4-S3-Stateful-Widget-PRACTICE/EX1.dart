import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Button(),
            SizedBox(height: 20),
            Button(),
            SizedBox(height: 20),
            Button(),
            SizedBox(height: 20),
            Button(),
          ],
        ),
      ),
    ));

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSelected = false;

  void toggleButton() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  String get buttonText => isSelected ? "Selected" : "Not selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          onPressed: toggleButton,
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
