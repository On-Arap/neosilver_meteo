import 'package:neosilver_meteo/models/models.dart';

String chooseBackground(List<WeatherInformation> weatherInfo) {
  String weather = 'Clear';
  for (var info in weatherInfo) {
    if (info.infoTitle.contains('Weather')) {
      weather = info.value;
    }
  }

  String image = 'assets/weathers/clouds';
  switch (weather) {
    case 'Thunderstorm':
      image = 'assets/weathers/thunderstorm.jpg';
      break;
    case 'Drizzle':
      image = 'assets/weathers/drizzle.jpg';
      break;
    case 'Rain':
      image = 'assets/weathers/rain.jpg';
      break;
    case 'Snow':
      image = 'assets/weathers/snow.jpg';
      break;
    case 'Clear':
      image = 'assets/weathers/clear.jpg';
      break;
    case 'Clouds':
      image = 'assets/weathers/clouds.jpg';
      break;
    default:
  }

  return image;
}
