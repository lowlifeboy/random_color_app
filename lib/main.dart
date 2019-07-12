import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  // String _color = '#fff';

  // void _incrementCounter() {
  //   setState(() {
  //     _color = '#fff';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Color App'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hey there',
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(220, 245, 245, 1),
      
      
      // floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
