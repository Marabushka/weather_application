import 'package:flutter/material.dart';
import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/pages/forecast/widgets/forecast_widget.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    Key? key,
    required this.dailyWeather,
  }) : super(key: key);

  final List<DailyWeather> dailyWeather;
//виджет сортировки погоды
//самый холодный день сверху
  @override
  Widget build(BuildContext context) {
    if (dailyWeather[0].temp! < dailyWeather[8].temp! &&
        dailyWeather[0].temp! < dailyWeather[16].temp!) {
      return Column(
        children: [
          ForecastWidget(
              iconCode: dailyWeather[0].iconCode,
              temperature: dailyWeather[0].temp,
              humidity: dailyWeather[0].humidity,
              windSpeed: dailyWeather[0].windSpeed,
              date: 'Cегодня'),
          ForecastWidget(
              iconCode: dailyWeather[8].iconCode,
              temperature: dailyWeather[8].temp,
              humidity: dailyWeather[8].humidity,
              windSpeed: dailyWeather[8].windSpeed,
              date: 'Завтра'),
          ForecastWidget(
              iconCode: dailyWeather[16].iconCode,
              temperature: dailyWeather[16].temp,
              humidity: dailyWeather[16].humidity,
              windSpeed: dailyWeather[16].windSpeed,
              date: 'Послезавтра'),
        ],
      );
    } else if (dailyWeather[8].temp! < dailyWeather[0].temp! &&
        dailyWeather[8].temp! < dailyWeather[16].temp!) {
      return Column(
        children: [
          ForecastWidget(
              iconCode: dailyWeather[8].iconCode,
              temperature: dailyWeather[8].temp,
              humidity: dailyWeather[8].humidity,
              windSpeed: dailyWeather[8].windSpeed,
              date: 'Завтра'),
          ForecastWidget(
              iconCode: dailyWeather[0].iconCode,
              temperature: dailyWeather[0].temp,
              humidity: dailyWeather[0].humidity,
              windSpeed: dailyWeather[0].windSpeed,
              date: 'Сегодня'),
          ForecastWidget(
              iconCode: dailyWeather[16].iconCode,
              temperature: dailyWeather[16].temp,
              humidity: dailyWeather[16].humidity,
              windSpeed: dailyWeather[16].windSpeed,
              date: 'Послезавтра'),
        ],
      );
    } else if (dailyWeather[16].temp! < dailyWeather[0].temp! &&
        dailyWeather[16].temp! < dailyWeather[8].temp!) {
      return Column(
        children: [
          ForecastWidget(
              iconCode: dailyWeather[16].iconCode,
              temperature: dailyWeather[16].temp,
              humidity: dailyWeather[16].humidity,
              windSpeed: dailyWeather[16].windSpeed,
              date: 'Послезавтра'),
          ForecastWidget(
              iconCode: dailyWeather[0].iconCode,
              temperature: dailyWeather[0].temp,
              humidity: dailyWeather[0].humidity,
              windSpeed: dailyWeather[0].windSpeed,
              date: 'Сегодня'),
          ForecastWidget(
              iconCode: dailyWeather[8].iconCode,
              temperature: dailyWeather[8].temp,
              humidity: dailyWeather[8].humidity,
              windSpeed: dailyWeather[8].windSpeed,
              date: 'Завтра'),
        ],
      );
    }
    return SizedBox();
  }
}
