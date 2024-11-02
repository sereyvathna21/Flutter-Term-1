import 'package:flutter/material.dart';

enum Product {
  dart('Dart', 'The best object language', 'assets/images/dart.png'),
  flutter('Flutter', 'The best widget library', 'assets/images/flutter.jpg'),
  firebase('Firebase', 'The best cloud database', 'assets/images/firebase.png');

  final String name;
  final String description;
  final String imagePath;

  const Product(this.name, this.description, this.imagePath);
}

Widget _buildProductCard(Product product) {
  return SizedBox(
    height: 250,
    width: 500,
    child: Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              product.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    ),
  );
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text("Products", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: Product.values
                .map((product) => _buildProductCard(product))
                .toList(),
          ),
        ),
      ),
    ),
  );
}
