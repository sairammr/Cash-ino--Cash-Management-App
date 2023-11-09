// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  appBar: AppBar(
    toolbarHeight:40,
    
    backgroundColor: Color.fromARGB(255, 65, 65, 65),
    title: Text("CA\$H-INO",
    style: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
leading: Icon(Icons.attach_money_outlined,color: Color.fromARGB(255, 66, 235, 40),),
  ),

  
);
  
  }}