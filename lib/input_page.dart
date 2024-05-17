import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_uts/calculate_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 40;
  double _currentHeight = 0;
  bool isMale = false, isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            //===============================================================
            // MALE FEMALE BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      height: 150,
                      width: 150,
                      color: isMale
                          ? Colors.blue
                          : const Color.fromARGB(255, 201, 201, 201),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isMale = !isMale;
                                isFemale = false;
                              });
                            },
                            icon: const Icon(Icons.male),
                            iconSize: 80,
                          ),
                          const Text(
                            'MALE',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: isFemale
                        ? Colors.pink
                        : const Color.fromARGB(255, 201, 201, 201),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFemale = !isFemale;
                              isMale = false;
                            });
                          },
                          icon: const Icon(Icons.female),
                          iconSize: 80,
                        ),
                        const Text(
                          'FEMALE',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 50,
            ),

            //===========================================================
            // HEIGHT SLIDER

            Column(
              children: [
                const Text(
                  'Height',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${_currentHeight.round().toString()} cm',
                  style: const TextStyle(fontSize: 30),
                ),
                Slider(
                    value: _currentHeight,
                    min: 0,
                    max: 200,
                    onChanged: (height) {
                      _currentHeight = height;
                      setState(() {});
                    })
              ],
            ),

            const SizedBox(
              height: 50,
            ),

            //===========================================================================
            // WEIGHT COUNTER
            Column(
              children: [
                const Text(
                  'Weight',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          weight--;
                          setState(() {});
                        },
                        style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            CircleBorder(),
                          ),
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        child: const Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                    Text(
                      '$weight kg',
                      style: const TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          weight++;
                          setState(() {});
                        },
                        style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            CircleBorder(),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.green,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // _currentHeight = _currentHeight / 100;
          double calculatedBMI =
              weight.toDouble() / pow((_currentHeight/100), 2);
          String grade = '';
          String bmiGrade() {
            if (isMale && isFemale == false) {
              if (calculatedBMI <= 18) {
                grade = 'Underweight';
              } else if (calculatedBMI > 18 && calculatedBMI <= 25) {
                grade = 'Normal';
              } else if (calculatedBMI > 25 && calculatedBMI <= 27) {
                grade = 'Overweight';
              } else if (calculatedBMI > 27) {
                grade = 'Obese';
              }
            } else if (isFemale && isMale == false) {
              if (calculatedBMI <= 17) {
                grade = 'Underweight';
              } else if (calculatedBMI > 17 && calculatedBMI <= 23) {
                grade = 'Normal';
              } else if (calculatedBMI > 23 && calculatedBMI <= 27) {
                grade = 'Overweight';
              } else if (calculatedBMI > 27) {
                grade = 'Obese';
              }
            }
            return grade;
          }
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CalculatePage(
                // weight: weight.toDouble(),
                // height: _currentHeight,
                isMale: isMale,
                isFemale: isFemale,
                bmiResult: calculatedBMI,
                bmiGrade: bmiGrade(),
              ),
            ),
          );
        },
        label: const Text(
          'CALCULATE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.calculate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
