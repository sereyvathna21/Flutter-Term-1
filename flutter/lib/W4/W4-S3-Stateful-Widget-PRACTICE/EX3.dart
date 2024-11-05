import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/vichet.jpg",
  "assets/images/khom.jpg",
  "assets/images/khun.jpg",
  "assets/images/girl.jpg",
  "assets/images/hour.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    ));

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[_currentIndex]),
      ),
    );
  }
}
