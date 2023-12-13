import 'package:flutter/material.dart';



class RoundedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // Ajusta el radio según tus necesidades
     child:
     // Image.network(
      //   'https://example.com/tu-imagen.jpg', 
      Image.asset(
        'assets/images/icon-yellow-user.png',
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
    );
  }
}