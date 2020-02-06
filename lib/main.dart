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
  Color color = Color(0xFF00E676);
  int pressedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          color = Color(Random().nextInt(0xFFFFFFFF + 1));
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
                    gravity:  Toast.BOTTOM,
                    textColor: Color(0xFFE64A19),
                    backgroundColor: Color(0xFFFFF8E1),
                  );
                }
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        content: const Text('Do you realy want to delete the number of clicks on the screen?'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('NO'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('YES'),
                            onPressed: () {
                              pressedNumber = 0;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                        backgroundColor: Color(0xFFFFF8E1),
                      );
                    },
                  );
                },
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