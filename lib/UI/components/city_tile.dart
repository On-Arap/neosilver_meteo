import 'package:flutter/material.dart';

class CityTile extends StatelessWidget {
  final String city;
  final String weather;
  const CityTile({super.key, required this.city, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                city,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                weather,
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
