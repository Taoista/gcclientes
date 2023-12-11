import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gcclientes/config/vendedor.dart';


class ListCardVendedor extends StatelessWidget {
  Vendedor vendedor;
  ListCardVendedor({super.key, required this.vendedor});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 8.0,
          margin: const  EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            utf8.decode(latin1.encode(vendedor.nombre)),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
    

          subtitle: Row(
            children: <Widget>[
              const Expanded(
                  flex: 1,
                  child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: 10,
                      valueColor: AlwaysStoppedAnimation(Colors.green))),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(vendedor.email,
                        style: const TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            // context.push("/ficha_client/${cliente.codigo}/$emailVendedor");
          },
        ),
          ),
      );
  }
}