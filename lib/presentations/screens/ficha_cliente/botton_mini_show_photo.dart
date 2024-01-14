import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class BottonMiniShowPhoto extends StatelessWidget {
  final XFile? imgPhoto;

  const BottonMiniShowPhoto({Key? key, required this.imgPhoto}) : super(key: key);

  Uint8List convertImageToUint8List(img.Image image) {
    return Uint8List.fromList(img.encodePng(image));
  }

  img.Image resizeImage(img.Image image, int width) {
    return img.copyResize(image, width: width);
  }

  @override
  Widget build(BuildContext context) {
    // Verificar si imgPhoto es nulo y si tiene un path válido
    final imagePath = imgPhoto?.path;

    if (imagePath != null && File(imagePath).existsSync()) {
      return Stack(
        children: [
          ClipOval(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: Image.memory(
                convertImageToUint8List(
                  resizeImage(
                    img.decodeImage(File(imagePath).readAsBytesSync())!,
                    200,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: Icon(Icons.remove_circle, size: 20, color: Colors.red),
          ),
        ],
      );
    } else {
      // Puedes devolver un widget alternativo si no hay una imagen válida
      return const SizedBox(); // O cualquier otro widget según tu necesidad
    }
  }
}
