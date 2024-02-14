import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/UI/components/components.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/datas/list_cities/list_cities_cubit.dart';
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
          BlocBuilder<ListCitiesCubit, ListCitiesState>(
            builder: (context, state) {
              if (state is ListCitiesLoaded) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.cityList.length,
                  itemBuilder: (context, index) {
                    return CityTile(city: state.cityList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 1.0,
                    );
                  },
                );
              } else {
                return const Center(child: Text('Add a city'));
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SearchCityCubit>().resetList();
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
