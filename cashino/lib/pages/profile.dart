// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _user;
  late double _monthlyGoal;
  bool _isMonthlyGoalSet = false;

  @override
  void initState() {
    super.initState();
    _user = User(name: "John Doe", email: "john@example.com");
    _monthlyGoal = _user.monthlyGoal;
    _isMonthlyGoalSet = _monthlyGoal > 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);
    if (route != null && route is ModalRoute && route.isCurrent) {
      final double? goal = route.settings.arguments as double?;
      if (goal != null) {
        _updateMonthlyGoal(goal);
      }
    }
  }

  void _updateMonthlyGoal(double goal) {
    setState(() {
      _monthlyGoal = goal;
      _isMonthlyGoalSet = true;
      _user.setMonthlyGoal(goal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
    toolbarHeight:40,
    
    backgroundColor:  Color.fromARGB(143, 37, 37, 37),
    title: Text("P R O F I L E",
    style: TextStyle(

        fontSize: 18,
        fontWeight:FontWeight.w300,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
  ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.account_circle,size: 150,color: Color.fromARGB(255, 172, 172, 172),)),
            SizedBox(height: 15,),
            Center(
              child: Text(
                "Name: ${_user.name}",
               style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 173, 173, 173)),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "Email: ${_user.email}",
                 style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 173, 173, 173)),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "Monthly Budget: ${_isMonthlyGoalSet ? 'Rs.${_monthlyGoal.toStringAsFixed(2)}' : 'Not set'}",
                 style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 173, 173, 173)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 66, 235, 40))
                ),
                onPressed: _isMonthlyGoalSet ? null : _navigateToMonthlyGoalPage,
                child: Text("Set Monthly Goal",style: TextStyle(
            
                    fontSize: 14,
                    
                    color: Color.fromARGB(255, 34, 34, 34)
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _navigateToMonthlyGoalPage() async {
    final double? goal = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MonthlyGoalPage(),
      ),
    );

    // Update the UI if a goal is set
    if (goal != null) {
      setState(() {
        _monthlyGoal = goal;
        _isMonthlyGoalSet = true;
        _user.setMonthlyGoal(goal);
      });
    }
  }
}


class MonthlyGoalPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,0, 0, 0),
      appBar: AppBar(
    toolbarHeight:40,
    
    backgroundColor:  Color.fromARGB(143, 37, 37, 37),
    title: Text("S E T  M O N T H L Y  B U D G E T ",
    style: TextStyle(

        fontSize: 18,
        fontWeight:FontWeight.w300,
        color: Color.fromARGB(255, 102, 255, 78)
    ),),
  ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Monthly Goal ",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 172, 172, 172)),
            ),
            SizedBox(height: 20),
            TextField(                style: TextStyle(color: Color.fromARGB(255, 192, 192, 192),fontSize: 17,),

              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                hintStyle: TextStyle(fontWeight: FontWeight.w200,color: Color.fromARGB(255, 172, 172, 172)),
                enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(140, 132, 132, 132),
          width: 0.5)
        )
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 66, 235, 40))),
                onPressed: () {
                  // Validate and return the entered goal to the previous screen
                  double? goal = double.tryParse(_controller.text);
                  if (goal != null && goal > 0) {
                    Navigator.pop(context, goal);
                  } else {
                    // Show an error message if the entered value is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid amount."),
                      ),
                    );
                  }
                },
                child: Text("Save",style: TextStyle(color: Color.fromARGB(255, 32, 32, 32)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  double monthlyGoal;

  User({required this.name, required this.email, this.monthlyGoal = 0.0});

  void setMonthlyGoal(double goal) {
    monthlyGoal = goal;
  }
}

