import 'package:flutter/material.dart';

class Ddemo extends StatelessWidget {
  static const String name = "demo";

  const Ddemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Container(decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_2.webp'),
                    fit: BoxFit.fill
                  )
                )),);
  }
}