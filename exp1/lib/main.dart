import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font and Color Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Color _textColor = Colors.black;
  double _fontSize = 20.0;
  String _fontFamily = 'Roboto';
  void _changeColor() {
    setState(() {
      _textColor = _textColor == Colors.black ? Colors.red : Colors.black;
    });
  }
  void _changeFontSize() {
    setState(() {
      _fontSize = _fontSize == 20.0 ? 30.0 : 20.0;
    });
  }
  void _changeFontFamily() {
    setState(() {
      _fontFamily = _fontFamily == 'Roboto' ? 'Lobster' : 'Roboto';
    });
  }
  void _showToast() {
    Fluttertoast.showToast(
      msg: "Button Pressed",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font and Color Changer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, Flutter!',
              style: TextStyle(
                color: _textColor,
                fontSize: _fontSize,
                fontFamily: _fontFamily,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _changeColor();
                _changeFontSize();
                _changeFontFamily();
                _showToast();
              },
              child: Text('Change Font and Color'),
            ),
          ],
        ),
      ),
    );
  }
}