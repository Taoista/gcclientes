import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:geoclientes/config/login_user.dart';
import 'package:geoclientes/controllers/controll_session.dart';
import 'package:geoclientes/presentations/screens/login/button_login.dart';
import 'package:geoclientes/presentations/screens/login/top_icons.dart';
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
      body: Container(
        decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_2.png'),
                    fit: BoxFit.fill
                  )
                ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 850,
                child: 
                Stack(
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
                    SizedBox(
                        width: double.infinity, // Ancho máximo disponible
                        height: double.infinity, // Altura máxima disponible
                        child: Stack(
                          children: [
                            Positioned(
                              top: 120, // Centrar verticalmente
                              left: (MediaQuery.of(context).size.width - 80) / 2, // Centrar horizontalmente
                              width: 110,
                              height: 150,
                              child: FadeInUp(
                                duration: const Duration(milliseconds: 1200),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/icon_4.png'),
                                      fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
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
                      child: FadeInUp(duration: const  Duration(milliseconds: 1300), 
                      // ? boton login
                      child: ButtonLogin( user: _textFieldUser, password: _textFieldPassword)
                      ),
                    ),
                   Positioned(
                      left: 0,
                      right: 0,
                      top: 680,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: InkWell(
                          onTap: (){
                            // changeStateLoading();
                          },
                          child: SizedBox(
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
                    ),
      
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
    
}


