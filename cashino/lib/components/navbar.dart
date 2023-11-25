import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class CurvedNavigationBarWidget extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;

  CurvedNavigationBarWidget({required this.onIndexChanged});

  @override
  _CurvedNavigationBarWidgetState createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  int index = 0; // Define 'index' as a field in this class

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
       onTap: (int newIndex) {
        setState(() {
          index = newIndex; // Update the 'index' field
        });
        widget.onIndexChanged(index);
       },
       height:62,
          backgroundColor: Color.fromARGB(255, 0, 0, 0) ,
          animationDuration : const Duration(milliseconds: 200),
          color: Color.fromARGB(255, 37, 37, 37),
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
      );
  }
}
     
      // ... rest of the widget remains the same
  
         