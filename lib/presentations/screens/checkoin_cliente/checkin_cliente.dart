import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/my_boton_nav.dart';
import 'package:geoclientes/widget/mi_drawer.dart';


class CheckinCliente extends StatelessWidget {
  static const String name = "checkin_cliente";


  const CheckinCliente({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;

    return Scaffold(
       backgroundColor: colorBG,
        drawer: MiDrawer(),
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('GCclientes', style: TextStyle(color: Colors.white)),
        ),
        body: Container(child: 
          Center(child: Text('hola'),),
        ),
         bottomNavigationBar: MyBotonNav(currentIndex: _currentIndex,),
    );
  }
}