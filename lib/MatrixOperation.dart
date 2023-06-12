import 'package:flutter/material.dart';

class Matrix {
  final List<List<double>> elements;

  Matrix(this.elements);

  int get numRows => elements.length;
  int get numCols => elements[0].length;

  Matrix add(Matrix other) {
    if (numRows != other.numRows || numCols != other.numCols) {
      throw ArgumentError("Matrix dimensions must be the same for addition.");
    }

    List<List<double>> result = List.generate(
      numRows,
      (i) => List.generate(
        numCols,
        (j) => elements[i][j] + other.elements[i][j],
      ),
    );

    return Matrix(result);
  }

  Matrix multiply(Matrix other) {
    if (numCols != other.numRows) {
      throw ArgumentError(
          "Number of columns in the first matrix must be equal to the number of rows in the second matrix.");
    }

    List<List<double>> result = List.generate(
      numRows,
      (i) => List.generate(
        other.numCols,
        (j) {
          double sum = 0.0;
          for (int k = 0; k < numCols; k++) {
            sum += elements[i][k] * other.elements[k][j];
          }
          return sum;
        },
      ),
    );

    return Matrix(result);
  }
}

class matrixOperation extends StatefulWidget {
  @override
  _matrixOperationState createState() => _matrixOperationState();
}

class _matrixOperationState extends State<matrixOperation> {
  Matrix matrixA = Matrix([]);
  Matrix matrixB = Matrix([]);
  Matrix resultMatrix = Matrix([]);

  @override
  void initState() {
    super.initState();

    matrixA = Matrix([
      [2, 2],
      [2, 2],
    ]);

    matrixB = Matrix([
      [2, 2],
      [2, 2],
    ]);
  }

  void performMatrixAddition() {
    setState(() {
      resultMatrix = matrixA.add(matrixB);
    });
  }

  void performMatrixMultiplication() {
    setState(() {
      resultMatrix = matrixA.multiply(matrixB);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Matrix Operations')),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (resultMatrix != null)
                  Container(
                    width: 200,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        resultMatrix.elements.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: performMatrixAddition,
                  child: Text('Perform Addition'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: performMatrixMultiplication,
                  child: Text('Perform Multiplication'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
