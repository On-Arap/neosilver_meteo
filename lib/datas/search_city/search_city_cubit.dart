import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../api_key.dart' as apikey;
import 'dart:convert';
import 'package:neosilver_meteo/models/models.dart';

part 'search_city_state.dart';

List<City> searchedCities = [
  City(name: 'Madrid, Spain', lat: 40.416775, long: -3.703790),
  City(name: 'Stockholm, Sweden', lat: 59.3293235, long: 18.0685808),
  City(name: 'Amsterdam, Netherland', lat: 52.377956, long: 4.897070),
  City(name: 'Tokyo, Japan', lat: 35.652832, long: 139.839478),
  City(name: 'Brasília, Brasil', lat: -15.793889, long: -47.882778),
  City(name: 'Berlin, Germany', lat: 52.520008, long: 13.404954),
];

class SearchCityCubit extends Cubit<SearchCityState> {
  SearchCityCubit() : super(SearchCityInitial());

  Future<void> searchCity(String cityname) async {
    final response = await http.post(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=$cityname&limit=5&appid=${apikey.apiKey}'));
    final Map responseJson = jsonDecode(response.body);

    inspect(responseJson);
    emit(SearchCitySearched(citySearched: cityname, cityList: searchedCities));
  }
}
