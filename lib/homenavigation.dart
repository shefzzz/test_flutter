import 'package:flutter/material.dart';
import 'package:test_flutter/GridView.dart';
import 'package:test_flutter/task1.dart';
import 'package:test_flutter/task2.dart';
import 'package:test_flutter/textFormField.dart';

class homenav extends StatefulWidget {
  const homenav({super.key});

  @override
  State<homenav> createState() => _homenavState();
}

class _homenavState extends State<homenav> {

  List<Widget> _screens = [
    Task1(),
    task2(),
    GridViewTest(),
    TextFieldTest(),


  ];

  int _index=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor:  Colors.black,
        currentIndex: _index,
          onTap: (index){
          setState(() {
            _index = index;
          });
          },



        items: [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one_rounded), label: "Task1"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two_rounded), label: "task2"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_4x4), label: "gridview"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "textfield"),
        ],
      ),

    );
  }
}
