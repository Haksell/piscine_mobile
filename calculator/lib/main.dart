import 'package:flutter/material.dart';

const backgroundColor = Color(0xFF121212);

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
        fontFamily: 'RobotoMono',
      ),
      home: const SafeArea(child: CalculatorPage()),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _textController =
      TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            Expanded(
              flex: 2,
              child: Column(
                children: List.filled(
                  2,
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: TextField(
                        controller: _textController,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        readOnly: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildButtonRow([
                    CalculatorButton('7', Colors.blue),
                    CalculatorButton('8', Colors.blue),
                    CalculatorButton('9', Colors.blue),
                    CalculatorButton('C', Colors.red),
                    CalculatorButton('AC', Colors.red),
                  ]),
                  _buildButtonRow([
                    CalculatorButton('4', Colors.blue),
                    CalculatorButton('5', Colors.blue),
                    CalculatorButton('6', Colors.blue),
                    CalculatorButton('+', Colors.white),
                    CalculatorButton('-', Colors.white),
                  ]),
                  _buildButtonRow([
                    CalculatorButton('1', Colors.blue),
                    CalculatorButton('2', Colors.blue),
                    CalculatorButton('3', Colors.blue),
                    CalculatorButton('×', Colors.white),
                    CalculatorButton('/', Colors.white),
                  ]),
                  _buildButtonRow([
                    CalculatorButton('0', Colors.blue),
                    CalculatorButton('.', Colors.white),
                    CalculatorButton('00', Colors.blue),
                    CalculatorButton('=', Colors.white),
                    CalculatorButton('', Colors.transparent),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<CalculatorButton> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((button) {
          return _buildCalculatorButton(button);
        }).toList(),
      ),
    );
  }

  Widget _buildCalculatorButton(CalculatorButton button) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
          onPressed: button.label.isEmpty
              ? null
              : () {
                  // ignore: avoid_print
                  print("${button.label} pressed");
                },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
          ),
          child: Text(button.label,
              style: TextStyle(
                fontSize: 24,
                color: button.color,
              )),
        ),
      ),
    );
  }
}

class CalculatorButton {
  final String label;
  final Color color;

  CalculatorButton(this.label, this.color);
}
