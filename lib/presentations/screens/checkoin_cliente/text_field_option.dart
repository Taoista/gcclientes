import 'package:flutter/material.dart';





class TextFieldOption extends StatefulWidget {
  final int idFormulario;
  const TextFieldOption({super.key, required this.idFormulario});

  @override
  State<TextFieldOption> createState() => _TextFieldOptionState();
}

class _TextFieldOptionState extends State<TextFieldOption> {
  @override
  Widget build(BuildContext context) {
    return TextField(
              decoration: InputDecoration(
                // labelText: 'Ingrese su texto',
                border: OutlineInputBorder(),
              ),
            );
  }
}