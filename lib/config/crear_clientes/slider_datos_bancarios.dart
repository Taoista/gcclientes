 // ? texedit de referencias comercialoes
    import 'package:flutter/material.dart';

    final TextEditingController datosBancoBnaco1Controller = TextEditingController();
    final TextEditingController datosBancoBnaco2Controller = TextEditingController();
    final TextEditingController datosBancoBnaco3Controller = TextEditingController();
    final TextEditingController datosBancoNumeroCuenta1Controller = TextEditingController();
    final TextEditingController datosBancoNumeroCuenta2Controller = TextEditingController();
    final TextEditingController datosBancoNumeroCuenta3Controller = TextEditingController();
    final bool clienteTercero1 = false;
    final bool clienteTercero2 = false;
    final bool clienteTercero3 = false;
    final TextEditingController datosBancoRut1Controller = TextEditingController();
    final TextEditingController datosBancoRut2Controller = TextEditingController();
    final TextEditingController datosBancoRut3Controller = TextEditingController();


    List listaDatosBancarios = [
        datosBancoBnaco1Controller,datosBancoBnaco2Controller,datosBancoBnaco3Controller,
        datosBancoNumeroCuenta1Controller,datosBancoNumeroCuenta2Controller,
        datosBancoNumeroCuenta3Controller, clienteTercero1, clienteTercero2, clienteTercero3,
        datosBancoRut1Controller,datosBancoRut2Controller,datosBancoRut3Controller
    ];