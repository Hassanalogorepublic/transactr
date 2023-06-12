import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Math_Expression extends StatefulWidget {
  @override
  _Math_ExpressionState createState() => _Math_ExpressionState();
}

class _Math_ExpressionState extends State<Math_Expression> {
  String expression = '';
  String result = '';

  void evaluateExpression() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);

      ContextModel cm = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        result = evalResult.toString();
      });
    } catch (e) {
      setState(() {
        result = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Math Expression Evaluation')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        result,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        expression = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter a math expression',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: evaluateExpression,
                    child: Text('Evaluate Expression'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
