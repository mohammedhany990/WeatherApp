import 'package:flutter/material.dart';

class WeatherModel {
  final double minTemp;
  final double maxTemp;
  final String name;
  final DateTime lastUpdated;
  final String weatherState;
  final double temp;
  final String? img;
  WeatherModel({
    required this.lastUpdated,
    required this.minTemp,
    required this.maxTemp,
    required this.name,
    required this.weatherState,
    required this.temp,
    required this.img,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      name: json['location']['name'],
      lastUpdated: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherState: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }

  MaterialColor getThemeColor() {
    if (weatherState == 'Sunny' ||
        weatherState == 'Clear' ||
        weatherState == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherState == 'Blizzard' ||
        weatherState == 'Patchy snow possible' ||
        weatherState == 'Patchy sleet possible' ||
        weatherState == 'Patchy freezing drizzle possible' ||
        weatherState == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherState == 'Freezing fog' ||
        weatherState == 'Fog' ||
        weatherState == 'Heavy Cloud' ||
        weatherState == 'Mist' ||
        weatherState == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Heavy Rain' ||
        weatherState == 'Showers	') {
      return Colors.blue;
    } else if (weatherState == 'Thundery outbreaks possible' ||
        weatherState == 'Moderate or heavy snow with thunder' ||
        weatherState == 'Patchy light snow with thunder' ||
        weatherState == 'Moderate or heavy rain with thunder' ||
        weatherState == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
