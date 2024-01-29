import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/config/formulario.dart';
import 'package:geoclientes/controllers/controll_formulario.dart';
import 'package:geoclientes/controllers/controll_send_formulario.dart';
import 'package:geoclientes/presentations/screens/checkoin_cliente/card_check.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/my_boton_nav.dart';
import 'package:geoclientes/widget/mi_drawer.dart';
import 'package:go_router/go_router.dart';


class CheckinClienteScreen extends StatefulWidget {
  static const String name = "checkin_cliente";
  int idRegistro;
  // final List checkBoxValues;

  CheckinClienteScreen({Key? key, required this.idRegistro}) : super(key: key);

  @override
  State<CheckinClienteScreen> createState() => _CheckinClienteScreenState();
}

class _CheckinClienteScreenState extends State<CheckinClienteScreen> {
  // bool get wantKeepAlive => true;
  TextEditingController _textController = TextEditingController();

  List<dynamic> checkBoxValues = [];
  List<Formulario> formularios = [];

  // bool isLoading = false;
  bool isLoading = false;

  void getDataFormularios() async {
    try {
      final serviceFormularios = ControllFormulario();
      final data = await serviceFormularios.getFormulario();
      setState(() {
        formularios = data;

        checkBoxValues = List.generate(formularios.length, (index) => {
          // "$index": {"id_formulario":formularios[index].id,"option_1": false, "option_2": false}
         "id_formulario":formularios[index].id,"option_1": false, "option_2": false
        });
        isLoading = true;
      });
      // print(checkBoxValues);
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataFormularios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;

    return Scaffold(
       backgroundColor: colorBG,
        drawer: MiDrawer(),
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('Formulario', style: TextStyle(color: Colors.white)),
        ),
        body: isLoading ? ListView.builder(
        itemCount: formularios.length + 1, // Añade 1 para el botón "Enviar"
        itemBuilder: (context, index) {
          if (index == formularios.length) {
            return InkWell(
              onTap: () async {
                sendData();
              },
              child: Container(
                margin: const EdgeInsets.only(left:40.0,right: 40.0, top: 20.0, bottom: 20.0 ),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      colorBGlIGHT,
                      colorBGlIGHT,
                    ]
                  )
                ),
                child: const Center(
                  child: Text("Enviar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                ),
              ),
            );
          } else {
            // ? Elemento del formulario
            return CardCheck(
              title: formularios[index].pregunta,
              idFormulario: formularios[index].id,
              tipo: formularios[index].tipo,
              optionSelected: checkBoxValues,
              position: index,
              textController:_textController,

            );
          }
        },
      ) : const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      // bottomNavigationBar: MyBotonNav(currentIndex: _currentIndex),
    );
  }

  Future<void> sendData() async {
      final int idRegistro = widget.idRegistro;
      final controll =  ControllSendFormulario(formulario: checkBoxValues, idVisita: idRegistro);

      Map<String, dynamic> dat = await controll.sendFormular();
      String response = dat['message'];
      // viene otro datos dat['data']
      if(response == "ok"){
        _msgSendOk();
      }else{  
        _msgErrorSEND();
      } 
  }

    Future<void> _msgSendOk() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reporte'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Reporte.'),
                Text('Se envio correctamente'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                 context.push("/vendedores");
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    Future<void> _msgErrorSEND() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Envio'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Error.'),
                Text('Error al enviar,intente mas tarde'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                 context.push("/list_client");
              },
            ),
          ],
        );
      },
    );
  }


}