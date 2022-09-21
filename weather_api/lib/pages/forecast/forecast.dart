import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/api_client/entity/weather.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/pages/forecast/widgets/three_days_weather_widget.dart';

class ThreeDaysWidget extends StatefulWidget {
  @override
  _ThreeDaysWidgetState createState() => _ThreeDaysWidgetState();
}

class _ThreeDaysWidgetState extends State<ThreeDaysWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Прогноз на 3 дня')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: SafeArea(
          child: Center(
        child: FutureBuilder<List<DailyWeather>>(
            future: context.read<SearchModel>().fetchDailyWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.first.message == 'city not found') {
                  return Text("Город не найден");
                } else {
                  return ThreeDaysWeatherWidget(dailyWeather: snapshot.data!);
                }
              } else if (snapshot.hasError) {
                return Text("{$snapshot.error}");
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
