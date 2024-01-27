import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';



class ReferenciasComerciales extends StatefulWidget {

  final int indexPage;
  final PageController pageController;
  final List<TextEditingController> listReferenciasComerciales;

  ReferenciasComerciales({Key? key, required this.indexPage, required this.pageController, required this.listReferenciasComerciales}) : super(key: key);

  @override
  State<ReferenciasComerciales> createState() => _ReferenciasComercialesState();
}

class _ReferenciasComercialesState extends State<ReferenciasComerciales>  with AutomaticKeepAliveClientMixin {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController empresa3ContactoController = TextEditingController();


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Referencias Comerciales',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Detalle 1',
              style: TextStyle(
                fontSize: 15.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Empresa","",widget.listReferenciasComerciales[0],true),
          _buildTextField("Telefono","",widget.listReferenciasComerciales[3],true),
          _buildTextField("Contacto","",widget.listReferenciasComerciales[6],true),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Detalle 2',
              style: TextStyle(
                fontSize: 15.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Empresa","",widget.listReferenciasComerciales[1],true),
          _buildTextField("Telefono","",widget.listReferenciasComerciales[4],true),
          _buildTextField("Contacto","",widget.listReferenciasComerciales[7],true),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Detalle 2',
              style: TextStyle(
                fontSize: 15.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Empresa","",widget.listReferenciasComerciales[2],true),
          _buildTextField("Telefono","",widget.listReferenciasComerciales[5],true),
          _buildTextField("Contacto","",widget.listReferenciasComerciales[8],true),
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
    );
    
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, bool habilitado) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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