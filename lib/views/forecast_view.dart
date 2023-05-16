import 'package:flutter/material.dart';
import '../model/api_response.dart';
import '../services/data_converter.dart';
import 'current_weather.dart';
import 'daily_tile.dart';

class ForecastView extends StatelessWidget {
  final APIResponse response;

  ForecastView({required this.response});

  @override
  Widget build(BuildContext context) {
    List byDay = DataConverter().byDay(response);
    return Column(
      children: [
        Currentweather(forecast: response!.list.first),
        Expanded(child: ListView.builder(
            itemBuilder: ((context, index) => DailyTile(day: byDay[index])),
            itemCount: byDay.length)
        )
      ],
    );
  }
}