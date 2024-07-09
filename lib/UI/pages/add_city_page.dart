import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/UI/components/city_tile_search.dart';
import 'package:neosilver_meteo/UI/components/search_field.dart';
import 'package:neosilver_meteo/datas/data.dart';

class AddCityPage extends StatelessWidget {
  const AddCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SearchField(),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: BlocBuilder<SearchCityCubit, SearchCityState>(
                        builder: (context, state) {
                          if (state is SearchCitySearched) {
                            if (state.cityList.isNotEmpty) {
                              return ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                itemCount: state.cityList.length,
                                itemBuilder: (context, index) {
                                  return CityTileSearch(
                                      city: state.cityList[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 1.0,
                                  );
                                },
                              );
                            } else {
                              return const Text('No city found',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            }
                          } else {
                            return const Center(
                                child: Text('Type a city in the search bar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
