part of 'list_cities_cubit.dart';

@immutable
sealed class ListCitiesState {}

final class ListCitiesInitial extends ListCitiesState {}

final class ListCitiesLoaded extends ListCitiesState {
  final List<City> cityList;

  ListCitiesLoaded({
    required this.cityList,
  });
}
