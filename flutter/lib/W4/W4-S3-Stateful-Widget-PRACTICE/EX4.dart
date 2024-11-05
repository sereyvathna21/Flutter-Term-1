import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(title: Text('Score Cards')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomScoreCard(subject: 'Flutter'),
              SizedBox(height: 10),
              CustomScoreCard(subject: 'Dart'),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomScoreCard extends StatefulWidget {
  final String subject;

  const CustomScoreCard({Key? key, required this.subject}) : super(key: key);

  @override
  _CustomScoreCardState createState() => _CustomScoreCardState();
}

class _CustomScoreCardState extends State<CustomScoreCard> {
  int score = 0;

  Color getScoreColor() {
    int greenValue = (255 - (score * 15)).clamp(0, 255);
    return Color.fromRGBO(0, greenValue, 0, 1.0);
  }

  void incrementScore() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void decrementScore() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progressBarWidth = 500;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'My score in ${widget.subject}',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: decrementScore,
              ),
              Text(
                '$score',
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: incrementScore,
              ),
            ],
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                width: progressBarWidth,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: progressBarWidth * (score / 10),
                height: 50,
                decoration: BoxDecoration(
                  color: getScoreColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
