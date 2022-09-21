import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/pages/choose_city/widgets/choose_city_widget.dart';

class ChooseCityWidget extends StatefulWidget {
  const ChooseCityWidget({Key? key}) : super(key: key);

  @override
  State<ChooseCityWidget> createState() => _ChooseCityWidgetState();
}

class _ChooseCityWidgetState extends State<ChooseCityWidget> {
  @override
  Widget build(BuildContext context) {
    final _controller = context.read<SearchModel>().textController;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Прогноз погоды')),
      ),
      body: chooseCity(context, _controller),
    );
  }
}
