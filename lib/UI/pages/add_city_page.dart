import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
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
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: BlocBuilder<SearchCityCubit, SearchCityState>(
                      builder: (context, state) {
                        if (state is SearchCitySearched) {
                          return ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                            itemCount: state.cityList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.white.withAlpha(30),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                                  child: ListTile(
                                    title: Text(state.cityList[index].name),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 1.0,
                              );
                            },
                          );
                        } else {
                          return const Text('Nothing to display');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
