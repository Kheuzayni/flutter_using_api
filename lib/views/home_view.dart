import 'package:flutter/material.dart';

import '../model/api_response.dart';
import '../model/geo_position.dart';
import '../services/api_service.dart';
import '../services/data_services.dart';
import '../services/location_service.dart';
import 'add_city_view.dart';
import 'forecast_view.dart';
import 'my_drawer.dart';
import 'no_data_view.dart';


class HomeView extends StatefulWidget {

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeView> {

  GeoPosition? userPosition;
  GeoPosition? positionToCall;

  List<String> cities = [];
  APIResponse? apiResponse;

  @override
  void initState() {
    getUserLocation();
    updateCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(positionToCall?.city ?? "Ma météo"),),
        drawer: MyDrawer(
          myPosition: userPosition,
          cities: cities,
          onTap: onTap,
          onDelete: removeCity,
        ),
        body: Column(
          children: [
            AddCityView(onAddCity: onAddCity),
            Expanded(
                child: (apiResponse == null)
                    ? NoDataView()
                    : ForecastView(response: apiResponse!)
            )
          ],
        )
    );
  }

  //Obtenir position GPS
  getUserLocation() async {
    final loc = await LocationService().getCity();
    if (loc != null) {
      setState(() {
        userPosition = loc;
        positionToCall = loc;
      });
      callApi();
    }
  }

  //CallApi
  callApi() async {
    if (positionToCall == null) return;
    apiResponse = await ApiService().callApi(positionToCall!);
    setState(() {
    });
  }

  //Nouvelle ville
  onTap(String string) async {
    Navigator.of(context).pop();
    removeKeyboard();
    if (string == userPosition?.city) {
      positionToCall = userPosition;
      callApi();
    } else {
      positionToCall = await LocationService().getCoordsFromCity(string);
      callApi();
    }
  }

  removeKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //Ajouter
  onAddCity(String string) async {
    DataServices().addCity(string).then((onSuccess) => updateCities());
    removeKeyboard();
  }

  //Supprimer
  removeCity(String string) async {
    DataServices().removeCity(string).then((onSuccess) => updateCities());
  }


  //Mettre à jour les villes
  updateCities() async {
    cities = await DataServices().getCities();
    setState(() {});
  }

}

