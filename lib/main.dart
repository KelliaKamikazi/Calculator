import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: const Text(
                '0',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              _buildButtonRow(['7', '8', '9', '/']),
              _buildButtonRow(['4', '5', '6', 'x']),
              _buildButtonRow(['1', '2', '3', '-']),
              _buildButtonRow(['C', '0', '=', '+']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return _buildButton(button);
      }).toList(),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(24),
            shape: const CircleBorder(),
            backgroundColor: _getButtonColor(text), // Updated here
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            
            ),
          ),
          
        ),
      ),
    );
  }

  Color _getButtonColor(String text) {
    if (text == 'C') {
      return Colors.blueGrey;
    } else if (text == '=' || text == '/' || text == 'x' || text == '-' || text == '+') {
      return Colors.blue;
    } else {
      return Colors.grey[850]!;
    }
  }
}
