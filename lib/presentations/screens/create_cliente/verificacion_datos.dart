import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/controllers/controll_ciudades.dart';
import 'package:geoclientes/controllers/crear_cliente.dart';

class VerificacionDatos extends StatefulWidget {
  final int indexPage;
  final PageController pageController;

  final List listaVerificacionDatos;

  VerificacionDatos({Key? key, required this.indexPage, required this.pageController, required this.listaVerificacionDatos}) : super(key: key);

  @override
  State<VerificacionDatos> createState() => _VerificacionDatosState();
}

class _VerificacionDatosState extends State<VerificacionDatos> with AutomaticKeepAliveClientMixin {

  int selectedRegionValue = 0;
  int selectedCiudadValue = 1;

  bool isLoading = false;
  bool isLoadingCiudad = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  List<Map<String, dynamic>> regioneslist = [];
  
  List<Map<String, dynamic>>  ciudadeslist = [];
  void getCiudades() async {
    try {
        final controllCiudades = ControllCiudades();
        var data = await controllCiudades.fetchCiudades();

        var regiones = controllCiudades.getRegionesOrdenadas(data);

        setState(() {
          // ciudadesList = data;
          regioneslist.add({'id_region':0,'region':"Region"});
          for (var i = 1; i <= regiones.length; i++) {
            regioneslist.add({"id_region":i, "region":regiones[i]});
          }          
          // ? genera el listado de ciudades
          for (var i = 0; i < data.length ; i++) {
            ciudadeslist.add({"id_ciudad": data[i].id, "id_region" :data[i].idRegion, "ciudad": data[i].nombreCiudad, 'region': data[i].region });
          }

          isLoading = true;
        });
    } catch (e) {
      // throw e;
    }
  }

  bool swtichFlota = false;

  @override
  void initState() {
    // TODO: implement initState
    getCiudades();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading ? Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildTextField('RUT', 'Ingrese el RUT', widget.listaVerificacionDatos[0], true),
            _buildTextField('Razón Social', 'Ingrese la razón social', widget.listaVerificacionDatos[1], true),
            const SizedBox(height: 20),
            TypeAheadField(
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  labelText: 'Busca la ciudad',
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) {
                return ciudadeslist
                    .where((item) =>
                        item['ciudad'].toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion['ciudad'] + ' - ' + suggestion['region']),
                );
              },
              onSuggestionSelected: (suggestion) {
                // ? agrego el map
                // print(suggestion);
                widget.listaVerificacionDatos[12] = suggestion;
                widget.listaVerificacionDatos[6].text = suggestion['ciudad'] + ' - ' + suggestion['region'];
              },
              noItemsFoundBuilder: (context) {
                return const ListTile(
                  title: Text('No se encontraron resultados'),
                );
              },
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('Seleccion direccion', '', widget.listaVerificacionDatos[6],false),
            _buildTextField('Dirección', 'Ingrese la dirección', widget.listaVerificacionDatos[7], true),
            _buildTextField('Giro', 'Ingrese el giro', widget.listaVerificacionDatos[2], true),
            _buildTextField('Teléfono', 'Ingrese el teléfono', widget.listaVerificacionDatos[9], true),
            _buildTextField('Rep. Legal', 'Ingrese el representante legal', widget.listaVerificacionDatos[3], true),
            _buildTextField('Rut Rep. Legal', 'Rut del rep. legal', widget.listaVerificacionDatos[4], true),
            _buildTextField('E-mail', 'Ingrese el correo electrónico', widget.listaVerificacionDatos[5], true),
            _buildTextField('Pág. Web', 'Ingrese la página web', widget.listaVerificacionDatos[10], true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Flota: ${swtichFlota ? 'Si' : 'No'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
                Switch(
                  value: swtichFlota,
                  onChanged: (value) {
                    setState(() {
                      swtichFlota = value;
                    });
                  },
                ),
              ],
            ),
             _buildTextField('Numero de camiones', 'Numero de camiones', widget.listaVerificacionDatos[11], swtichFlota),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
               
                  _formKey.currentState!.save();
                  widget.pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                
              },
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    ) : const Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, bool habilitado) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),
          ),
          TextFormField(
            enabled: habilitado,
            controller: controller,
            style: const TextStyle(color: colorGREE2),
            decoration: const InputDecoration(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese $label';
              }
              return null;
            },
            onSaved: (value) {
              // Puedes guardar los datos aquí si es necesario
              // Por ejemplo: Si quieres almacenarlos en algún lugar global
              // o pasárselos a otro widget
            },
          ),
        ],
      ),
    );
  }
}