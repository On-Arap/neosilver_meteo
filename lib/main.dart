import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './UI/pages/pages.dart';

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
    );
  }
}
