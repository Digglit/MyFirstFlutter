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
  Widget buildTestButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  String display = "0";

  void onButtonPressed(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
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
              color: Colors.lightBlue,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  buildTestButton("7"),
                  buildTestButton("8"),
                  buildTestButton("9"),
                  buildTestButton("4"),
                  buildTestButton("5"),
                  buildTestButton("6"),
                  buildTestButton("1"),
                  buildTestButton("2"),
                  buildTestButton("3"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
