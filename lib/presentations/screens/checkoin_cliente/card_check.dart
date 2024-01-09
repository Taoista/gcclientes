import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/presentations/screens/checkoin_cliente/buttons_option.dart';
import 'package:geoclientes/presentations/screens/checkoin_cliente/text_field_option.dart';



class CardCheck extends StatelessWidget {

  final String title;
  final int idFormulario;
  final String tipo;

  const CardCheck({
    Key? key, // Agrega el parámetro 'key' y asegúrate de pasarla al constructor de la clase base
    required this.title,
    required this.idFormulario,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
      child: SizedBox(
        height: 170, // Ajusta la altura según tus necesidades
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupa todo el ancho
          children: [
            Container(
              decoration: const BoxDecoration(
                color: colorGREY, // Fondo amarillo
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0), // Radio en la esquina superior izquierda
                  topRight: Radius.circular(10.0), // Radio en la esquina superior derecha
                ),
              ),
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black54, // Texto oscuro
                    fontFamily: 'RobotoMedium',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            if (tipo == 'checkbox')  ButtonsOption(idFormulario: idFormulario),
            if (tipo == 'text')  TextFieldOption(idFormulario: idFormulario)
          ],
        ),
      ),
    );
  }
}