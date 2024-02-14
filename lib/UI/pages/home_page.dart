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
          const SizedBox(height: 50),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return CityTile(city: cities[index]);
            },
          ),
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
        backgroundColor: Colors.grey.shade50,
        child: const Icon(Icons.add),
      ),
    );
  }
}
