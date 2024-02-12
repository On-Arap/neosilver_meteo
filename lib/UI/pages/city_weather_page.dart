import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/data.dart';
import 'package:neosilver_meteo/datas/weather/weather_bloc.dart';
import 'package:neosilver_meteo/models/models.dart';
import 'package:neosilver_meteo/widgets/background.dart';

class CityWeatherPage extends StatelessWidget {
  final City city;

  const CityWeatherPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Stack(
            children: [
              Image.asset(
                chooseBackground(state.weatherInfo),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        city.name,
                        style: const TextStyle(fontSize: 42),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          context.read<WeatherBloc>().add(SearchCityEvent(city: city));
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        }
      },
    );
  }
}
