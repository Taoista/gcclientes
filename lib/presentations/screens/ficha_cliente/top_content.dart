import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';


class TopContent extends StatelessWidget {

  final String nombre;
  final String rut;
  final String codigo;
  final String telefono;
  final String pContacto;


  const TopContent({super.key, required this.nombre, required this.rut, required this.codigo, required this.telefono, required this.pContacto});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // ? iamgen
        Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: 400.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background-client.png"),
                fit: BoxFit.cover,
              ),
            )
        ),
        // ?
        Container(
          height: 350.0,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 150.0),
                    Text(rut, 
                      style: const TextStyle(
                      color: colorText,
                      fontSize: 15.0,
                      fontFamily: 'RobotoMedium',
                      fontWeight: FontWeight.w500, 
                      ),
                    ),
                    const SizedBox(
                      width: 150.0,
                      child:  Divider(color: colorBG),
                    ),
                    // const SizedBox(height: 0.0),
                    Text(
                      nombre,
                      style: const TextStyle(
                        color: colorText,
                        fontSize: 15.0,
                        fontFamily: 'RobotoMedium', // El nombre de la familia de fuentes definido en el pubspec.yaml
                        fontWeight: FontWeight.w500, // Puedes ajustar el peso de la fuente según tus necesidades
                      ),
                    ),
        // const SizedBox(height: 1000.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5, 
              child: Row(
                children: <Widget>[
                  // ? linea verde
                  const Expanded(
                    flex: 1,
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: 10,
                        valueColor: AlwaysStoppedAnimation(Colors.green)
                      )
                    ),
                  // ? telefono
                  Expanded(
                    flex: 15,
                    child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(telefono,
                        style: const TextStyle(
                        color: colorText,
                        fontSize: 15.0,
                        fontFamily: 'RobotoMedium', // El nombre de la familia de fuentes definido en el pubspec.yaml
                        fontWeight: FontWeight.w500, // Puedes ajustar el peso de la fuente según tus necesidades
                        ),
                        )
                        ),
                      )
                    ],
                )
              ),
              Expanded(
                    flex: 3, 
                    child: Container(
                      height: 40,
                      width: 50,
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
                        child: Text("Puntos", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  )
                ],
                ),
              ],
            ),
          ),
        ),
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                // Imagen principal centrada con margen superior
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/btn-user.png'),
                    ),
                  ),
                ),

                // Segunda imagen en la parte superior derecha
                Positioned(
                  top: 50,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/btn-photo-on.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },

            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }
}