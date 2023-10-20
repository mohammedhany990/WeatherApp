import 'package:dio/dio.dart';
import 'package:weather_app/Models/WeatherModels.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '23524851a48549399ab151216230610';
  // 23524851a48549399ab151216230610

  WeatherService({
    required this.dio,
  });
  Future<WeatherModel> getWeather({required String? cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Oops! wrong, Try again';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Oops! Something went wrong, Try again');
    }
  }
}
