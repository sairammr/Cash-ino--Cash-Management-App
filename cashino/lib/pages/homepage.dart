// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cashino/pages/activitypage.dart';
import 'package:cashino/pages/addpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


  
class homepage extends StatefulWidget {
  
   const homepage({super.key});
  

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 int index = 0 ;
  final pages =[
    addpage(),
    activity(),
    homepage(),

  ];

  @override

  Widget build(BuildContext context) {
   
    return Scaffold(
      
    
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
  appBar: AppBar(
    toolbarHeight:50,
    
    backgroundColor: Color.fromARGB(255, 65, 65, 65),
    title: Text("CA\$H-INO",
    style: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
leading: Icon(Icons.attach_money_outlined,color: Color.fromARGB(255, 66, 235, 40),),
  ),

  


      bottomNavigationBar: 
       
 CurvedNavigationBar(
  
          onTap: (int index){
            setState(() {
              this.index =index;
            });
            
          },
  
          height:62,
          backgroundColor: Color.fromARGB(255, 0, 0, 0) ,
          animationDuration : const Duration(milliseconds: 200),
          color: Color.fromARGB(255, 65, 65, 65),
          items: [
          Icon(Icons.home,
          color:
          index==0 ? Color.fromARGB(255, 66, 235, 40):Color.fromARGB(255, 192, 192, 192)
          ,size: 30,),
           Icon(Icons.bar_chart_sharp,color :
                     index==1 ? Color.fromARGB(255, 66, 235, 40):Color.fromARGB(255, 192, 192, 192)
,size: 30,),
            Icon(Icons.moving_outlined,color:
                      index==2 ?Color.fromARGB(255, 66, 235, 40):
 Color.fromARGB(255, 192, 192, 192),
 size: 30,),
            Icon(Icons.menu_book_outlined,
            color:  index==3 ?Color.fromARGB(255, 66, 235, 40):
 Color.fromARGB(255, 192, 192, 192),
 size: 30,),
      
        ],
      ),
    );
  }
}