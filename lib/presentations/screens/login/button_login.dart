import 'package:flutter/material.dart';
import 'package:geoclientes/controllers/controll_session.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ButtonLogin extends StatefulWidget {
  TextEditingController user;
  TextEditingController password;

  ButtonLogin({super.key,
                required this.user, 
                required this.password});

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {

  SharedPreferences? _prefs;

  bool stateButton = true;

  void chagetLoading(state){
    setState(() {
      stateButton = state;
    });
  }

  
  

  cargarPreferencias() async{
    _prefs = await SharedPreferences.getInstance();
    if(_prefs!.getString('usuario') != null){
      context.push('/vendedores');
    }
  }

  @override
  void initState() {
    super.initState();
    cargarPreferencias();
  }

  @override
  Widget build(BuildContext context) {
    return stateButton ? ElevatedButton(
      onPressed: () async {
        chagetLoading(true);
        String user = widget.user.text;
        String password = widget.password.text;
        if(user == "" || password == ""){
          errorEmptyForm(context);
          chagetLoading(true);
        }else{
          chagetLoading(false);
          ControllSession response = ControllSession(usuario: user, password: password); 
          Map<String,dynamic> data = await response.setLogin();
          if(data['response'] == 'ok'){
          if(data['estado_usuario'] == 1 && data['estado_vendedor'] == 1 && data['access_gc'] == 1){
            _prefs!.setString('usuario', user);
            _prefs!.setString('nombre', data['apellido']);
            _prefs!.setString('apellido', data['apellido']);
            _prefs!.setInt('id_rol', data['id_rol']);
            _prefs!.setString('rol', data['rol']);
            _prefs!.setString('url_photo', data['url_photo']);
            context.push('/vendedores');
          }else{
            errorContactAdmin(context);
          }
          }else{
            errorLoadingData(context, 'Error');
            
          }
            chagetLoading(true);

            } 
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0), backgroundColor: const Color(0xFF00BEB7), // Color del fondo del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Radio de las esquinas
            ),
          ),
          child: const Text(
            'INICIAR',
            style: TextStyle(
              color: Colors.white, // Color del texto
            ),
          ),
        ) : ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10.0), 
              backgroundColor: const Color(0xFF00BEB7), // Color del fondo del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Radio de las esquinas
              ),
            ),
            child:  const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
  }
}

    void errorEmptyForm(BuildContext context) {
    // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return an AlertDialog
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Debe llenar todos los campos para continuar."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo
                },
              ),
            ],
          );
        },
      );
    }

    void errorContactAdmin(BuildContext context) {
    // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return an AlertDialog
          return AlertDialog(
            title: const Text("Alerta"),
            content: const Text("Contactate con el Admin"),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo
                },
              ),
            ],
          );
        },
      );
    }

    void errorLoadingData(BuildContext context,String msg) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return an AlertDialog
          return AlertDialog(
            title: const Text("Alerta"),
            content: Text(msg),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo
                },
              ),
            ],
          );
        },
      );
    }