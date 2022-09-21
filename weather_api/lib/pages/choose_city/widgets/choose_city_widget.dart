import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_api/models/weather_model.dart';

Stack chooseCity(BuildContext context, TextEditingController _controller) {
  //виджет экрана поиска
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
      //гиф
      Column(
        children: [
          const Image(
            image: AssetImage('assets/images/gif5.gif'),
          ),
          const SizedBox(
            height: 20,
          ),
          //виджет поиска
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textCapitalization: TextCapitalization.words,
              onEditingComplete: () => //сохранение названия города
                  context.read<SearchModel>().changeCity(context),
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.sunny, color: Colors.yellow),
                border: const OutlineInputBorder(),
                hintText: 'Введите ваш город',
                errorText: context.watch<SearchModel>().errorMessage,
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          //кнопка подтвердить
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side:
                            BorderSide(color: Colors.white.withOpacity(0.5))))),
            onPressed: () {
              context.read<SearchModel>().changeCity(context);
            },
            child: const Text(
              'Подтвердить',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    ],
  );
}
