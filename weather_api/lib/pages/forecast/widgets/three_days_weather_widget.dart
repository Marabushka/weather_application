import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/pages/forecast/widgets/sort.dart';

class ThreeDaysWeatherWidget extends StatelessWidget {
  final List<DailyWeather> dailyWeather;
  const ThreeDaysWeatherWidget({Key? key, required this.dailyWeather})
      : super(key: key);

  @override
  //виджет экрана погоды на 3 дня
  Widget build(BuildContext context) {
    String? city = context.read<SearchModel>().city;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$city",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SortWidget(dailyWeather: dailyWeather)
          ],
        )
      ],
    );
  }
}
