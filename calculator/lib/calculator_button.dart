import 'package:flutter/material.dart';

class CalculatorButton {
  final String label;
  final Color color;

  const CalculatorButton(this.label, this.color);
}

const calculatorButtons = [
  [
    CalculatorButton('7', Colors.blue),
    CalculatorButton('8', Colors.blue),
    CalculatorButton('9', Colors.blue),
    CalculatorButton('C', Colors.red),
    CalculatorButton('AC', Colors.red),
  ],
  [
    CalculatorButton('4', Colors.blue),
    CalculatorButton('5', Colors.blue),
    CalculatorButton('6', Colors.blue),
    CalculatorButton('+', Colors.white),
    CalculatorButton('-', Colors.white),
  ],
  [
    CalculatorButton('1', Colors.blue),
    CalculatorButton('2', Colors.blue),
    CalculatorButton('3', Colors.blue),
    CalculatorButton('×', Colors.white),
    CalculatorButton('÷', Colors.white),
  ],
  [
    CalculatorButton('0', Colors.blue),
    CalculatorButton('.', Colors.white),
    CalculatorButton('00', Colors.blue),
    CalculatorButton('', Colors.transparent),
    CalculatorButton('=', Colors.red),
  ],
];
