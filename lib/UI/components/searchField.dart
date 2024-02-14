import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosilver_meteo/datas/data.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        onChanged: (value) {
          context.read<SearchCityCubit>().searchCity(value);
        },
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade50),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade50),
          ),
          hintText: "Search for Items",
          hintStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.5, decorationThickness: 6),
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.black,
        ),
      ),
    );
  }
}
