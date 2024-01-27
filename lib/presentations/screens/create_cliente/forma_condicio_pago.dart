import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/config/crear_clientes/slider_credito.dart';
import 'package:geoclientes/config/crear_clientes/slider_datos_bancarios.dart';
import 'package:geoclientes/config/crear_clientes/slider_forma_condiciones_pago.dart';
import 'package:geoclientes/config/crear_clientes/slider_referencia_comercial.dart';
import 'package:geoclientes/config/crear_clientes/slider_verificacion_datos.dart';
import 'package:geoclientes/controllers/crear_cliente.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FormaCodicionPago extends StatefulWidget {
  final int indexPage;
  final PageController pageController;
  final List listaFormaPago;

  FormaCodicionPago({Key? key,required this.indexPage, required this.pageController, required this.listaFormaPago}) : super(key: key);

  @override
  State<FormaCodicionPago> createState() => _FormaCodicionPagoState();
}

class _FormaCodicionPagoState extends State<FormaCodicionPago> with AutomaticKeepAliveClientMixin {
  SharedPreferences? _prefs;
  bool _isloadingSend = false;

  String emailUser = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  void limpiarVariables() {
    for (var controller in listReferenciasComerciales) {
      if (controller is TextEditingController) {
        controller.clear();
      }
    }
    for (var controller in listaVerificacionDatos) {
      if (controller is TextEditingController) {
        controller.clear();
      }
    }
    for (var controller in formaCondicionesPago) {
      if (controller is TextEditingController) {
        controller.clear();
      }
    }
    for (var controller in listaDatosBancarios) {
      if (controller is TextEditingController) {
        controller.clear();
      }
    }
     for (var controller in listadoDatosCredito) {
      if (controller is TextEditingController) {
        controller.clear();
      }
    }
  }

  getDataUaer()async{
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      emailUser = _prefs!.getString('usuario')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUaer();
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
              'Forma de pago',
              style: TextStyle(
                fontSize: 20.0, // Tamaño de fuente opcional
                fontWeight: FontWeight.bold, // Negrita opcional
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Efectivo: ${widget.listaFormaPago[0] ? 'Si' : 'No'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
              Switch(
                value: widget.listaFormaPago[0],
                onChanged: (value) {
                  setState(() {
                    widget.listaFormaPago[0] = value;
                  });
                },
              ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Cheque: ${widget.listaFormaPago[1] ? 'Si' : 'No'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
              Switch(
                value: widget.listaFormaPago[1],
                onChanged: (value) {
                  setState(() {
                    widget.listaFormaPago[1] = value;
                  });
                },
              ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Transferencia: ${widget.listaFormaPago[2] ? 'Si' : 'No'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
              Switch(
                value: widget.listaFormaPago[2],
                onChanged: (value) {
                  setState(() {
                    widget.listaFormaPago[2] = value;
                  });
                },
              ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Contra Entrega: ${widget.listaFormaPago[3] ? 'Si' : 'No'}',style: const TextStyle(fontWeight: FontWeight.bold, color: colorBG),),
              Switch(
                value: widget.listaFormaPago[3],
                onChanged: (value) {
                  setState(() {
                    widget.listaFormaPago[3] = value;
                  });
                },
              ),
              ],
            ),
          ),
          _buildTextField("C/Factura (dias)", "",widget.listaFormaPago[4], true),
          _buildTextField("Cta. Cte. (dias)", "",widget.listaFormaPago[5], true),
          _buildTextField("Valor del pedido", "",widget.listaFormaPago[6], true),
          _buildTextField("Plazo Solicitado", "",widget.listaFormaPago[7], true),
          _buildTextField("Descuento", "",widget.listaFormaPago[8], true),
          _buildTextField("Descripcion de compra", "",widget.listaFormaPago[9], true),
          const SizedBox(height: 16.0),
          ElevatedButton(
              onPressed: () async {
                if (!_isloadingSend) {
                  _formKey.currentState!.save();
                  // Cambia el estado de _isloadingSend a true antes de enviar los datos
                  setState(() {
                    _isloadingSend = true;
                  });

                      final control = CrearCliente(userEmail: emailUser);
                      String dataSend = await control.sendData(); 
                      if(dataSend == "ok") {
                        limpiarVariables();
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Registro"),
                              content: const Text("Registro completo"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Navigator.of(context).pop(); // Cierra la alerta
                                  
                                    context.push("/login");
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }else{
                          // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Registro"),
                              content: const Text("Error, intente mas tarde"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Cierra la alerta
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      // if(data == 'ok'){
                        
               
                  setState(() {
                    _isloadingSend = false;
                  });
                  // ignore: use_build_context_synchronously
                 
                }
              },
            child: _isloadingSend
                ? const CircularProgressIndicator()  // Muestra un indicador de carga
                : const Text('ENVIAR'),
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
        
            },
          ),
        ],
      ),
    );
  }

}
