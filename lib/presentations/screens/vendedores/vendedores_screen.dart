import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/config/vendedor.dart';
import 'package:geoclientes/services/api_vendedores.dart';
import 'package:geoclientes/widget/list_card_vendedor.dart';
import 'package:geoclientes/widget/mi_drawer.dart';



class VendedoresScreen extends StatefulWidget {
  static const String name = "vendedores_screen";
  const VendedoresScreen({super.key});

  @override
  State<VendedoresScreen> createState() => _VendedoresScreenState();
}

class _VendedoresScreenState extends State<VendedoresScreen> {

  List<Vendedor> vendedores = [];
  List<Vendedor> vendedoresFiltrados = [];

  bool loadingData = false;

  void loadingVendedeores() async {
    final serviceVendedores = ApiServiceVendedores();
    var data = await serviceVendedores.fetchVendedores();
    setState(() {
      vendedoresFiltrados = data;
      vendedores = data;
      loadingData = true;
    });
  }

  void filstrarVendedores(String filtro) {
    setState(() {
      if (filtro.isEmpty) {
      vendedoresFiltrados = vendedores;
    } else {
      vendedoresFiltrados = vendedoresFiltrados
          .where((vendedores) =>
              vendedores.nombre.toLowerCase().contains(filtro.toLowerCase()))
          .toList();
    }
    });
  }

  @override
  void initState() {
    super.initState();
    loadingVendedeores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBG,
      drawer: MiDrawer(),
      appBar: AppBar(
        backgroundColor: colorBG,
        title: const Text('Vendedores', style: TextStyle(color: Colors.white)),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Aquí puedes poner tu lógica para bloquear o permitir el retroceso
          // Si deseas bloquear el retroceso, devuelve 'false', de lo contrario, devuelve 'true'.
          return false;
        },child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Buscar Vendedor',
                  labelStyle: TextStyle(color: Colors.white), // Cambia el color del texto del label
                  hintStyle: TextStyle(color: Colors.grey), // Cambia el color del texto de la sugerencia (hint)
                ),
                onChanged: filstrarVendedores,
                style: const TextStyle(color: Colors.white)
              ),
            ),
            loadingData == true ? Expanded(
              child: vendedoresFiltrados.isEmpty ?
              const Text("No Encontrado",style: TextStyle(color: Colors.white),):
              ListView.builder(
                itemCount: vendedoresFiltrados.length,
                itemBuilder: (context, index) {
                  // print(vendedoresFiltrados[index].nombre);
                  return ListCardVendedor(vendedor: vendedoresFiltrados[index],);
                },
              ),
            ):const Center(
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
                )
        ],
      ),
    )
    );
  }
}