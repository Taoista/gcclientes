import 'package:flutter/material.dart';



class TextFieldOption extends StatefulWidget {
  final int idFormulario;
  dynamic optionSelected;
  final int indexOption;
  final TextEditingController textController;


  TextFieldOption({super.key, required this.idFormulario, required this.optionSelected, required this.indexOption, required this.textController});

  @override
  State<TextFieldOption> createState() => _TextFieldOptionState();
}

class _TextFieldOptionState extends State<TextFieldOption> {

  @override
  Widget build(BuildContext context) {
    return TextField(
            onChanged: (value){
              // widget.optionSelected[widget.optionSelected.length] = value;
              widget.optionSelected[widget.indexOption] = {
                'id_formulario':widget.idFormulario, "option_1": value, "option_2": true 
                // widget.indexOption: { 'id_formulario':widget.idFormulario, "value":value} 
                };
            },
            controller: widget.textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            );
  }
}