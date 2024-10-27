import 'package:flutter/material.dart';

void main() {
  runApp(
    Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 9, 136, 240),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 98, 174, 235),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "Best of the Best",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
