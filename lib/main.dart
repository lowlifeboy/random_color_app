import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Color App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: RandomColor(),
    );
  }
}

class RandomColor extends StatefulWidget {
  @override
  RandomColorState createState() => RandomColorState();
}

class RandomColorState extends State<RandomColor> {
  final Random _random = Random();

  Color _color = Color(0xFFFFFFFF);
  List<int> lastListChilds = new List();

  int r = 0;
  int g = 0;
  int b = 0;
  double o = 0;

  void changeColor() {
    setState(() {
      r = _random.nextInt(255);
      g = _random.nextInt(255);
      b = _random.nextInt(255);
      o = (_random.nextDouble() * 100).round() / 100;
      _color = Color.fromRGBO(r, g, b, o);
    });
  }

  void resetColor() {
    setState(() {
      _color = Color(0xFFFFFFFF);
    });
  }

  Widget _currentColor(r, g, b, o, _color) {
    return new Container( 
      width: MediaQuery.of(context).size.width,
      child: 
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      offset: Offset(1.0, 3.0),
                      spreadRadius: -3.0,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Text('rgba($r, $g, $b, $o)'),
              ),
            ),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      offset: Offset(1.0, 3.0),
                      spreadRadius: -3.0,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hey there', 
                  style: TextStyle(
                    fontFamily: 'DancingScriptBold',
                    fontSize: 20,
                    color: _color, 
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: FloatingActionButton(
                onPressed: resetColor,
                child: Icon(Icons.replay),
              ),
            ),
          ],
        ),
      decoration: BoxDecoration(
        color: _color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Color App'),
      ),
      body: InkWell(
        onTap: changeColor,
        child: _currentColor(r, g, b, o, _color),
      )
    );
  }
}
