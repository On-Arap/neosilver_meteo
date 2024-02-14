part of 'search_city_cubit.dart';

@immutable
sealed class SearchCityState {}

final class SearchCityInitial extends SearchCityState {}

final class SearchCitySearched extends SearchCityState {
  final String citySearched;
  final List<City> cityList;

  SearchCitySearched({
    required this.citySearched,
    required this.cityList,
  });
}
