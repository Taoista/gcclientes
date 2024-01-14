import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';






class BottonTakePhoton extends StatelessWidget {
  final int position;
  final ValueChanged<int> onCapturePhoto;
  const BottonTakePhoton({super.key, required this.position, required this.onCapturePhoto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: () async {
            // await _capturePhoto(position);
            onCapturePhoto(position);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colorBGlIGHT, // Puedes ajustar el color del botón según tus necesidades
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
            minimumSize: const Size(20, 50), // Ancho mínimo y altura del botón
          ),
          child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
        );
  }
}