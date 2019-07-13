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
        primaryColor: Colors.white,
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

  Widget _currentColor(r, g, b, o, _color) {
    return new Container(
      decoration: new BoxDecoration(
        color: _color,
      ),
      child: new Center(
        child: new Container(
          child: new Text('Hey there\n\nrgba($r, $g, $b, $o)'),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
            const BoxShadow(
              offset: const Offset(2.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: -1.0,
              color: const Color(0x44000000)),
            ],
          ),
        ),
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
