import 'package:flutter/material.dart';
import 'package:neosilver_meteo/UI/components/components.dart';
import './pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void addCity() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const Column(
        children: [
          CityTile(city: 'Paris', weather: '🌫️'),
          CityTile(city: 'London', weather: '⛈️'),
          CityTile(city: 'Madrid', weather: '☀️'),
          CityTile(city: 'Berlin', weather: '🌥️'),
          CityTile(city: 'Paris', weather: '🌫️'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddCityPage(),
            ),
          );
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
