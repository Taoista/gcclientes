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

  List<Formulario> formularios = [];

  bool isLoading = false;

  void getDataFormularios() async {
    try {
      final serviceFormularios = ControllFormulario();
      final data = await serviceFormularios.getFormulario();
      setState(() {
        formularios = data;
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
          title: const Text('Geo Clientes', style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(
            itemCount: formularios.length,
            itemBuilder: (context, index) {
              print(formularios[index].tipo);
              return CardCheck(title: formularios[index].pregunta, 
                              idFormulario: formularios[index].id,
                              tipo: formularios[index].tipo,);
            },
          ),
         bottomNavigationBar: MyBotonNav(currentIndex: _currentIndex,),
    );
  }
}