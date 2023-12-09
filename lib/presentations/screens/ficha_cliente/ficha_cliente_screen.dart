import 'package:flutter/material.dart';
import 'package:gcclientes/config/clientes.dart';
import 'package:gcclientes/config/colors.dart';
import 'package:gcclientes/presentations/screens/ficha_cliente/bottom_content.dart';
import 'package:gcclientes/presentations/screens/ficha_cliente/top_content.dart';
import 'package:gcclientes/services/api_data_cliente.dart';





class FichaClienteScreen extends StatefulWidget {
  static const String name = "ficha_cliente_screen";

  final String codigoCliente;

  const FichaClienteScreen({super.key, required this.codigoCliente});

  @override
  State<FichaClienteScreen> createState() => _FichaClienteScreenState();
}

class _FichaClienteScreenState extends State<FichaClienteScreen> {

  var cliente;

  bool isLoading = false;

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
      backgroundColor: colorBG,
        // appBar: AppBar(
        //   backgroundColor: colorBG,
        //   title: const Text('GCclientes', style: TextStyle(color: Colors.white)),
        // ),
         body: isLoading ? ListView(children: [TopContent(nombre: cliente.nombre,
                                    rut: cliente.rut, codigo: cliente.codigo, 
                                    telefono: cliente.telefono,
                                    pContacto: cliente.pContacto,), BottomContent(codigoCliente: cliente.codigo,)],) :  
        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ), 
    );
  }

}

