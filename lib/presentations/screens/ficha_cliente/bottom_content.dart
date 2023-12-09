import 'package:flutter/material.dart';
import 'package:gcclientes/controllers/controll_gps.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';



class BottomContent extends StatefulWidget {
  final String codigoCliente;
  const BottomContent({super.key, required this.codigoCliente});
  
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
    // TODO: implement initState
    super.initState();
    controllGps.determinarPosicion();
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
              "hola",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
             TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                 style: TextStyle(color: Colors.white),
                decoration: const InputDecoration( 
                    hintText: "Agregar nota",
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white24)
                    )
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              width: MediaQuery.of(context).size.width,
              child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  String long = longitud;
                  String lat = latitud;
                  String nota = textarea.text;             
                  String codCliente = widget.codigoCliente;


                  print("capturando gps");
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4c5464), // Color de fondo
                  onPrimary: Color(0xFFd8d9dd), // Color del texto
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
}