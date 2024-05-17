import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  CalculatePage({
    Key? key,
    required this.isMale,
    required this.isFemale,
    required this.bmiResult,
    required this.bmiGrade,
    // required this.weight,
    // required this.height,
  }) : super(key: key);

  // double weight;
  // double height;
  bool isMale, isFemale;
  double bmiResult;
  String bmiGrade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator'),
        leading: const SizedBox(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Result',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              bmiGrade,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 85,
            ),
            Text(
              '${bmiResult.toStringAsFixed(1)} kg/m2',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            const Text(
              'It is health that is real wealth. And not pieces of gold and silver',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
          bmiResult = 0;
        },
        label: const Text(
          'RE-CALCULATE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.calculate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
