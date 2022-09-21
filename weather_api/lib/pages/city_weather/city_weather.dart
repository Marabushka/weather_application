import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/pages/city_weather/widgets/weather_page.dart';

class CityWeatherWidget extends StatefulWidget {
  @override
  _CityWeatherWidgetState createState() => _CityWeatherWidgetState();
}

class _CityWeatherWidgetState extends State<CityWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Прогноз погоды')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      //выведение данных и обработка ошибок
      body: SafeArea(
          child: Center(
        child: FutureBuilder<Weather?>(
            future: context.read<SearchModel>().getCurrentWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.message != null) {
                  return Text("${snapshot.data?.message}");
                } else {
                  return WeatherPage(wheather: snapshot.data!);
                }
              } else if (snapshot.data?.message == 'Ошибка получения данных') {
                return Text(
                  "${snapshot.data?.message}",
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Попробуйте еще раз или подождите'),
                ],
              );
            }),
      )),
    );
  }
}
