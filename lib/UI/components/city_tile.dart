import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/datas/list_cities/list_cities_cubit.dart';
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
            textColor: city.name.contains('My location') ? Colors.black54 : Colors.black,
            title: Text(
              city.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: city.name.contains('My location')
                ? const SizedBox(width: 20)
                : InkWell(
                    child: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.grey.shade900,
                    ),
                    onTap: () {
                      context.read<ListCitiesCubit>().removeCity(city);
                    },
                  ),
          ),
        ),
        onTap: () {
          if (!city.name.contains('My location')) {
            context.read<WeatherBloc>().add(AddCityEvent(city: city));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CityWeatherPage(city: city),
              ),
            );
          }
        },
      ),
    );
  }
}
