import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/presentations/screens/checkoin_cliente/buttons_option.dart';
import 'package:geoclientes/presentations/screens/checkoin_cliente/text_field_option.dart';



class CardCheck extends StatefulWidget {

  final String title;
  final int idFormulario;
  final String tipo;
  final dynamic optionSelected;
  final int position;

  final TextEditingController textController;

  const CardCheck({
    Key? key, // Agrega el parámetro 'key' y asegúrate de pasarla al constructor de la clase base
    required this.title,
    required this.idFormulario,
    required this.tipo,
    required this.optionSelected,
    required this.position,
    required this.textController
  }) : super(key: key);

  @override
  State<CardCheck> createState() => _CardCheckState();
}

class _CardCheckState extends State<CardCheck> with AutomaticKeepAliveClientMixin {

  // late TextEditingController _textController;


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _textController = TextEditingController();
  // }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context); 
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
                  widget.title,
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
            
            if (widget.tipo == 'checkbox')  ButtonsOption(idFormulario: widget.idFormulario, optionSelected: widget.optionSelected,indexOption: widget.position,),
            if (widget.tipo == 'text')  TextFieldOption(idFormulario: widget.idFormulario, optionSelected: widget.optionSelected,indexOption: widget.position, textController: widget.textController,),
          ],
        ),
      ),
    );
  }
  //  void dispose() {
  //   _textController.dispose(); // Importante liberar el controlador
  //   super.dispose();
  // }
}