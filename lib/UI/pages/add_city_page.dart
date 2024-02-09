import 'package:flutter/material.dart';

class AddCityPage extends StatelessWidget {
  const AddCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new city'),
      ),
      backgroundColor: Colors.transparent,
      body: const Center(
        child: Text('Add City'),
      ),
    );
  }
}
