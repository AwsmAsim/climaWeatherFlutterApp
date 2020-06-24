import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey='d33378b0fcf5eadd81a73e1751584f8b';
const openWheatherApiURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double lat,long;

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper('$openWheatherApiURL?q=${cityName}&appid=${apiKey}&units=metric');
    var wheatherData = await networkHelper.getData();
    return wheatherData;
  }

  Future<dynamic> getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();

    lat=location.latitude;
    long=location.longitude;
    NetworkHelper networkHelper = NetworkHelper('$openWheatherApiURL?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    var wheatherData = await networkHelper.getData();
    return wheatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
