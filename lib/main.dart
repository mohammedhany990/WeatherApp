import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather_app/Cubit/getWeatherCubit/getWeatherState.dart';

import 'package:weather_app/Views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherState,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(day) {
  switch (day.toString().toLowerCase()) {
    case 'sunny':
    case 'clear':
    case 'partly cloudy':
      return Colors.orange;
    case 'blizzard':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'blowing snow':
      return Colors.blue;
    case 'freezing fog':
    case 'fog':
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'heavy rain':
    case 'showers':
      return Colors.blue;
    case 'thundery outbreaks possible':
    case 'moderate or heavy snow with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
