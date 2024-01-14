import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';




class ButtonsOption extends StatefulWidget {

  final int idFormulario;
  dynamic optionSelected;
  final int indexOption;
  

  ButtonsOption({Key? key, required this.idFormulario, required this.optionSelected, required this.indexOption}) : super(key: key);

  @override
  State<ButtonsOption> createState() => _ButtonsOptionState();
}

class _ButtonsOptionState extends State<ButtonsOption> {
  bool inPressedA = false;
  bool inPressedB = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // * OPTION A
        inPressedA ? Expanded(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      inPressedA = !inPressedA;
                      inPressedB = false;
                      widget.optionSelected[widget.indexOption] = {widget.indexOption : {'option_1': false, 'option_2': false}};
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorBGlIGHT, // Fondo verde
                      borderRadius: BorderRadius.circular(30.0), // Borde circular
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Cambiado a color blanco
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: colorBGlIGHT, // Cambiado a color verde
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Si',
                          style: TextStyle(fontSize: 16, color: Colors.white), // Cambiado a color blanco
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 10),
            ],
          ),
        ) 
        :
        // ? boton sin presionar 
        Expanded(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  inPressedA = !inPressedA;
                  inPressedB = false;
                  widget.optionSelected[widget.indexOption] = {widget.indexOption : {'option_1': true, 'option_2': false}};
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorGREY), // Borde del color plomo
                  borderRadius: BorderRadius.circular(30.0), // Borde circular
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colorGREY),
                      ),
                      child: const Center(
                        child: Text(
                          'A',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'No',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
        // * OPTION B
        inPressedB ? Expanded(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      inPressedB = !inPressedB;
                      widget.optionSelected[widget.indexOption] =  {widget.indexOption : {'option_1': false, 'option_2': false}};
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorBGlIGHT, // Fondo verde
                      borderRadius: BorderRadius.circular(30.0), // Borde circular
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Cambiado a color blanco
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: colorBGlIGHT, // Cambiado a color verde
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Si',
                          style: TextStyle(fontSize: 16, color: Colors.white), // Cambiado a color blanco
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ) : Expanded(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  inPressedB = !inPressedB;
                  inPressedA = false;
                  widget.optionSelected[widget.indexOption] = {widget.indexOption : {'option_1': false, 'option_2': true}};
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colorGREY), // Borde del color plomo
                  borderRadius: BorderRadius.circular(30.0), // Borde circular
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colorGREY),
                      ),
                      child: const Center(
                        child: Text(
                          'B',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'No',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      )
      ],
    );
  }
}