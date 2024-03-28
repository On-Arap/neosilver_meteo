import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/models/models.dart';
import '../../datas/list_cities/list_cities_cubit.dart';

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
          title: Row(
            children: [
              Text('${city.name}, ${city.country}'),
            ],
          ),
          trailing: InkWell(
            child: Icon(
              Icons.add_box_outlined,
              color: Colors.grey.shade900,
            ),
            onTap: () {
              context.read<ListCitiesCubit>().addCity(city);
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
