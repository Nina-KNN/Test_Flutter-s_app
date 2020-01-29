import 'package:flutter/material.dart';
import 'dart:math';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomColor(),
    );
  }
}

class RandomColor extends StatefulWidget {
  @override
  RandomColorsState createState() => RandomColorsState();
}

class RandomColorsState extends State<RandomColor> {
  Color color;
  int pressedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          color = Color(Random().nextInt(0xffffffff));
          pressedNumber++;
        });
      },
      child: Container(
        child: Scaffold(
          backgroundColor: color,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.assessment),
                onPressed: () {
                  Toast.show(
                      'Screen was pressed ' + pressedNumber.toString() + (pressedNumber > 1 ? ' times' : ' time'),
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity:  Toast.BOTTOM
                  );
                }
              ),
            ],
          ),

          body: Center(
            child: Stack(
              children: <Widget>[
                Text(
                  'Hey there',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.deepOrange
                  ),
                ),

                Text(
                  'Hey there',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }

}