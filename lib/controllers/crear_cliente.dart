import 'package:dio/dio.dart';
import 'package:geoclientes/config/crear_clientes/slider_credito.dart';
import 'package:geoclientes/config/crear_clientes/slider_datos_bancarios.dart';
import 'package:geoclientes/config/crear_clientes/slider_forma_condiciones_pago.dart';
import 'package:geoclientes/config/crear_clientes/slider_referencia_comercial.dart';
import 'package:geoclientes/config/crear_clientes/slider_verificacion_datos.dart';

class CrearCliente{

  final String userEmail ;

  CrearCliente({ required this.userEmail });

  Future crearCliente() async {
    final String rutCliente = rutController.text;
    final String razonSocial = razonSocialController.text;

  }
  Dio dio = Dio();

  // ? data de verificacion de datos
  Map verificacionDatos(){
    Map<String, dynamic> data = {
      'rut': rutController.text,
      'razonSocial': razonSocialController.text,
      'giro': giroController.text,
      'repLegal': repLegalController.text,
      'repLegaRutl': repLegaRutlController.text,
      'email': emailController.text,
      'ciudadRegion': ciudadRegion.text,
      'direccion': direccionController.text,
      'ciudad': ciudadController.text,
      'telefono': telefonoController.text,
      'paginaWeb': paginaWebController.text,
      'flotaNumeroCamiones': flotaNumeroCamiones.text == "" ? 0 : flotaNumeroCamiones.text,
      'regionSeleccionada':listaVerificacionDatos[12]
    };
    return data;
  }

  // ? quien paga
  Map credito(){
    Map<String, dynamic> data = {
      "quienPaga" : quienPagaController.text,
      "telefonoFijo": telefonoFijoController.text,
      "celular" : celularController.text,
      "emailPaga" : emailPagaController.text,
      "compraNombre" : compraNombreController.text,
      "compraTelFijo": compraTelFijoController.text,
      "compraTelMovil" : compraTelMovilController.text,
      "compraEmail": compraEmailController.text
    };
    return data;
  }


  Map referenciaComercial(){
    Map<String, dynamic> data = {
      "empresa_1": empresa1Controller.text,
      "empresa_2": empresa2Controller.text,
      "empresa_3": empresa3Controller.text,
      "telefono_1": empresa1TelController.text,
      "telefono_2": empresa3TelController.text,
      "telefono_3": empresa2TelController.text,
      "contacto_1": empresa1ContactoController.text,
      "contacto_2": empresa2ContactoController.text,
      "contacto_3": empresa3ContactoController.text
    };
    return data;
  }

  // ? datos bancarios
  Map datosBancarios(){
    Map<String, dynamic> data = {
      'datosBancoBnaco1':datosBancoBnaco1Controller.text,
      'datosBancoBnaco2':datosBancoBnaco2Controller.text,
      'datosBancoBnaco3':datosBancoBnaco3Controller.text,
      'datosBancoNumeroCuenta1': datosBancoNumeroCuenta1Controller.text,
      'datosBancoNumeroCuenta2' : datosBancoNumeroCuenta2Controller.text,
      'datosBancoNumeroCuenta3' : datosBancoNumeroCuenta3Controller.text,
      'clienteTercero1': listaDatosBancarios[6] == true ? 1 : 0,
      'clienteTercero2': listaDatosBancarios[7] == true ? 1 : 0,
      'clienteTercero3': listaDatosBancarios[8] == true ? 1 : 0,
      'datosBancoRut1Controller': listaDatosBancarios[9].text,
      'datosBancoRut2Controller': listaDatosBancarios[10].text,
      'datosBancoRut3Controller': listaDatosBancarios[11].text,
    };
    return data;
  }

   Map formaCondicionPago(){
    Map<String, dynamic> data = {
      'efectivo' : formaCondicionesPago[0] == true ? 1:0,
      'fechque': formaCondicionesPago[1] == true ? 1 : 0,
      'trasnferencia' : formaCondicionesPago[2] == true ? 1 : 0,
      'contraentrega': formaCondicionesPago[3] == true ? 1 : 0,
      'contraFactura': contraFacturaController.text,
      'ctaCte': ctaCteCcontroller.text,
      'valorPedido': valorPedidoController.text,
      'plazoSolicitado': plazoSolicitadoController.text,
      'descuento': descuentoController.text,
      'descripcionCompra': descripcionCompraController.text
    };
    return data;
  }

  Map dataGeneral(){
    Map<String, dynamic> postData = {
      'user_email': userEmail,
      'verificacion_datos': verificacionDatos(),
      'credito': credito(), 
      'referencia_comercial': referenciaComercial(),
      'datosBancarios' : datosBancarios(),
      'formaCondicionPago': formaCondicionPago(),
    };
    return postData;
  }

 


  Future<String> sendData() async {
    var postData = dataGeneral();
    try {
      var postData = dataGeneral();
      Response response = await dio.post("https://admin-neumachile.cl/api/create_cliente_form"
        , data: postData);
        return response.data['message'];
    } catch (e) {
      return "error";
    }
  }


}