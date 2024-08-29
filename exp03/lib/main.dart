import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(ScientificCalculator());
}

class ScientificCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String expression = '';
  String result = '';

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        expression = '';
        result = '';
      } else if (buttonText == '=') {
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
        } catch (e) {
          result = 'Error';
        }
      } else {
        expression += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(buttonText),
          child: Text(buttonText, style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 160, 200, 233),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text('Scientific Calculator'),
        backgroundColor: Color.fromARGB(255, 135, 96, 202),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              expression,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('sin'),
                  buildButton('cos'),
                  buildButton('tan'),
                  buildButton('log'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('√'),
                  buildButton('^'),
                  buildButton('ln'),
                  buildButton('('),
                  buildButton(')'),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('C'),
                  buildButton('='),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}