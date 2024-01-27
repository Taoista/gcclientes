 // ? texedit de referencias comercialoes
import 'package:flutter/material.dart';

final TextEditingController empresa1Controller = TextEditingController();
    final TextEditingController empresa2Controller = TextEditingController();
    final TextEditingController empresa3Controller = TextEditingController();

    final TextEditingController empresa1TelController = TextEditingController();
    final TextEditingController empresa2TelController = TextEditingController();
    final TextEditingController empresa3TelController = TextEditingController();

    final TextEditingController empresa1ContactoController = TextEditingController();
    final TextEditingController empresa2ContactoController = TextEditingController();
    final TextEditingController empresa3ContactoController = TextEditingController();

    List<TextEditingController> listReferenciasComerciales = [
        empresa1Controller,empresa2Controller, empresa3Controller,
        empresa1TelController, empresa3TelController,empresa2TelController,
        empresa1ContactoController,empresa2ContactoController,empresa3ContactoController
    ];