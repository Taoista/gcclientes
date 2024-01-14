import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/config/formulario.dart';
import 'package:geoclientes/controllers/controll_formulario.dart';
import 'package:geoclientes/presentations/screens/checkoin_cliente/card_check.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/my_boton_nav.dart';
import 'package:geoclientes/widget/mi_drawer.dart';


class CheckinClienteScreen extends StatefulWidget {
  static const String name = "checkin_cliente";


  const CheckinClienteScreen({super.key});

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
          index: {'option_1': false, 'option_2': false}
        });
        isLoading = true;
      });
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
        drawer: const MiDrawer(),
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('Formulario', style: TextStyle(color: Colors.white)),
        ),
        body: isLoading ? ListView.builder(
        itemCount: formularios.length + 1, // Añade 1 para el botón "Enviar"
        itemBuilder: (context, index) {
          if (index == formularios.length) {
            return InkWell(
              onTap: (){
                for (var i = 0; i < checkBoxValues.length; i++) {
                  print(checkBoxValues[i]);
                }
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
      bottomNavigationBar: MyBotonNav(currentIndex: _currentIndex),
    );
  }
}