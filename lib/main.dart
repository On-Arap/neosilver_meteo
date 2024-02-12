import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './UI/pages/pages.dart';
import './datas/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Neosilver Meteo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (BuildContext context) => WeatherBloc(),
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    routes: {
                      '/': (context) => const HomePage(),
                      '/addcity': (context) => const AddCityPage(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
