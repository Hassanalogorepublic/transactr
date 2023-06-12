import 'dart:math';
import 'package:flutter/material.dart';

class Random_number extends StatefulWidget {
  @override
  _Random_numberState createState() => _Random_numberState();
}

class _Random_numberState extends State<Random_number> {
  int minValue = 1;
  int maxValue = 100;
  int randomNumber = 0;

  void generateRandomNumber() {
    setState(() {
      randomNumber = Random().nextInt(maxValue - minValue + 1) + minValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Random Number Generator')),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      randomNumber.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Min Value: $minValue'),
                Text('Max Value: $maxValue'),
                SizedBox(height: 20),
                Slider(
                  value: minValue.toDouble(),
                  min: 1,
                  max: 100,
                  divisions: 99,
                  onChanged: (value) {
                    setState(() {
                      minValue = value.toInt();
                    });
                  },
                ),
                Slider(
                  value: maxValue.toDouble(),
                  min: 1,
                  max: 100,
                  divisions: 99,
                  onChanged: (value) {
                    setState(() {
                      maxValue = value.toInt();
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: generateRandomNumber,
                  child: Text('Generate Random Number'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
