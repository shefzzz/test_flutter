import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/GridView.dart';
import 'package:test_flutter/login_screen.dart';
import 'package:test_flutter/task1.dart';
import 'package:test_flutter/task2.dart';
import 'package:test_flutter/textFormField.dart';

import 'custom_text.dart';

class homenav extends StatefulWidget {
  const homenav({super.key});

  @override
  State<homenav> createState() => _homenavState();
}

class _homenavState extends State<homenav> {
  List<String> titles = ['Counter', 'Slider', 'Grid View', 'Calculator'];

  List<Widget> _screens = [
    Task1(),
    task2(),
    GridViewTest(),
    TextFieldTest(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_index]),
      ),
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one_rounded), label: "Task1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_two_rounded), label: "task2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_4x4), label: "gridview"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "textfield"),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
              child: CustomText(data: "Sign Out"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            )
          ],
        ),
      ),
    );
  }
}
