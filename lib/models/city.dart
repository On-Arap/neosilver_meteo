class City {
  final String name;
  final double lat;
  final double long;

  City({required this.name, required this.lat, required this.long});
}

List<City> cities = [
  City(name: 'Paris', lat: 48.866667, long: 2.333333),
  City(name: 'London', lat: 51.509865, long: -0.118092),
];
