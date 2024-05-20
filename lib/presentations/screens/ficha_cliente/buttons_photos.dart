import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as img;




class ButtonsPhotos extends StatefulWidget {
  const ButtonsPhotos({super.key});

  @override
  State<ButtonsPhotos> createState() => _ButtonsPhotosState();
}

class _ButtonsPhotosState extends State<ButtonsPhotos> {

  final ImagePicker _picker = ImagePicker();
  // ? Primera photo
  XFile? _firstPhoto;
  XFile? _secondPhoto;
  // List<XFile?> listPhoto = [];

  Future<void> _capturePhoto() async {
    try {
      var data =_firstPhoto = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _firstPhoto = data;
      });
    } catch (e) {
      print('Error al tomar la foto: $e');
    }
  }

  Future<void> _captureSecondPhoto() async {
    try {
      var data =_secondPhoto = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _secondPhoto = data;
      });
    } catch (e) {
      print('Error al tomar la foto: $e');
    }
  }

  Uint8List convertImageToUint8List(img.Image image) {
    return Uint8List.fromList(img.encodePng(image));
  }

  // Función para redimensionar la imagen
  img.Image resizeImage(img.Image image, int width) {
    return img.copyResize(image, width: width);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

      // * primer boton
      _firstPhoto == null ? ElevatedButton(
        onPressed: _capturePhoto,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBGlIGHT, // Puedes ajustar el color del botón según tus necesidades
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
          minimumSize: const Size(20, 50), // Ancho mínimo y altura del botón
        ),
        child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
      ) : 
      Stack(
      children: [
        ClipOval(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image.memory(
              convertImageToUint8List(
                resizeImage(
                  img.decodeImage(File(_firstPhoto!.path).readAsBytesSync())!,
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
          child: Icon(Icons.remove_circle, size: 20, color: Colors.red), // Cambié el ícono a un ojo
        ),
      ],
    ),
      // * segundo boton
    ElevatedButton(
      onPressed: _captureSecondPhoto,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBGlIGHT, // Puedes ajustar el color del botón según tus necesidades
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        minimumSize: const Size(20, 50), // Ancho mínimo y altura del botón
      ),
        child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
      ),
             
      ElevatedButton(
        onPressed: () {
          print(_firstPhoto);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue, backgroundColor: Colors.white, // Establece el color del borde
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: const BorderSide(color: colorBGlIGHT), // Establece el color del borde
          ),
          minimumSize: const Size(20, 50), // Ancho mínimo y altura del botón
        ),
        child: const Icon(Icons.add, color: colorBGlIGHT),
      ),
    ],
    ),
    );
  }
}