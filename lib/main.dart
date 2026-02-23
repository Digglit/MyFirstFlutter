import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String display = "0";

  Widget buildTestButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {
          onButtonPressed(label);
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  String evaluate(String expression) {
    try {
      final parts = expression.split(RegExp(r'[\+\-\*/]'));
      final operator = expression.replaceAll(RegExp(r'[0-9]'), '');

      if (parts.length != 2 || operator.length != 1) {
        return "Err";
      }

      final num1 = int.parse(parts[0]);
      final num2 = int.parse(parts[1]);

      switch (operator) {
        case "+":
          return (num1 + num2).toString();
        case "-":
          return (num1 - num2).toString();
        case "*":
          return (num1 * num2).toString();
        case "/":
          return (num1 / num2).toString();
        default:
          return "Err";
      }
    } catch (_) {
      return "Err";
    }
  }

  void onButtonPressed(String value) {
    setState(() {
      switch (value) {
        case "C":
          display = "0";
          break;
        case "=":
          display = evaluate(display);
          break;
        default:
          if (display == "0" || display == "Err") {
            display = value;
          } else {
            display += value;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              color: Colors.grey.shade200,
              child: Text(display, style: const TextStyle(fontSize: 48)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  buildTestButton("7"),
                  buildTestButton("8"),
                  buildTestButton("9"),
                  buildTestButton("/"),

                  buildTestButton("4"),
                  buildTestButton("5"),
                  buildTestButton("6"),
                  buildTestButton("*"),

                  buildTestButton("1"),
                  buildTestButton("2"),
                  buildTestButton("3"),
                  buildTestButton("-"),

                  buildTestButton("C"),
                  buildTestButton("0"),
                  buildTestButton("="),
                  buildTestButton("+"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
