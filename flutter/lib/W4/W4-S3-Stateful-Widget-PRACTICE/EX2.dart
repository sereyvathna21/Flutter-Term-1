import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            Cards(
              title: 'Title 1',
              description: 'hello description',
            ),
            Cards(
              title: 'Title 2',
              description: 'hello description',
            ),
            Cards(
              title: 'Title 3',
              description: 'hello description',
            ),
            Cards(
              title: 'Title 4',
              description: 'hello description',
            ),
          ],
        ),
      ),
    ));

class Cards extends StatefulWidget {
  final String title;
  final String description;

  const Cards({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 20.0),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
