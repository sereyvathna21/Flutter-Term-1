import 'package:flutter/material.dart';
import 'joke.dart';

void main() => runApp(const JokesApp());

class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          title: const Text("Favorite Jokes"),
        ),
        body: const JokesList(),
      ),
    );
  }
}

class JokesList extends StatefulWidget {
  const JokesList({super.key});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  String bestJokeId = '3';

  void setBestJoke(String id) {
    setState(() {
      bestJokeId = (id == bestJokeId ? null : id)!; // Toggle best joke
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          joke: jokes[index],
          isBest: jokes[index]['id'] == bestJokeId,
          onBestSelect: setBestJoke,
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Map<String, String> joke;
  final bool isBest;
  final Function(String) onBestSelect;

  const FavoriteCard({
    required this.joke,
    required this.isBest,
    required this.onBestSelect,
    super.key,
  });

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
                  joke['title']!,
                  style: TextStyle(
                      color: Colors.green[300], fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke['description']!),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onBestSelect(joke['id']!),
            icon: Icon(
              isBest ? Icons.favorite : Icons.favorite_border,
              color: isBest ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
