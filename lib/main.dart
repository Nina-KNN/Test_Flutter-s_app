import 'package:flutter/material.dart';
import 'dart:math';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() { color = Color(Random().nextInt(0xffffffff)); });
      },
      child: Container(
        child: Scaffold(
          backgroundColor: color,
          body: Center(
            child: Text(
              'Hey there',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}