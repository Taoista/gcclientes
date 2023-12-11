import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MiDrawer extends StatefulWidget {
  const MiDrawer({super.key});

  @override
  State<MiDrawer> createState() => _MiDrawerState();
}

class _MiDrawerState extends State<MiDrawer> {
  SharedPreferences? _prefs;

  String nombre = "";
  String email = '';

  getDataUaer()async{
    _prefs = await SharedPreferences.getInstance();
    var userName = _prefs!.getString('nombre')!;
    var userApellido = _prefs!.getString('apellido')!;
    setState(() {
      nombre = "$userName $userApellido";
      email = _prefs!.getString('usuario')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUaer();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Encabezado del Drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/wallpaper_header.webp'), // Reemplaza con la ruta de tu imagen
                  ),
                  SizedBox(height: 10),
                  Text(
                    nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Elemento de menú "Inicio"
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                // Lógica cuando se selecciona "Inicio"
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            // Línea de separación
            const Divider(),
            // Elemento de menú "Cerrar Sesión"
            ListTile(
              title: const Text('Cerrar Sesión'),
              onTap: () {
                _prefs!.remove('usuario');
                _prefs!.remove('nombre');
                _prefs!.remove('apellido');
                _prefs!.remove('id_rol');
                _prefs!.remove('rol');
                context.push("/login");
              },
            ),
          ],
        ),
      );
  }
}