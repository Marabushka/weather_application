import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/models/weather_model.dart';

class WeatherPage extends StatelessWidget {
  final Weather wheather;
  const WeatherPage({Key? key, required this.wheather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //виджет экрана погоды
    String? city = context.read<SearchModel>().city;
    return Stack(
      children: [
        //задний фон
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //отображение информации о городе
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${wheather.city}",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 3,
                  ),
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //отображение информации о погоде
                    children: [
                      Image.network(
                        "http://openweathermap.org/img/wn/${wheather.iconCode}@2x.png",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${wheather.temp}",
                            style: const TextStyle(
                                fontSize: 70, color: Colors.white),
                          ),
                          const Text(
                            '°c',
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          )
                        ],
                      ),
                      Text(
                        "Ощущается как: ${wheather.feelsLike}° C",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 3,
                  ),
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //отображение информации о погоде
                    children: [
                      Text(
                        "Влажность воздуха: ${wheather.humidity}%",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        "Скорость ветра: ${wheather.windSpeed}м/с",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Text(
                        "Дата: ${wheather.date?.day}.${wheather.date?.month}.${wheather.date?.year} ${wheather.date?.hour}:${wheather.date?.minute}",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //кнопка перехода на экран с прогнозом на 3 дня
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Colors.white.withOpacity(0.5))))),
              onPressed: () {
                Navigator.of(context).pushNamed(
                    '/city_weather_widget/three_days_weather_widget');
              },
              child: const Text(
                'Прогноз на 3 дня',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
