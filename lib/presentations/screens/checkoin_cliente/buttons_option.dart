import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';




class ButtonsOption extends StatefulWidget {

  final int idFormulario;

  const ButtonsOption({super.key, required this.idFormulario});

  @override
  State<ButtonsOption> createState() => _ButtonsOptionState();
}

class _ButtonsOptionState extends State<ButtonsOption> {
  bool inPressedA = false;
  bool inPressedB = false;

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
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorBGlIGHT, // Fondo verde
                      borderRadius: BorderRadius.circular(30.0), // Borde circular
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Cambiado a color blanco
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: colorBGlIGHT, // Cambiado a color verde
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
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
                  inPressedA = !inPressedA;
                  inPressedB = false;
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
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorBGlIGHT, // Fondo verde
                      borderRadius: BorderRadius.circular(30.0), // Borde circular
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Cambiado a color blanco
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: colorBGlIGHT, // Cambiado a color verde
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
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