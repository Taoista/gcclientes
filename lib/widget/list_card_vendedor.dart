import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geoclientes/config/colors.dart';
import 'package:geoclientes/config/vendedor.dart';
import 'package:geoclientes/widget/rounded_image.dart';
import 'package:go_router/go_router.dart';


class ListCardVendedor extends StatelessWidget {
  Vendedor vendedor;
  ListCardVendedor({super.key, required this.vendedor});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 8.0,
          margin: const  EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: RoundedImage()
          ),
          title: Text(
            vendedor.nombre,
            style: const TextStyle(color: colorBG, fontWeight: FontWeight.bold),
          ),
    

          subtitle: Row(
            children: <Widget>[
              const Expanded(
                  flex: 1,
                  child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: 1,
                      valueColor: AlwaysStoppedAnimation(colorYELLOW))),
              Expanded(
                flex: 9,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(vendedor.email,
                        style: const TextStyle(color: colorBG))),
              )
            ],
          ),
          trailing:
              const Icon(Icons.keyboard_arrow_right, color: colorBG, size: 30.0),
          onTap: () {
            print(vendedor.email);
            context.push("/list_client/${vendedor.email}");
          },
        ),
          ),
      );
  }
}