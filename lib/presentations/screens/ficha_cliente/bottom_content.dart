import 'package:flutter/material.dart';
import 'package:gcclientes/controllers/controll_gps.dart';
import 'package:gcclientes/controllers/controll_send_visita.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
// import 'package:permission_handler/permission_handler.dart';



class BottomContent extends StatefulWidget {
  final String codigoCliente;
  final String emailVendedor;
  const BottomContent({super.key, required this.codigoCliente, required this.emailVendedor});
  
  @override
  State<BottomContent> createState() => _BottomContentState();
}

class _BottomContentState extends State<BottomContent> {

  ControllGps controllGps = ControllGps();

  String latitud = "";
  String longitud = "";


  Future getCurrentLocation() async {
    Position position = await controllGps.determinarPosicion();
    latitud = position.latitude.toString();
    longitud = position.longitude.toString();
  }

  @override
  void initState() {
    super.initState();
    controllGps.determinarPosicion();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
     TextEditingController textarea = TextEditingController();
    return Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: //<Widget>[bottomContentText, readButton],
          <Widget>[
            const Text(
              "Nota",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
             TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                 style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration( 
                    hintText: "Agregar nota",
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white24)
                    )
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              width: MediaQuery.of(context).size.width,
              child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  String nota = textarea.text;             
        
                  if(nota == ""){
                    _msgError();
                  }else{
                    var visita = ControllSendVisita(emailVendedor: widget.emailVendedor, codigoCliente: widget.codigoCliente, latitud: latitud, longitud: longitud, nota: nota);
                    await visita.sendData();
                    textarea.text = "";
                    _msgSendOk();
                    Future.delayed(const Duration(seconds: 3), () {
                      context.push("/list_client");
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFd8d9dd), backgroundColor: const Color(0xFF4c5464), // Color del texto
                ),
                child: const Text('Enviar'),
              ),
            )
            )
          ],
        ),
      ),
    );
  }

  Future<void> _msgError() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nota.'),
                Text('Debe agregar una nota para continuar'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _msgSendOk() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Envio'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nota.'),
                Text('Se enviuo correctamente'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                 context.push("/list_client");
              },
            ),
          ],
        );
      },
    );
  }

}