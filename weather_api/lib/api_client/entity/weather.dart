class Weather {
  // модель данных погоды
  final String? message;
  final DateTime? date;
  final double? temp;
  final double? feelsLike;
  final double? low;
  final double? high;
  final String? city;
  final int? humidity;
  final String? iconCode;
  final double? windSpeed;

  Weather({
    this.iconCode,
    this.message,
    this.date,
    this.windSpeed,
    this.temp,
    this.humidity,
    this.feelsLike,
    this.low,
    this.high,
    this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    //метод декодинга данных  погоды на день json
    return Weather(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      windSpeed: json['wind']['speed'],
      humidity: json['main']['humidity'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      city: json['name'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}

class DailyWeather {
  //модель данных погоды по дням
  final String? message;
  final String? date;
  final double? temp;
  final double? feelsLike;
  final String? iconCode;
  final String? city;
  final int? humidity;
  final double? windSpeed;

  DailyWeather({
    this.iconCode,
    this.message,
    this.date,
    this.windSpeed,
    this.temp,
    this.humidity,
    this.feelsLike,
    this.city,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    //метод декодинга данных погоды по дням json
    return DailyWeather(
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'].toInt(),
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      city: json['name'],
      date: json['dt_txt'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}
