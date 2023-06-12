import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(child: Text('Maths Tools')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  child: Text('Number Formating'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'number_formatting');
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  child: Text('Random Number'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'random_number');
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  child: Text('Math Expression'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Math_Expression');
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  child: Text('Matrix Operation'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'matrix');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
