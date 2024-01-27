import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/config/crear_clientes/slider_credito.dart';
import 'package:geoclientes/config/crear_clientes/slider_datos_bancarios.dart';
import 'package:geoclientes/config/crear_clientes/slider_forma_condiciones_pago.dart';
import 'package:geoclientes/config/crear_clientes/slider_referencia_comercial.dart';
import 'package:geoclientes/config/crear_clientes/slider_verificacion_datos.dart';
import 'package:geoclientes/presentations/screens/create_cliente/credito.dart';
import 'package:geoclientes/presentations/screens/create_cliente/datos_bancarios.dart';
import 'package:geoclientes/presentations/screens/create_cliente/forma_condicio_pago.dart';
import 'package:geoclientes/presentations/screens/create_cliente/referencias_comerciales.dart';
import 'package:geoclientes/presentations/screens/create_cliente/verificacion_datos.dart';
import 'package:geoclientes/widget/mi_drawer.dart';




class CrearClientesScreen extends StatelessWidget {
  static const String name = "CrearClientesScreen";

  const CrearClientesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    PageController pageController = PageController();

    

    return Scaffold(
        backgroundColor: colorGREYwhite,
        drawer: const MiDrawer(),
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('Crear Cliente', style: TextStyle(color: Colors.white)),
        ),
        body:PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          // Cambia el contenido de cada página según sea necesario.
          return buildPage(index,pageController);
        },
      )
      );
  }

  Widget buildPage(int index, PageController pageController) {

    switch (index) {
      case 0:
        return VerificacionDatos(indexPage: index, pageController: pageController,listaVerificacionDatos:listaVerificacionDatos);
      case 1:
        return Credito(indexPage: index, pageController: pageController, listadoDatosCredito:listadoDatosCredito,);
      case 2:
        return ReferenciasComerciales(indexPage: index,pageController: pageController,listReferenciasComerciales: listReferenciasComerciales,);
      case 3:
        return DatosBancarios(indexPage: index, pageController: pageController,listaDatosBancarios: listaDatosBancarios);
      case 4:
        return FormaCodicionPago(indexPage: index, pageController: pageController, listaFormaPago: formaCondicionesPago);
      
      default:
        throw Exception("Página no encontrada");
    }
  }

}