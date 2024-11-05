import 'package:flutter/material.dart';

enum Condition {
  Sunny(image: 'images/sun.png'),
  Rainy(image: 'images/rainy-day.png'),
  Cloudy(image: 'images/cloudy.png'),
  Snowy(image: 'images/snowy.png'),
  SnowRain(image: 'images/snowrain.png'),
  SnowStorm(image: 'images/snow-storm.png');

  final String image;
  const Condition({required this.image});
}

enum Day {
  Mon(name: "Mon"),
  Tue(name: "Tue"),
  Wed(name: "Wed"),
  Thu(name: "Thu"),
  Fri(name: "Fri"),
  Sat(name: "Sat"),
  Sun(name: "Sun");

  final String name;
  const Day({required this.name});
}

class Temperature {
  final int max;
  final int min;

  Temperature({required this.max, required this.min});
}

class WeatherCard extends StatelessWidget {
  final Condition condition;
  final Day day;
  final Temperature temperature;

  const WeatherCard({
    super.key,
    required this.temperature,
    required this.condition,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset(
              condition.image,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${temperature.max}°",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  "${temperature.min}°",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.count(
          crossAxisCount: 6,
          childAspectRatio: 1,
          children: [
            WeatherCard(
              condition: Condition.Cloudy,
              day: Day.Mon,
              temperature: Temperature(max: 28, min: 18),
            ),
            WeatherCard(
              condition: Condition.Rainy,
              day: Day.Tue,
              temperature: Temperature(max: 28, min: 18),
            ),
            WeatherCard(
              condition: Condition.SnowRain,
              day: Day.Wed,
              temperature: Temperature(max: 28, min: 18),
            ),
            WeatherCard(
              condition: Condition.SnowStorm,
              day: Day.Thu,
              temperature: Temperature(max: 28, min: 18),
            ),
            WeatherCard(
              condition: Condition.Snowy,
              day: Day.Fri,
              temperature: Temperature(max: 28, min: 18),
            ),
            WeatherCard(
              condition: Condition.Sunny,
              day: Day.Sat,
              temperature: Temperature(max: 28, min: 18),
            ),
            WeatherCard(
              condition: Condition.Rainy,
              day: Day.Sun,
              temperature: Temperature(max: 28, min: 18),
            ),
          ],
        ),
      ),
    ),
  ));
}
