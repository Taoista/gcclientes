import 'package:flutter/material.dart';





class BottomContent extends StatelessWidget {
  const BottomContent({super.key});

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
                onPressed: () {
                  // Acciones cuando se presiona el botón
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