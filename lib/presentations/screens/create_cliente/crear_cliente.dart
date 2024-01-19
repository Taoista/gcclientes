import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/widget/mi_drawer.dart';




class CrearCliente extends StatelessWidget {
  static const String name = "CrearCliente";

  const CrearCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBG,
        drawer: const MiDrawer(),
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('Crear Cliente', style: TextStyle(color: Colors.white)),
        ),
      body: Container(child: Center(child: Text('hola mundo'),),),);
  }

  
  

}