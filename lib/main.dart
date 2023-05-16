import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma_meteo/views/home_view.dart';

void main() {
  //Assurer l'init
  WidgetsFlutterBinding.ensureInitialized();
  //Vouloir uniquement en portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                headlineLarge: TextStyle(fontSize: 75, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                headlineMedium: TextStyle(fontSize: 30, color: Theme.of(context).primaryColorDark),
                headlineSmall: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic)
            )
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView()
    );
  }
}