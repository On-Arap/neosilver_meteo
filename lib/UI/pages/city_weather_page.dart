import 'package:flutter/material.dart';

class CityWeatherPage extends StatelessWidget {
  final String city;

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
              city,
              style: const TextStyle(fontSize: 42),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade50, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Sunrise'), Text('06h03')]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Sunset'), Text('20h12')]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Temperature'), Text('25°C')]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Sky'), Text('Sunshine')]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Wind speed'), Text('10km/h')]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Humidity'), Text('20%')]),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
