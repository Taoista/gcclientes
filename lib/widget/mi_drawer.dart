// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
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
  String email = "";
  String photo = "";

  bool isLoadingPhoto = true;

  getDataUaer()async{
    _prefs = await SharedPreferences.getInstance();
    var userName = _prefs!.getString('nombre')!;
    var userApellido = _prefs!.getString('apellido')!;
    setState(() {
      nombre = "$userName $userApellido";
      email = _prefs!.getString('usuario')!;
      photo = _prefs!.getString('url_photo')!;
      isLoadingPhoto = false;
      print(photo);
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
              decoration: const BoxDecoration(
                color: colorBGlIGHT,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    // backgroundImage: AssetImage('assets/images/icon-yellow-user.png'), // Reemplaza con la ruta de tu imagen
                    backgroundImage: Image.network(photo).image, // Reemplaza con la ruta de tu imagen
                  ),
                  // isLoadingPhoto ? CachedNetworkImage(
                  //   imageUrl: 'https://buk-cluster-enterprise-chile.s3.amazonaws.com/neumachile/person/picture_url/834/0b3eeb56-8a8c-46d5-8e60-8763c679d0a1-168039336.jpg.jpg',
                  //   imageBuilder: (context, imageProvider) => CircleAvatar(
                  //     radius: 40,
                  //     backgroundImage: imageProvider,
                  //   ),
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ) : CircularProgressIndicator(),
                  const SizedBox(height: 10),
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
              title: const Text('Inicio'),
              onTap: () {
                context.push("/vendedores");
              },
            ),
             ListTile(
              title: const Text('Buscar Cliente'),
              onTap: () {
                context.push("/buscar_clientes_all");
              },
            ),
          
            ListTile(
              title: const Text('Crear Cliente'),
              onTap: () {
                context.push("/crear_cliente");
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
                _prefs!.remove('url_photo');

                context.push("/login");
              },
            ),
          ],
        ),
      );
  }
}