// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'profile.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import 'package:cashino/pages/addpage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

  
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
    
    backgroundColor:  Color.fromARGB(143, 37, 37, 37),
    title: Text("C A \$ H I N O",
    style: TextStyle(

        fontSize: 18,
        fontWeight:FontWeight.w300,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
  ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: const Text(
                  'W e l c o m e, U s e r !',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300,color:Color.fromRGBO(237, 255, 234, 1)),
                ),
              ),
             
              _buildUserDetails('S A I R A M ', 'sairam1203mr@gmail.com'),
              const SizedBox(height: 16),
           Container(
            height: 85,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _amountSpentToday(1000),
              SizedBox(width: 5), 
              _buildBalanceBox(2000, 5000), 
               SizedBox(width: 5),
                _addNew(), 
            ],
          ),
        ), 
       
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Budget Tracker",style:TextStyle(fontSize: 25,letterSpacing:5,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 175, 175, 175))),
        ),
              const SizedBox(height: 8),
             
Center(
  child: FutureBuilder<double>(
    future: _getAmountSpentToday(),
    builder: (context, snapshot) {
      
        double amountSpentToday = snapshot.data ?? 0.0;
        return _circularBudgetTracking(amountSpentToday);
      
    },
  ),
),                const SizedBox(height: 16),
               
            ],
          ),
        ),
      ),
    );
  }
 Widget _addNew(){
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>AddAndActivityPage()),);
    },
    child: Container(
      padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 102, 255, 78),
  
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Text("Add Transaction ",style:TextStyle(fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 21, 21, 21))),
            Icon(Icons.add_circle,color:Color.fromARGB(255, 21, 21, 21) ,size: 19,)
           
          ],
        )
    ),
  );
 }
  Widget _buildUserDetails(String name, String email) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:Color.fromARGB(255, 91, 91, 91) ,
        border: Border.all(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$name',style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Color.fromARGB(255, 255, 255, 255)),),
              SizedBox(height: 10,),
              Text('$email',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 220, 220, 220)
              ),),
               SizedBox(height: 10,),
            ],

          ),
          SizedBox(width: 110,),
           InkWell(
            onTap: () {
              // Navigate to another page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Icon(
              Icons.arrow_circle_right,
              color: Color.fromARGB(255, 236, 255, 239), // Adjust the color as needed
              size: 50,
               ),
          ),
          
        ],
      ),
    );
  }
 
  Widget _buildBalanceBox(double balance,double total_budget) {
    return Container(
      
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 102, 255, 78),

        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Income ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400
          ),),
          SizedBox(height: 10,),
          FutureBuilder(future: _getAmountCredittoday(), builder: (context,snapshot){
            return  Text(
            'Rs.${snapshot.data} ',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          );
          }
         )
        ],
      ),
    );
  }
  Widget _amountSpentToday(double amountSpentToday) {
    return Container(
      
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 102, 255, 78),

        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Expense ',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400
          ),),
          SizedBox(height: 10,),
          FutureBuilder<double>(
      future: _getAmountSpentToday(),
      builder: (context, snapshot) {
        
          return Text(
            'Rs.${snapshot.data}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          );
        }
      ,
    ),
        ],
      ),
    );
  }
  Widget _circularBudgetTracking(double val){
    return Container(
      width: 200,
      height: 200,
      child: LiquidCircularProgressIndicator(
  value: val/10000, // Defaults to 0.5.
  valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 68, 68, 68)), // Defaults to the current Theme's accentColor.
  backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Defaults to the current Theme's backgroundColor.
  borderColor:Color.fromARGB(255, 102, 200, 78)
,
  borderWidth: 2.0,
  direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
  center: Text("Rs.$val/10000",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 255, 255, 255)
              ),),
));
    
  }
 
  Widget _buildLineChart() {
    return SizedBox(
      width: 300,
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 20),
                const FlSpot(1, 50),
                const FlSpot(2, 30),
                const FlSpot(3, 80),
                const FlSpot(4, 60),
                const FlSpot(5, 40),
                const FlSpot(6, 70),
                const FlSpot(7, 90),
              ],
              isCurved: true,
       
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
  
Future<double> _getAmountSpentToday() async {
  // Simulate fetching the updated amount from DataHandling
  double updatedAmount = DataHandling.totalexp; // Replace this with the actual method in DataHandling

  return updatedAmount;
}
Future<double> _getAmountCredittoday() async {
  // Simulate fetching the updated amount from DataHandling
  double updatedAmount = DataHandling.totalcredit; // Replace this with the actual method in DataHandling

  return updatedAmount;
}

  
  }