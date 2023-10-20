// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather_app/Cubit/getWeatherCubit/getWeatherState.dart';
import 'package:weather_app/Views/Failure.dart';
import 'package:weather_app/Views/NoWeather.dart';
import 'package:weather_app/Views/Search.dart';
import 'package:weather_app/Views/WeatherInfo.dart';

var mode = 'Brightness.dark';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            splashColor: Colors.blue,
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeather();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo(weatherModel: state.weatherModel);
          } else {
            return const FailurePage();
          }
        },
      ),
    );
  }
}
