// import 'package:shared_preferences/shared_preferences.dart';

// class LoginUser {
//   late final String usuario;
//   late final String nombre;
//   late final String apellido;
//   late final int idRol;
//   late final String rol;
//   final String email;
  

//   LoginUser({required this.usuario, required this.nombre, required this.apellido, required this.idRol, required this.rol,required this.email}) {
//     SharedPreferences? _prefs;

//     cargarPreferencias();
//   }

//    cargarPreferencias() async{
//     _prefs = await SharedPreferences.getInstance();
//   }

//   createSession(){
//      _prefs!.setString('usuario', email);
//     _prefs!.setString('nombre', nombre);
//     _prefs!.setString('apellido', apellido);
//     _prefs!.setInt('id_rol', idRol);
//     _prefs!.setString('rol', rol);
//   }


//   stateSession() async{
//     _prefs = await SharedPreferences.getInstance();
//     print(_prefs!.getString('usuario'));
//   }

// }