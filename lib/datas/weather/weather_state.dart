part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {
  final City city;

  WeatherLoading({
    required this.city,
  });
}

final class WeatherLoaded extends WeatherState {
  final City city;
  final List<WeatherInformation> weatherInfo;

  WeatherLoaded({
    required this.city,
    required this.weatherInfo,
  });
}
