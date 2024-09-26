import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

const backgroundColor = Color(0xFF121212);
const maxInputLength = 15;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
        fontFamily: 'RobotoMono',
      ),
      home: const SafeArea(child: HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        if (_inputController.text.isNotEmpty) {
          _inputController.text = _inputController.text
              .substring(0, _inputController.text.length - 1);
        }
      } else if (value == 'AC') {
        _inputController.clear();
        _outputController.clear();
      } else if (value == '=') {
        _calculate();
      } else if (maxInputLength >=
          _inputController.text.length + value.length) {
        _inputController.text += value;
      }
    });
  }

  void _calculate() {
    String input =
        _inputController.text.replaceAll('×', '*').replaceAll('÷', '/');
    try {
      double output =
          Parser().parse(input).evaluate(EvaluationType.REAL, ContextModel());
      assert(output.isFinite && !output.isNaN);
      _outputController.text = output == output.toInt()
          ? output.toInt().toString()
          : output.toString();
    } catch (e) {
      _outputController.text = 'Error';
    }
  }

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
                children: [
                  _buildTextField(_inputController),
                  _buildTextField(_outputController),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            Expanded(
              flex: 3,
              child: Column(
                children: calculatorButtons
                    .map(
                      (row) => Expanded(
                        child: Row(
                          children: row.map(_buildCalculatorButton).toList(),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController textEditingController) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: TextField(
          controller: textEditingController,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(border: InputBorder.none),
          readOnly: true,
        ),
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
                  _onButtonPressed(button.label);
                },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
          ),
          child: Text(
            button.label,
            style: TextStyle(fontSize: 24, color: button.color),
          ),
        ),
      ),
    );
  }
}
