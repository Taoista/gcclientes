import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


class TopIcons{
 buildWidgetList(context) {
    return [
      Positioned(
                    top:0,
                    right: 40,
                    width: 50,
                    height: 200,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/top_green.png')
                        )
                      ),
                    )),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    width: 80,
                    height: 200,
                    child: FadeInUp(duration: const Duration(seconds: 1), child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/yellow_left.png')
                        )
                      ),
                    )),
                  ),
                  SizedBox(
                      width: double.infinity, // Ancho máximo disponible
                      height: double.infinity, // Altura máxima disponible
                      child: Stack(
                        children: [
                          Positioned(
                            top: 120, // Centrar verticalmente
                            left: (MediaQuery.of(context).size.width - 80) / 2, // Centrar horizontalmente
                            width: 100,
                            height: 150,
                            child: FadeInUp(
                              duration: const Duration(milliseconds: 1200),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/icon.png'),
                                    fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width /2 -120,
                    // top: MediaQuery.of(context).size.height / 2 - 130,
                    top: 225,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: 'GEO',
                                  style: TextStyle(fontFamily: 'RobotoBlack'), // Estilo de fuente para 'Geo'
                                ),
                                TextSpan(
                                  text: 'CLIENTES',
                                  style: TextStyle(fontFamily: 'RobotoLight'), // Estilo de fuente para 'Clientes'
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
    ];
  }

}
