import 'package:cashino/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cashino/pages/activitypage.dart';
import 'package:cashino/pages/addpage.dart';
import 'package:cashino/pages/learnpage.dart';
import 'package:cashino/components/navbar.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0 ;

  final pages =[
    homepage(),
    addpage(),
     activity(),
     learnpage()
  ];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[currentIndex],
bottomNavigationBar: CurvedNavigationBarWidget(
        onIndexChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
)
      )
      );
  
  }
}
