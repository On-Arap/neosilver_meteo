import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/UI/components/components.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/models/models.dart';
import './pages.dart';
import '../../models/city.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void addCity() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CityTile(city: paris, weather: '🌫️'),
          CityTile(city: london, weather: '⛈️'),
          CityTile(city: madrid, weather: '☀️'),
          CityTile(city: berlin, weather: '🌥️'),
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
