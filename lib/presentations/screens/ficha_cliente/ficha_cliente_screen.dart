import 'package:flutter/material.dart';
import 'package:geoclientes/config/clientes.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/bottom_content.dart';
import 'package:geoclientes/presentations/screens/ficha_cliente/top_content.dart';
import 'package:geoclientes/services/api_data_cliente.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';





class FichaClienteScreen extends StatefulWidget {
  static const String name = "ficha_cliente_screen";

  final String codigoCliente;
  final String emailVendedor;
  const FichaClienteScreen({super.key, required this.codigoCliente, required this.emailVendedor});

  @override
  State<FichaClienteScreen> createState() => _FichaClienteScreenState();
}

class _FichaClienteScreenState extends State<FichaClienteScreen> {
  String imagePath = "";


  SharedPreferences? _prefs;

  String emailVendedor = "";

  var cliente;

  bool isLoading = false;

  cargarPreferencias() async{
    _prefs = await SharedPreferences.getInstance();
    if(_prefs!.getString('usuario') != null){
      context.push('/login');
    }
    setState(() {
      emailVendedor = _prefs!.getString('usuario')!;
    });
  }

  void getDataClient() async {
    try {
      final serviceDataCliente = ApiDataCliente(codigoCliente: widget.codigoCliente);
      final data = await serviceDataCliente.fetchClientes();
      setState(() {
        cliente = data;
        isLoading = true;
      });
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    getDataClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorBG,
        
         body: isLoading ? ListView(children: [TopContent(nombre: cliente.nombre,
                                    rut: cliente.rut, codigo: cliente.codigo, 
                                    telefono: cliente.telefono,
                                    pContacto: cliente.pContacto,), BottomContent(codigoCliente: cliente.codigo,emailVendedor: widget.emailVendedor,)],) :  
        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ), 
    );
  }

}

