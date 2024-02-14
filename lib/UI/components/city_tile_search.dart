import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/models/models.dart';
import '../pages/pages.dart';

class CityTileSearch extends StatelessWidget {
  final City city;
  const CityTileSearch({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withAlpha(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: ListTile(
          title: Text(city.name),
        ),
      ),
    );
  }
}
