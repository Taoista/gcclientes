import 'package:flutter/material.dart';
import 'package:gcclientes/config/router.dart';
import 'package:gcclientes/controllers/controll_gps.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ControllGps controllGps = ControllGps();



  @override
  void initState() {
    super.initState();
    controllGps.determinarPosicion();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title:"gcclientes",
      routerConfig: appRouter(),
      theme:ThemeData(
        useMaterial3: true,
        primaryColor: Colors.purple,
      )
      );
  }
}