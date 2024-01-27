 // ? texedit de referencias comercialoes
    import 'package:flutter/material.dart';

    bool efectivo = false;
    bool fechque = false;
    bool trasnferencia = false;
    bool contraentrega = false;

    final TextEditingController contraFacturaController = TextEditingController();
    final TextEditingController ctaCteCcontroller = TextEditingController();
    final TextEditingController valorPedidoController = TextEditingController();
    final TextEditingController plazoSolicitadoController = TextEditingController();
    final TextEditingController descuentoController = TextEditingController();
    final TextEditingController descripcionCompraController = TextEditingController();

    List formaCondicionesPago = [
      efectivo,fechque,trasnferencia,contraentrega,contraFacturaController,
      ctaCteCcontroller,valorPedidoController, plazoSolicitadoController,
      descuentoController, descripcionCompraController
    ];