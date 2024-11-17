import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avatarUrl,
    required this.tiles,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String value;

  TileData({
    required this.icon,
    required this.title,
    required this.value,
  });
}

ProfileData profileData1 = ProfileData(
  name: 'Sokhom',
  position: 'Flutter Developer',
  avatarUrl: 'assets/images/khom.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: 'Phone Number', value: '+885 456 7890'),
    TileData(icon: Icons.location_on, title: 'Address', value: 'Cambodia'),
  ],
);
