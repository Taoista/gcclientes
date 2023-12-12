import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/controllers/controll_gps.dart';
import 'package:geoclientes/controllers/controll_send_visita.dart';
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

  bool loadingSend = false;

  Future getCurrentLocation() async {
    Position position = await controllGps.determinarPosicion();
    setState(() {
      latitud = position.latitude.toString();
      longitud = position.longitude.toString();
    });
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
      padding: const EdgeInsets.only(left:40.0,right: 40.0, top: 20.0 ),
      child: Center(
        child: Column(
          children: //<Widget>[bottomContentText, readButton],
          <Widget>[
            const Text(
              "Nota",
              style: TextStyle(fontSize: 20.0, color: colorBG, fontFamily: 'RobotoMedium')
            ),
             TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                 style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration( 
                    hintText: "Agregar nota",
                    hintStyle: TextStyle(color: colorBG),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white24)
                    )
                ),
              ),
             Container(
                margin: const EdgeInsets.only(top: 10.0), // Ajusta el valor del margen superior según tus necesidades
                child: const Text(
                  "Agregar imagen",
                  style: TextStyle(fontSize: 15.0, color: colorBG, fontFamily: 'RobotoMedium'),
                  textAlign: TextAlign.left, // Alinea el texto a la izquierda
                ),
              ),
             Container(
              margin: EdgeInsets.only(top: 20.0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                         ElevatedButton(
                onPressed: () {
                  // Lógica cuando se presiona el primer botón
                },
                style: ElevatedButton.styleFrom(
                  primary: colorBGlIGHT, // Puedes ajustar el color del botón según tus necesidades
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  minimumSize: Size(20, 50), // Ancho mínimo y altura del botón
                ),
                child: Icon(Icons.camera_alt_outlined, color: Colors.white),
                         ),
                         ElevatedButton(
                onPressed: () {
                  // Lógica cuando se presiona el primer botón
                },
                style: ElevatedButton.styleFrom(
                  primary: colorBGlIGHT, // Puedes ajustar el color del botón según tus necesidades
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  minimumSize: Size(20, 50), // Ancho mínimo y altura del botón
                ),
                child: Icon(Icons.camera_alt_outlined, color: Colors.white),
                         ),
                         ElevatedButton(
                onPressed: () {
                  // Lógica cuando se presiona el botón
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Establece el color de fondo como transparente
                  onPrimary: Colors.blue, // Establece el color del borde
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    side: BorderSide(color: colorBGlIGHT), // Establece el color del borde
                  ),
                  minimumSize: Size(20, 50), // Ancho mínimo y altura del botón
                ),
                child: Icon(Icons.add, color: colorBGlIGHT),
                         ),
                       ],
                     ),
             ),
             InkWell(
                onTap: () async {
                  // String nota = textarea.text;             
                  // if(nota == ""){
                  //   _msgError();
                  // }else{
                  //   getCurrentLocation();
                  //   setState(() {
                  //     loadingSend = true;
                  //   });
                  //     var visita = ControllSendVisita(emailVendedor: widget.emailVendedor, codigoCliente: widget.codigoCliente, latitud: latitud, longitud: longitud, nota: nota);
                  //     String response = await visita.sendData();
                  //     if(response.replaceAll(RegExp(r'\s+'), '') == "ok"){
                  //         _msgSendOk();
                  //         Future.delayed(const Duration(seconds: 3), (){
                  //           context.push("/list_client");
                  //         });
                  //     }else{
                  //       _msgErrorSEND();
                  //       setState(() {
                  //           loadingSend = false;
                  //       });
                  //     }
                  //     textarea.text = "";
                  // }
                },
                child: 
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                 colorBGlIGHT,
                                colorBGlIGHT,
                                ]
                              )
                            ),
                            child: const Center(
                              child: Text("Enviar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                            ),
                          ),
                   
                
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
          title: const Text('Nota'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nota.'),
                Text('Se envio correctamente'),
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

  Future<void> _msgErrorSEND() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Envio'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Error.'),
                Text('Error al enviar,intente mas tarde'),
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

class RoundIconButton extends StatelessWidget {
  final IconData icon;

  RoundIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 87,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue, // Puedes ajustar el color del botón según tus necesidades
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () {
          // Lógica cuando se presiona el botón
        },
      ),
    );
  }
}