import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:neosilver_meteo/models/models.dart';
import 'package:http/http.dart' as http;
import '../../api_key.dart' as apikey;
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<AddCityEvent>(_addCity);
    on<SearchCityEvent>(_searchCity);
  }

  void _addCity(AddCityEvent event, Emitter<WeatherState> emit) {
    emit(WeatherLoading(city: event.city));
  }

  void _searchCity(SearchCityEvent event, Emitter<WeatherState> emit) async {
    // create API call
    final response = await http.post(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=${event.city.lat}&lon=${event.city.long}&units=metric&exclude=hourly,daily&appid=${apikey.apiKey}'));
    final Map responseJson = jsonDecode(response.body);
    inspect(responseJson);

    List<WeatherInformation> listInfo = [WeatherInformation(infoTitle: 'Weather', value: responseJson['current']['weather'][0]['main'].toString().isNotEmpty ? responseJson['current']['weather'][0]['main'].toString() : 'N/A')];
    listInfo.add(WeatherInformation(infoTitle: 'Temperature', value: responseJson['current']['temp'].toString().isNotEmpty ? responseJson['current']['temp'].toString() : 'N/A'));
    listInfo.add(WeatherInformation(infoTitle: 'Humidity', value: responseJson['current']['humidity'].toString().isNotEmpty ? responseJson['current']['humidity'].toString() : 'N/A'));
    listInfo.add(WeatherInformation(infoTitle: 'Wind speed', value: responseJson['current']['wind_speed'].toString().isNotEmpty ? responseJson['current']['wind_speed'].toString() : 'N/A'));
    listInfo.add(WeatherInformation(infoTitle: 'Sunrise', value: responseJson['current']['sunrise'].toString().isNotEmpty ? responseJson['current']['sunrise'].toString() : 'N/A'));
    listInfo.add(WeatherInformation(infoTitle: 'Sunset', value: responseJson['current']['sunset'].toString().isNotEmpty ? responseJson['current']['sunset'].toString() : 'N/A'));

    print(listInfo);
    emit(WeatherLoaded(city: event.city, weatherInfo: listInfo));
  }
}
