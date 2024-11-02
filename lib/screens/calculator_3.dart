import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class ThirdCalculator extends StatefulWidget {
  const ThirdCalculator({super.key});

  @override
  State<ThirdCalculator> createState() => _ThirdCalculatorState();
}

class _ThirdCalculatorState extends State<ThirdCalculator> {
  TextEditingController expressionController = TextEditingController();
  TextEditingController errorMessageController = TextEditingController();

  calculate() {
    var evaluator = const ExpressionEvaluator();

    try {
      var result = evaluator.eval(Expression.parse(expressionController.text), {});

      errorMessageController.text = "";
      expressionController.text = result.toString();
    } catch(e) {
      errorMessageController.text = "계산식이 올바르지 않습니다. Clear한 후 다시 시도하세요.";
      return;
    }
  }

  clear() {
    expressionController.text = '';
    errorMessageController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: TextField(
            controller: expressionController,
            textAlign: TextAlign.center,
            enabled: false,
            decoration: InputDecoration(
              labelText: "계산식",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        // C ~ /
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: clear,
              child: Text(
                "C",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "/";
              },
              child: Text(
                "/",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        // 7 ~ *
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                expressionController.text += "7";
              },
              child: Text(
                "7",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "8";
              },
              child: Text(
                "8",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "9";
              },
              child: Text(
                "9",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "*";
              },
              child: Text(
                "*",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        // 4 ~ -
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                expressionController.text += "4";
              },
              child: Text(
                "4",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "5";
              },
              child: Text(
                "5",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "6";
              },
              child: Text(
                "6",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "-";
              },
              child: Text(
                "-",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        // 1 ~ +
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                expressionController.text += "1";
              },
              child: Text(
                "1",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "2";
              },
              child: Text(
                "2",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "3";
              },
              child: Text(
                "3",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "+";
              },
              child: Text(
                "+",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        // ~ =
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                expressionController.text += "0";
              },
              child: Text(
                "0",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: calculate,
              child: Text(
                "=",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        // 오류 메시지
        SizedBox(
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
    );
  }
}
