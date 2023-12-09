import 'package:flutter/material.dart';


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
        Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpaper_header.webp"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 120.0),
        // const Icon(
        //   Icons.directions_car,
        //   color: Colors.white,
        //   size: 40.0,
        // ),
        Text(rut, style: const TextStyle(color: Colors.white, fontSize: 15.0),),
         const SizedBox(
          width: 90.0,
          child:  Divider(color: Colors.green),
        ),
        const SizedBox(height: 10.0),
         Text(
          nombre,
          style: const TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Expanded(flex: 3, child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: 10,
                      valueColor: AlwaysStoppedAnimation(Colors.green))),
              Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("89868937",
                        style: const TextStyle(color: Colors.white))),
              )
            ],
          )
          ),
          const Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "-",
                style: TextStyle(color: Colors.white),
              ))),
          Expanded(flex: 3, child: Container(
          padding:  const EdgeInsets.all(7.0),
          decoration:  BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5.0)),
            child:  Text(
            "puntos".toString(),
              style: const TextStyle(color: Colors.white),
              ),
            ),)
          ],
        ),
      ],
    ),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
             print("retroceder");
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }
}