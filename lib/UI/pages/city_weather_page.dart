import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/datas/weather/weather_bloc.dart';
import 'package:neosilver_meteo/models/models.dart';

class CityWeatherPage extends StatelessWidget {
  final City city;

  const CityWeatherPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Weather'),
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city.name,
              style: const TextStyle(fontSize: 42),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade50, width: 2),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.weatherInfo.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text(
                                      state.weatherInfo[index].infoTitle,
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      state.weatherInfo[index].value,
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  ]),
                                );
                              }),
                        )),
                  );
                } else {
                  context.read<WeatherBloc>().add(SearchCityEvent(city: city));
                  return const CircularProgressIndicator(color: Colors.blue);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
