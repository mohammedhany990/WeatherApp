import 'package:flutter/material.dart';
import 'package:weather_app/Models/WeatherModels.dart';
import 'package:weather_app/main.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherInfo({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.weatherState)[200]!,
              getThemeColor(weatherModel.weatherState)[300]!,
              getThemeColor(weatherModel.weatherState),
              getThemeColor(weatherModel.weatherState)[500]!,
              getThemeColor(weatherModel.weatherState)[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${weatherModel.lastUpdated.hour}:${weatherModel.lastUpdated.minute} ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: Image.network('https:${weatherModel.img!}'),
                    ),
                  ),
                  Text(
                    '${weatherModel.temp.round()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'MinTemp: ${weatherModel.minTemp.round()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'MaxTemp: ${weatherModel.maxTemp.round()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                weatherModel.weatherState,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
