import 'package:flutter/material.dart';
import 'package:gcclientes/config/clientes.dart';
import 'package:gcclientes/config/colors.dart';
import 'package:gcclientes/services/api_clientes.dart';
import 'package:gcclientes/widget/list_card.dart';





class ListClientsScreen extends StatefulWidget {
  static const String name = "list_clients";
  const ListClientsScreen({super.key});

  @override
  State<ListClientsScreen> createState() => _ListClientsScreenState();
}

class _ListClientsScreenState extends State<ListClientsScreen> {

  List<Cliente> clientes = [];

  List<Cliente> clientesFiltrados = [];

  void getClients() async {
    try {
        final serviceClientes = ApiServiceClientes(userMail: "jriquelme@neumachile.cl");
        var data = await serviceClientes.fetchClientes();
        setState(() {
          clientesFiltrados = data;
          clientes = data;
        });
    } catch (e) {
      print('error al cargar');
    }
  }

  void filtrarClientes(String filtro) {
    setState(() {
      if (filtro.isEmpty) {
      // Si el filtro está vacío, mostrar la lista completa
      clientesFiltrados = clientes;
    } else {
      // Filtrar la lista según el criterio proporcionado
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
    getClients();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: colorBG,
        appBar: AppBar(
          backgroundColor: colorBG,
          title: const Text('Lista de Clientes', style: TextStyle(color: Colors.white)),
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
            Expanded(
              child: 
              ListView.builder(
                itemCount: clientesFiltrados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: makeCard(clientesFiltrados[index]),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}