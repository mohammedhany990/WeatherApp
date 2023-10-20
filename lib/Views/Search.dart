import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/getWeatherCubit/getWeatherCubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a city',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getCurrentWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 30,
              ),
              hintText: 'Enter a city name',
              labelText: 'Search',
              labelStyle: TextStyle(fontSize: 30),
              hintStyle: TextStyle(fontSize: 25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
