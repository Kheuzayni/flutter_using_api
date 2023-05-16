import 'package:flutter/material.dart';

import '../model/grouped_weather.dart';
import '../services/data_converter.dart';

class DailyTile extends StatelessWidget {

  GroupedWeather day;

  DailyTile({required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 7,
        child: ListTile(
          trailing: Image.network(DataConverter().fromIcon(day.icon)),
          leading: Text(day.day),
          title: Text(day.description),
          subtitle: Text(day.minAndMax()),
        )
    );
  }
}