import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:go_router/go_router.dart';

class MyBotonNav extends StatefulWidget {
  final int currentIndex;
  final PageController pageController;
  final int idRegistro;

  const MyBotonNav({super.key, required this.currentIndex, required this.pageController, required this.idRegistro});

  @override
  State<MyBotonNav> createState() => _MyBotonNavState();
}

class _MyBotonNavState extends State<MyBotonNav> {

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

   

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          int idRegistro = widget.idRegistro;
          if(idRegistro == 0){
            _msgError();
          }else{
            setState(() {
              currentIndex = index;
              widget.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_outlined),
            label: 'Otra Pantalla',
          ),
        ],
        selectedItemColor: colorBGlIGHT, // Color cuando el elemento está seleccionado
        unselectedItemColor: Colors.grey, 
        selectedFontSize: 0,  // Tamaño de fuente para el elemento seleccionado
        unselectedFontSize: 0,  // Tamaño de fuente para el elemento no seleccionado
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),  // Estilo de texto para el elemento seleccionado
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal), 
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
                Text('Error.'),
                Text('Debes enviar el Registro para continuar'),
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

}