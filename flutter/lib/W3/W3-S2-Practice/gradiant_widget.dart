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
        gradient: (start != null && end != null)
            ? LinearGradient(
                colors: [start!, end!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: (start != null && end == null) ? start : null,
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
