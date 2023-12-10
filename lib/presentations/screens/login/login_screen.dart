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

  bool sendLoading = false;

  @override
  void initState() {
    super.initState();
    cargarPreferencias();
  }

  cargarPreferencias() async{
    _prefs = await SharedPreferences.getInstance();
    if(_prefs!.getString('usuario') != null){
      context.push('/list_client');
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
      	      height: 400,
      	      decoration: const BoxDecoration(
      	        image: DecorationImage(
      	          image: AssetImage('assets/images/background.png'),
      	          fit: BoxFit.fill
      	        )
      	      ),
      	      child: Stack(
      	        children: <Widget>[
      	          Positioned(
      	            left: 30,
      	            width: 80,
      	            height: 200,
      	            child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
      	              decoration: const BoxDecoration(
      	                image: DecorationImage(
      	                  image: AssetImage('assets/images/light-1.png')
      	                )
      	              ),
      	            )),
      	          ),
      	          Positioned(
      	            left: 140,
      	            width: 80,
      	            height: 150,
      	            child: FadeInUp(duration: const Duration(milliseconds: 1200), child: Container(
      	              decoration: const BoxDecoration(
      	                image: DecorationImage(
      	                  image: AssetImage('assets/images/light-2.png')
      	                )
      	              ),
      	            )),
      	          ),
      	          Positioned(
      	            right: 40,
      	            top: 40,
      	            width: 80,
      	            height: 150,
      	            child: FadeInUp(duration: const  Duration(milliseconds: 1300), child: Container(
      	              decoration: const BoxDecoration(
      	                image: DecorationImage(
      	                  image: AssetImage('assets/images/clock.png')
      	                )
      	              ),
      	            )),
      	          ),
      	          Positioned(
      	            child: FadeInUp(duration: const Duration(milliseconds: 1600), child:  Container(
      	              margin: const EdgeInsets.only(top: 50),
      	              child: const Center(
      	                child: Text("GCClientes", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
      	              ),
      	            )),
      	          )
      	        ],
      	      ),
      	    ),
      	    Padding(
      	      padding: const EdgeInsets.all(30.0),
      	      child: Column(
      	        children: <Widget>[
      	          FadeInUp(duration: const Duration(milliseconds: 1800), child: Container(
      	            padding: const EdgeInsets.all(5),
      	            decoration: BoxDecoration(
      	              color: Colors.white,
      	              borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF4c5464)),
      	              boxShadow: const [
      	                BoxShadow(
      	                  color: Color.fromRGBO(143, 148, 251, .2),
      	                  blurRadius: 20.0,
      	                  offset: Offset(0, 10)
      	                )
      	              ]
      	            ),
      	            child: Column(
      	              children: <Widget>[
      	                Container(
      	                  padding: const EdgeInsets.all(8.0),
      	                  decoration: const BoxDecoration(
      	                    border: Border(bottom: BorderSide(color:  Color(0xFF4c5464)))
      	                  ),
      	                  child: TextField(
                            controller: _textFieldUser,
      	                    decoration: InputDecoration(
      	                      border: InputBorder.none,
      	                      hintText: "Usuario",
      	                      hintStyle: TextStyle(color: Colors.grey[700])
      	                    ),
      	                  ),
      	                ),
      	                Container(
      	                  padding: const EdgeInsets.all(8.0),
      	                  child: TextField(
                            controller: _textFieldPassword,
                              obscureText: true,
      	                    decoration: InputDecoration(
      	                      border: InputBorder.none,
      	                      hintText: "Password",
      	                      hintStyle: TextStyle(color: Colors.grey[700])
      	                    ),
      	                  ),
      	                )
      	              ],
      	            ),
      	          )),
      	          const SizedBox(height: 30,),
      	          FadeInUp(duration: const Duration(milliseconds: 1900), child: 
                    sendLoading ?
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4c5464),
                            Color(0xFF4c5464),
                            ]
                          )
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        ),
                    ):
                    InkWell(
                      onTap: () async {
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
                              context.push('/list_client');
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
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4c5464),
                            Color(0xFF4c5464),
                            ]
                          )
                        ),
                        child: const Center(
                          child: Text("Iniciar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    ),
      	          const SizedBox(height: 70,),
      	          FadeInUp(duration: const Duration(milliseconds: 2000), child: const Text("Olvidaste tu password?", style: TextStyle(color: Color(0xFF4c5464)),)),
      	        ],
      	      ),
      	    )
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

