import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/models/models.dart';
import '../pages/pages.dart';

class CityTile extends StatelessWidget {
  final City city;
  const CityTile({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: ListTile(
              title: Text(
            city.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        onTap: () {
          context.read<WeatherBloc>().add(AddCityEvent(city: city));

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CityWeatherPage(city: city),
            ),
          );
        },
      ),
    );
  }
}
