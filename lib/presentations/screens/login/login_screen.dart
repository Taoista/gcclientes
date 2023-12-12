import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcclientes/config/login_user.dart';
import 'package:gcclientes/controllers/controll_session.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginScreen extends StatefulWidget {
  static const String name = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  SharedPreferences? _prefs;

  bool sendLoading = true;

  @override
  void initState() {
    super.initState();
    cargarPreferencias();
  }

  cargarPreferencias() async{
    _prefs = await SharedPreferences.getInstance();
    if(_prefs!.getString('usuario') != null){
      context.push('/vendedores');
    }
  }

  @override
  Widget build(BuildContext context) {

  TextEditingController _textFieldUser = TextEditingController();
  TextEditingController _textFieldPassword = TextEditingController();




    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 850,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_2.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top:0,
                    right: 40,
                    width: 50,
                    height: 200,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/top_green.png')
                        )
                      ),
                    )),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    width: 80,
                    height: 200,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yellow_left.png')
                        )
                      ),
                    )),
                  ),
                  Container(
                      width: double.infinity, // Ancho máximo disponible
                      height: double.infinity, // Altura máxima disponible
                      child: Stack(
                        children: [
                          Positioned(
                            top: 120, // Centrar verticalmente
                            left: (MediaQuery.of(context).size.width - 80) / 2, // Centrar horizontalmente
                            width: 100,
                            height: 150,
                            child: FadeInUp(
                              duration: const Duration(milliseconds: 1200),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/icon.png'),
                                    fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Positioned(
                  //   right: 40,
                  //   top: 120,
                  //   width: 60,
                  //   height: 150,
                  //   child: FadeInUp(duration: const  Duration(milliseconds: 1300), child: Container(
                  //     decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage('assets/images/top_white.png')
                  //       )
                  //     ),
                  //   )),
                  // ),
                  Positioned(
                    left: MediaQuery.of(context).size.width /2 -120,
                    // top: MediaQuery.of(context).size.height / 2 - 130,
                    top: 225,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'GEO',
                                  style: TextStyle(fontFamily: 'RobotoBlack'), // Estilo de fuente para 'Geo'
                                ),
                                TextSpan(
                                  text: 'CLIENTES',
                                  style: TextStyle(fontFamily: 'RobotoLight'), // Estilo de fuente para 'Clientes'
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                   Positioned(
                    top: 350,
                    right: (MediaQuery.of(context).size.width * 0.1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: 200,
                    child: FadeInUp(duration: const  Duration(milliseconds: 1300), child: TextField(
                      controller: _textFieldUser,
                      style: const TextStyle(color: Colors.black), // Color del texto dentro del TextField
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 0.5), // Fondo blanco transparente (ajusta la opacidad según tus necesidades)
                        hintText: 'EMAIL',
                        hintStyle: const TextStyle(color: Colors.white, fontFamily: 'Roboto'), // Color del texto de sugerencia
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.black), 
                          borderSide: BorderSide.none
                        ),
                      ),
                    ),
                    ),
                  ),
                  Positioned(
                    top: 430,
                    right: (MediaQuery.of(context).size.width * 0.1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: 200,
                    child: FadeInUp(duration: const  Duration(milliseconds: 1300), child: TextField(
                      obscureText: true,
                      controller: _textFieldPassword,
                      style: const TextStyle(color: Colors.black), // Color del texto dentro del TextField
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 0.5), // Fondo blanco transparente (ajusta la opacidad según tus necesidades)
                        hintText: 'PASSWORD',
                        hintStyle: const TextStyle(color: Colors.white, fontFamily: 'Roboto'), // Color del texto de sugerencia
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.black), 
                          borderSide: BorderSide.none
                        ),
                      ),
                    ),
                    ),
                  ),
                  Positioned(
                    top: 520,
                    right: (MediaQuery.of(context).size.width * 0.1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: 200,
                    child: FadeInUp(duration: const  Duration(milliseconds: 1300), child: 
                    sendLoading ? ElevatedButton(
                      onPressed: () async {
                        String user = _textFieldUser.text;
                      String password = _textFieldPassword.text;

                      if(user == "" || password == ""){
                        errorEmptyForm(context);
                      }else{
                        setState(() {
                          sendLoading = true;
                        });
                        ControllSession response = ControllSession(usuario: user, password: password); 
                        Map<String,dynamic> data = await response.setLogin();
                        // ?accesso a la aplicacione
                        if(data['response'] == 'ok'){
                          if(data['estado_usuario'] == 1 && data['estado_vendedor'] == 1 && data['access_gc'] == 1){
                            _prefs!.setString('usuario', _textFieldUser.text);
                            _prefs!.setString('nombre', data['apellido']);
                            _prefs!.setString('apellido', data['apellido']);
                            _prefs!.setInt('id_rol', data['id_rol']);
                            _prefs!.setString('rol', data['rol']);
                            context.push('/vendedores');
                          }else{
                            errorContactAdmin(context);
                            setState(() {
                              sendLoading = false;
                            });
                          }
                        }else{
                          errorLoadingData(context, data['response']);
                           setState(() {
                              sendLoading = false;
                            });
                        }
                      } 
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        primary: Color(0xFF00BEB7), // Color del fondo del botón
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
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        primary: Color(0xFF00BEB7), // Color del fondo del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Radio de las esquinas
                        ),
                      ),
                      child:  CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
                    ),
                    ),
                  ),

                 Positioned(
                    left: 0,
                    right: 0,
                    top: 680,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: Container(
                        width: double.infinity, // Ancho del contenedor igual al del padre
                        child: Center(
                          child: Text(
                            "OLVIDASTE TU PASSWORD?",
                            style: TextStyle(
                              color: Colors.grey.shade400, // Color del texto
                              fontSize: 16.0, // Tamaño de fuente
                              fontWeight: FontWeight.bold, // Peso de la fuente (ajusta según tus preferencias)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }

    void errorEmptyForm(BuildContext context) {
    // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return an AlertDialog
          return AlertDialog(
            title: const Text("Alerta"),
            content: const Text("Debe llenar todos los campos para continuar."),
            actions: [
              TextButton(
                child: Text("OK"),
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

    
}


