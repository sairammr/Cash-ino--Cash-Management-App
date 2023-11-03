// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      bottomNavigationBar: 
       
 CurvedNavigationBar(
          height:65,
          backgroundColor: Color.fromARGB(255, 0, 0, 0) ,
          animationDuration : const Duration(milliseconds: 200),
          color: Color.fromARGB(255, 39, 39, 39),
          items: [
          Icon(Icons.home,color: Color.fromARGB(255, 66, 235, 40),size: 30,),
           Icon(Icons.bar_chart_sharp,color : Color.fromARGB(255, 66, 235, 40),size: 30,),
            Icon(Icons.history,color: Color.fromARGB(255, 66, 235, 40),size: 30,),
            Icon(Icons.menu_book_outlined,color: Color.fromARGB(255, 66, 235, 40),size: 30,),
      
        ],
      ),
    );
  }
}