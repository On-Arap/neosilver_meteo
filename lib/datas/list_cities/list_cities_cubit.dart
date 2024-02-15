import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neosilver_meteo/models/models.dart';

part 'list_cities_state.dart';

class ListCitiesCubit extends Cubit<ListCitiesState> {
  ListCitiesCubit() : super(ListCitiesInitial());

  List<City> list = [];

  void addCity(City city) {
    if (list.contains(city)) {
      return;
    }
    list.add(city);
    emit(ListCitiesLoaded(cityList: list));
  }

  void removeCity(City city) {
    list.remove(city);
    emit(ListCitiesLoaded(cityList: list));
  }
}
