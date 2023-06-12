import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class N_formatting extends StatefulWidget {
  @override
  _N_formattingState createState() => _N_formattingState();
}

class _N_formattingState extends State<N_formatting> {
  double value = 0.0;
  String formattedValue = '';

  void formatValue() {
    NumberFormat customFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: '@',
      decimalDigits: 2,
    );

    setState(() {
      formattedValue = customFormat.format(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Number Formathing")),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
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
                        formattedValue,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (newValue) {
                      setState(() {
                        value = double.tryParse(newValue) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter a value',
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: formatValue,
                    child: Text('Format'),
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
