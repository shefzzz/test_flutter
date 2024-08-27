import 'package:flutter/material.dart';

class task2 extends StatefulWidget {
  const task2({super.key});

  @override
  State<task2> createState() => _task2State();
}

class _task2State extends State<task2> {
  static int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage("assets/$index.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (index > 1)
                        index--;
                      else
                        index = 4;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_circle_left_sharp,
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.pause,
                    size: 60,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (index < 4)
                        index++;
                      else
                        index = 1;
                    });
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_circle_right_sharp,
                      size: 60,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
