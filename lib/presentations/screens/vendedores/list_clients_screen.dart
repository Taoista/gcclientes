import 'package:flutter/material.dart';
import 'package:geoclientes/config/clientes.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/services/api_clientes.dart';
import 'package:geoclientes/widget/list_card_cliente.dart';
import 'package:geoclientes/widget/mi_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListClientsScreen extends StatefulWidget {
  static const String name = "list_clients";
  final String emailVendedor;
  const ListClientsScreen({super.key, required this.emailVendedor});

  @override
  State<ListClientsScreen> createState() => _ListClientsScreenState();
}

class _ListClientsScreenState extends State<ListClientsScreen> {


  List<Cliente> clientes = [];

  List<Cliente> clientesFiltrados = [];

  bool isLoading = false;

  void getClients() async {
    try {

        final serviceClientes = ApiServiceClientes(userMail: widget.emailVendedor);
        var data = await serviceClientes.fetchClientes();
        setState(() {
          clientesFiltrados = data;
          clientes = data;
          isLoading = true;
        });
    } catch (e) {
      // throw e;
    }
    
  }


  void filtrarClientes(String filtro) {
    setState(() {
      if (filtro.isEmpty) {
      clientesFiltrados = clientes;
    } else {
      clientesFiltrados = clientesFiltrados
          .where((cliente) =>
              cliente.nombre.toLowerCase().contains(filtro.toLowerCase()))
          .toList();
    }
    });
  }

  @override
  void initState() {
    super.initState();
    // cargarPreferencias();
    getClients();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: colorBG,
        drawer: MiDrawer(),
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('Geo Clientes', style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Buscar Cliente',
                  labelStyle: TextStyle(color: Colors.white), // Cambia el color del texto del label
                  hintStyle: TextStyle(color: Colors.grey), // Cambia el color del texto de la sugerencia (hint)
                ),
                onChanged: filtrarClientes,
                style: const TextStyle(color: Colors.white)
              ),
            ),
            isLoading == true ? Expanded(
              child: clientesFiltrados.isEmpty ?
              const Text("No Encontrado",style: TextStyle(color: Colors.white),):
              ListView.builder(
                itemCount: clientesFiltrados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: ListCardCliente(cliente: clientesFiltrados[index],emailVendedor: widget.emailVendedor,),
                  );
                },
              ),
            ) : const Center(
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cargando...',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      );
  }
}