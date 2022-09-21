import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:weather_api/api_client/entity/weather.dart';

class SearchModel extends ChangeNotifier {
  final days = <Weather>[];
  String? city;
  final textController = TextEditingController();
  String? errorMessage;
  String apiKey = "d9de3d7bf210e7a3c1b4a45a07c49889";

  Future<void> changeCity(BuildContext context) async {
    //метод смены названия города
    final text = textController.text.trim();
    if (text.isNotEmpty) {
      city = text;
      errorMessage = null;
      notifyListeners();
      Navigator.of(context).pushNamed('/city_weather_widget');
    } else
      errorMessage = "Введите название города";
    notifyListeners();
  }

  Future<Weather?> getCurrentWeather() async {
    //метод декодирования и получения погоды из JSON
    Weather weather;

    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        weather = Weather.fromJson(jsonDecode(response.body));
        return weather;
      } else if (response.statusCode == 404) {
        //сохранение сообщения с ошибкой
        weather = Weather(message: 'Ошибка получения данных');
        return weather;
      }
    } catch (_) {
      weather = Weather(message: 'Ошибка получения данных');
      return weather;
    }
  }

  Future<List<DailyWeather>> fetchDailyWeather() async {
    //метод декодирования и получения погоды по дням из JSON
    final List<DailyWeather> data;
    var url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<DailyWeather> data =
            (jsonData['list'] as List<dynamic>).map((item) {
          return DailyWeather.fromJson(item);
        }).toList();
        return data;
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (_) {
      throw Exception('Failed to load weather');
    }
  }
}
