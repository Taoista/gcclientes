import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBotonNav extends StatefulWidget {
  final int currentIndex;

  const MyBotonNav({super.key, required this.currentIndex});

  @override
  State<MyBotonNav> createState() => _MyBotonNavState();
}

class _MyBotonNavState extends State<MyBotonNav> {

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

    onItemTapped(int index) {
      setState(() {
        currentIndex = index;
        if(index == 0){
           Navigator.pop(context);
        }else{
          context.push('/checkin_cliente');
        }
      
      });
    }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ficha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Formulario',
          ),
        ],
      );

     
  }
}