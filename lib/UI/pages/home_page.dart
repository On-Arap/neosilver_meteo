import 'package:flutter/material.dart';
import 'package:neosilver_meteo/UI/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CityTile(city: 'Paris', weather: '🌫️'),
        CityTile(city: 'London', weather: '⛈️'),
        CityTile(city: 'Madrid', weather: '☀️'),
        CityTile(city: 'Berlin', weather: '🌥️'),
        CityTile(city: 'Paris', weather: '🌫️'),
      ],
    );
  }
}
