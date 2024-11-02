import 'package:flutter/material.dart';

class FirstCalculator extends StatefulWidget {
  const FirstCalculator({super.key});

  @override
  State<FirstCalculator> createState() => _FirstCalculatorState();
}

class _FirstCalculatorState extends State<FirstCalculator> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  calculate() {
    double num1 = double.parse(firstNumberController.text);
    double num2 = double.parse(firstNumberController.text);
    double result = 0;

    switch(operatorController.text) {
      case '+':
        result = num1 + num2;
        break;

      case '-':
        result = num1 - num2;
        break;

      case '*':
        result = num1 * num2;
        break;

      case '/':
        result = num1 / num2;
        break;

      default:
        break;
    }

    resultController.text = result.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: deviceWidth / 5,
            child: TextField(
              controller: firstNumberController,
              decoration: const InputDecoration(
                  labelText: '숫자1',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(
            width: deviceWidth / 5,
            child: TextField(
              controller: operatorController,
              decoration: const InputDecoration(
                  labelText: '연산자',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(
            width: deviceWidth / 5,
            child: TextField(
              controller: secondNumberController,
              decoration: const InputDecoration(
                  labelText: '숫자2',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calculate,
            child: Text(
              "=",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: deviceWidth / 5,
            child: TextField(
              controller: resultController,
              decoration: const InputDecoration(
                  labelText: '결과',
                  border: OutlineInputBorder()
              ),
            ),
          )
        ],
      ),
    );
  }
}