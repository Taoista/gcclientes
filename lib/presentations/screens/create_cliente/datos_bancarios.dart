import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';


class DatosBancarios extends StatefulWidget {
  final int indexPage;
  final PageController pageController;
  final List listaDatosBancarios;

  DatosBancarios({Key? key,required this.indexPage, required this.pageController, required this.listaDatosBancarios}) : super(key: key);

  @override
  State<DatosBancarios> createState() => _DatosBancariosState();
}

class _DatosBancariosState extends State<DatosBancarios> with AutomaticKeepAliveClientMixin {

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
              'Datos Bancarios',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Banco", "",widget.listaDatosBancarios[0], true),
          _buildTextField("N. Cta.", "",widget.listaDatosBancarios[3], true),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tipo: ${widget.listaDatosBancarios[6] ? 'Cliente' : 'Tercero'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
                  Switch(
                    value: widget.listaDatosBancarios[6],
                    onChanged: (value) {
                      setState(() {
                        widget.listaDatosBancarios[6] = value;
                      });
                    },
                  ),
                ],
                     ),
           ),
          _buildTextField("Rut 3ro", "",widget.listaDatosBancarios[9], true),

           const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Datos Bancarios 2',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Banco", "",widget.listaDatosBancarios[1], true),
          _buildTextField("N. Cta.", "",widget.listaDatosBancarios[4], true),
          Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tipo: ${widget.listaDatosBancarios[7] ? 'Cliente' : 'Tercero'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
                  Switch(
                    value: widget.listaDatosBancarios[7],
                    onChanged: (value) {
                      setState(() {
                        widget.listaDatosBancarios[7] = value;
                      });
                    },
                  ),
                ],
                     ),
           ),
          _buildTextField("Rut 3ro", "",widget.listaDatosBancarios[10], true),

           const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Datos Bancarios 3',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          _buildTextField("Banco", "",widget.listaDatosBancarios[2], true),
          _buildTextField("N. Cta.", "",widget.listaDatosBancarios[5], true),
          Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tipo: ${widget.listaDatosBancarios[8] ? 'Cliente' : 'Tercero'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
                  Switch(
                    value: widget.listaDatosBancarios[8],
                    onChanged: (value) {
                      setState(() {
                        widget.listaDatosBancarios[8] = value;
                      });
                    },
                  ),
                ],
                     ),
           ),
          _buildTextField("Rut 3ro", "",widget.listaDatosBancarios[11], true),
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
