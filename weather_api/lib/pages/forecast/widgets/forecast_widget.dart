import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/models/weather_model.dart';

class ForecastWidget extends StatelessWidget {
  //виджет отображения погоды на 3 дня
  const ForecastWidget({
    Key? key,
    required this.iconCode,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.date,
  }) : super(key: key);
  final double? temperature;
  final int? humidity;
  final double? windSpeed;
  final String? iconCode;

  final String? date;
  @override
  Widget build(BuildContext context) {
    String? city = context.read<SearchModel>().city;
    final style = TextStyle(
      color: Colors.white.withOpacity(0.9),
      fontSize: 35,
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlue,
            width: 3,
          ),
          color: Colors.white.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
              Radius.circular(16.0) //                 <--- border radius here
              ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$date",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              children: [
                const Icon(
                  Icons.thermostat,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  "  $temperature°C",
                  style: style,
                ),
              ],
            ),
            Row(
              children: [
                Image.network(
                  "http://openweathermap.org/img/wn/${iconCode}@2x.png",
                  scale: 2,
                ),
                Text(
                  "  $humidity%",
                  style: style,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.air,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  "  $windSpeed м/с",
                  style: style,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
