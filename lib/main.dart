import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/list_cities/list_cities_cubit.dart';
import './UI/pages/pages.dart';
import './datas/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => WeatherBloc(),
        ),
        BlocProvider(
          create: (context) => SearchCityCubit(),
        ),
        BlocProvider(
          create: (context) => ListCitiesCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Neosilver Meteo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
              const SafeArea(
                child: HomePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
