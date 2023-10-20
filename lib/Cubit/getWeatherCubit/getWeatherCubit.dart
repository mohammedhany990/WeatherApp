import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/getWeatherCubit/getWeatherState.dart';
import 'package:weather_app/Models/WeatherModels.dart';
import 'package:weather_app/Services/WeatherService.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getWeather(cityName: cityName);
      emit(
        WeatherLoadedState(
          weatherModel: weatherModel!,
        ),
      );
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
