import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/controllers/crear_cliente.dart';



class Credito extends StatefulWidget {
  final int indexPage;
  final PageController pageController;
  final List listadoDatosCredito;

  Credito({Key? key, required this.indexPage, required this.pageController, required this.listadoDatosCredito}) : super(key: key);

  @override
  State<Credito> createState() => _CreditoState();
}

class _CreditoState extends State<Credito> with AutomaticKeepAliveClientMixin {
    
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
  bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {


    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Quién paga',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Nombre","",widget.listadoDatosCredito[0],true),
          _buildTextField("Telefono Fijo","",widget.listadoDatosCredito[1],true),
          _buildTextField("Telefono Movil","",widget.listadoDatosCredito[2],true),
          _buildTextField("Email","",widget.listadoDatosCredito[3],true),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Quién compra',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
           _buildTextField("Nombre","",widget.listadoDatosCredito[4],true),
          _buildTextField("Telefono Fijo","",widget.listadoDatosCredito[5],true),
          _buildTextField("Telefono Movil","",widget.listadoDatosCredito[6],true),
          _buildTextField("Email","",widget.listadoDatosCredito[7],true),
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