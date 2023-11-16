// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


 
import 'package:flutter/material.dart';

Future openTextDialog(BuildContext context) => showDialog(
  context: context, 
  builder: (context)=>  AlertDialog(
    title: Text("Create New Transaction ",
    style: TextStyle(
    color: Color.fromARGB(255, 220, 220, 220),fontSize: 17
    ),),
   backgroundColor: Color.fromARGB(255, 0, 0, 0),
    content: Column(children: [
       SizedBox(
        height: 25,
      ),
      TextField(
        autofocus: true,
        style: TextStyle(color: Color.fromARGB(255, 192, 192, 192),fontSize: 17,),
        
        decoration: InputDecoration(hintText: "Enter Receiver details",
        hintStyle: TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 192, 192, 192),
          width: 1)
        )
        ,focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 192, 192, 192),
          width: 1)
        )),
      ),
      SizedBox(
        height: 25,
      ),
      TextField(
                style: TextStyle(color: Color.fromARGB(255, 192, 192, 192),fontSize: 17,),

        decoration: InputDecoration(hintText: "Enter Amount",hintStyle: TextStyle(color: Color.fromARGB(255, 172, 172, 172)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 192, 192, 192),
          width: 1)
        )
        ,focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 192, 192, 192),
          width: 1)
        )),
      ),
    ]),
    actions: [
      // ignore: sort_child_properties_last
      ElevatedButton( child: Text("Submit",
      style: TextStyle(color: Color.fromARGB(255, 48, 48, 48)),),
      onPressed: () => submit(context),
      style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all<Color>(
      Color.fromARGB(255, 66, 235, 40),
    ),
      ),
      )
  ],
  ),);
  void submit (BuildContext context){
    Navigator.of(context).pop();
  }
