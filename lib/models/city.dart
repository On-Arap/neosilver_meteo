class City {
  final String name;
  final double lat;
  final double long;

  City({required this.name, required this.lat, required this.long});
}

City paris = City(name: 'Paris', lat: 48.866667, long: 2.333333);
City london = City(name: 'London', lat: 51.509865, long: -0.118092);
City madrid = City(name: 'Madrid', lat: 40.416775, long: -3.703790);
City berlin = City(name: 'Berlin', lat: 52.520008, long: 13.404954);
