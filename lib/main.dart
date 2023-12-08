import 'package:flutter/material.dart';
import 'package:gcclientes/config/router.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

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