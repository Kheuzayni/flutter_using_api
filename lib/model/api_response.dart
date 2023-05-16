

import '../services/data_converter.dart';

class APIResponse {
  String cod;
  int message;
  int cnt;
  List<Forecast> list;

  APIResponse(this.cod, this.message, this.list, this.cnt);

  APIResponse.fromJson(Map<String, dynamic> map) :
        cod = map["cod"],
        message = map["message"],
        cnt = map["cnt"],
        list = DataConverter().listMappable(map["list"]).map((e) => Forecast.fromJson(e)).toList();
}

class Forecast {
  int dt;
  Main main;
  List<Weather> weather;
  Wind wind;
  Clouds clouds;
  int visibility;
  String dt_txt;

  Forecast(
      this.dt,
      this.main,
      this.weather,
      this.wind,
      this.clouds,
      this.visibility,
      this.dt_txt
      );
  Forecast.fromJson(Map<String, dynamic> map):
        dt = map["dt"],
        main = Main.fromJson(map["main"]),
        weather = DataConverter().listMappable(map["weather"]).map((e) => Weather.fromJson(e)).toList(),
        wind = Wind.fromJson(map["wind"]),
        clouds = Clouds.fromJson(map["clouds"]),
        visibility = map["visibility"],
        dt_txt = map["dt_txt"];
}

class Main {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double pressure;
  double sea_level;
  double grnd_level;
  double humidity;
  double temp_kf;

  Main(
      this.temp,
      this.temp_max,
      this.temp_min,
      this.temp_kf,
      this.humidity,
      this.grnd_level,
      this.sea_level,
      this.pressure,
      this.feels_like
      );

  Main.fromJson(Map<String, dynamic> map):
        temp = map["temp"].toDouble(),
        temp_max = map["temp_max"].toDouble(),
        temp_min = map["temp_min"].toDouble(),
        temp_kf = map["temp_kf"].toDouble(),
        humidity = map["humidity"].toDouble(),
        grnd_level = map["grnd_level"].toDouble(),
        sea_level = map["sea_level"].toDouble(),
        pressure = map["pressure"].toDouble(),
        feels_like = map["feels_like"].toDouble();
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather(
      this.id,
      this.main,
      this.description,
      this.icon
      );

  Weather.fromJson(Map<String, dynamic> map):
        id = map["id"],
        main = map["main"],
        description = map["description"],
        icon = map["icon"];
}

class Clouds {
  int all;
  Clouds(this.all);
  Clouds.fromJson(Map<String, dynamic> map): all = map["all"];
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind(
      this.speed,
      this.deg,
      this.gust
      );

  Wind.fromJson(Map<String, dynamic> map):
        speed = map["speed"].toDouble(),
        deg = map["deg"],
        gust = map["gust"].toDouble();
}


