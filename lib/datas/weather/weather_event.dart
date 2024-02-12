part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class AddCityEvent extends WeatherEvent {
  final City city;

  AddCityEvent({
    required this.city,
  });
}

final class SearchCityEvent extends WeatherEvent {
  final City city;

  SearchCityEvent({
    required this.city,
  });
}
