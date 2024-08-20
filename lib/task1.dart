import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {

  static int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("counter"),
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            FloatingActionButton(
                onPressed: (){
                  setState(() {
                    counter--;
                  });
                },
              child: Icon(
                Icons.remove
              ),
                backgroundColor: Colors.blue
            ),

            
            Text(
              "$counter",
              style: TextStyle(
                fontSize: 25
              ),
              
            ),
            
            FloatingActionButton(onPressed: (){
              setState(() {
                counter++;
              });
            },
              child: Icon(
                Icons.add
              ),
              backgroundColor: Colors.blue,
            )
          ],
        ),
      ),

    );
  }
}
