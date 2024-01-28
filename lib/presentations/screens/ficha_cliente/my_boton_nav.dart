import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBotonNav extends StatefulWidget {
  final int currentIndex;
  final PageController pageController;

  const MyBotonNav({super.key, required this.currentIndex, required this.pageController});

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

   

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            widget.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Otra Pantalla',
          ),
        ],
        );

     
  }
}