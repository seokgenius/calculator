import 'package:flutter/material.dart';

class SecondCalculator extends StatefulWidget {
  const SecondCalculator({super.key});

  @override
  State<SecondCalculator> createState() => _SecondCalculatorState();
}

class _SecondCalculatorState extends State<SecondCalculator> {
  List<String> validOperators = ['+', '-', '*', '/'];

  TextEditingController firstNumberController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  TextEditingController errorMessageController = TextEditingController();

  calculate() {
    double num1 = double.parse(firstNumberController.text);
    double num2 = double.parse(firstNumberController.text);
    double result = 0;

    if (!validOperators.contains(operatorController.text)) {
      errorMessageController.text = "연산자가 +,-,*,/ 중의 하나이어야 합니다.";
      return;
    }

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
          SizedBox(
            // 추가됨
            child: TextField(
              controller: errorMessageController,
              textAlign: TextAlign.center,
              enabled: false,
              decoration: InputDecoration(
                labelText: "메세지",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      )
    );
  }
}