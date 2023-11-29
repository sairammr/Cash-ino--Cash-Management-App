// ignore_for_file: prefer_const_constructors
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/material.dart';
class activity extends StatefulWidget {
  const activity({super.key});

  @override
  State<activity> createState() => _activityState();
}

class _activityState extends State<activity> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
    toolbarHeight:40,
    
    backgroundColor:  Color.fromARGB(143, 37, 37, 37),
    title: Text("A C T I V I T Y",
    style: TextStyle(

        fontSize: 18,
        fontWeight:FontWeight.w300,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
  ),
  body: SingleChildScrollView(
    child: Column(
     children: [
      ExpenseChart(),
     ],
    ),
  ),
    );
  }
}
class Expense {
  final String day;
  final double amount;

  Expense(this.day, this.amount);
}

class ExpenseChart extends StatelessWidget {
  final List<Expense> expenses = [
    Expense('Day 1', 50.0),
    Expense('Day 2', 30.0),
    Expense('Day 3', 20.0),
    Expense('Day 4', 40.0),
    Expense('Day 5', 60.0),
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(majorGridLines:MajorGridLines(width: 0)),
      
      series: <ChartSeries>[
        BarSeries<Expense, String>(
          dataSource: expenses,
          xValueMapper: (Expense expense, _) => expense.day,
          yValueMapper: (Expense expense, _) => expense.amount,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
      title: ChartTitle(text: 'Daily Expenses'),
    );
  }
}




  

 



