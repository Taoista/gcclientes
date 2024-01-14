import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/botton_mini_show_photo.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/botton_take_photo.dart';

import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';


class ButtonsPhotos2 extends StatefulWidget {

  List<XFile?> listPhoto;

  ButtonsPhotos2({Key? key, required this.listPhoto}) : super(key: key);

  @override
  State<ButtonsPhotos2> createState() => _ButtonsPhotos2State();
}

class _ButtonsPhotos2State extends State<ButtonsPhotos2> {

  int cantPhoto = 3;
  final ImagePicker _picker = ImagePicker();
  XFile? _firstPhoto;

  List<bool> listLoading = [];

  void addPhoto(){
    bool noContieneNull = widget.listPhoto.every((element) => element != null);
    if(noContieneNull){
       setState(() {
        cantPhoto += 1;
        widget.listPhoto.add(null);
        listLoading.add(false);
      });
    }else{
      _minFotos(context);
    }
  }

  Future<void> _capturePhoto(index) async {
    setState(() {
      listLoading[index] = true;
    });
    _firstPhoto = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      listLoading[index] = false;      
      widget.listPhoto[index] = _firstPhoto;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.listPhoto.add(null);
    widget.listPhoto.add(null);
    widget.listPhoto.add(null);
    listLoading.add(false);
    listLoading.add(false);
    listLoading.add(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            // ? scorell donde contiene las fotos
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  cantPhoto,
                  (index) => Container(
                    margin: const EdgeInsets.all(8.0),
                    child: widget.listPhoto[index] == null ? 
                    listLoading[index] == true ?
                    Stack(
                      children: [
                          ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorBGlIGHT,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              minimumSize: const Size(20, 50),
                            ),
                            child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                          ),
                          if (true)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ):
                      // ? boton para sacar la foto
                      BottonTakePhoton(position: index, onCapturePhoto:(index) {
                        _capturePhoto(index);
                      },)
                      : 
                      BottonMiniShowPhoto(imgPhoto: _firstPhoto)
                  ),
                ),
              )
            ),
            // ? insertar boton para agregar mas fotos
            ElevatedButton(
              onPressed: () {
               addPhoto();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, primary: Colors.white, // Establece el color del borde
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  side: const BorderSide(color: colorBGlIGHT), // Establece el color del borde
                ),
                minimumSize: const Size(20, 50), // Ancho mínimo y altura del botón
              ),
              child: const Icon(Icons.add, color: colorBGlIGHT),
            ),
          ],
        );
  }
}


void _minFotos(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Debe tomar mas fotos para poder continuar'),
          actions: [
            // Botón para cerrar la alerta
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }