import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ex01',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _texts = ['A Simple Text', 'Hello World!'];
  int _idx = 0;

  void _updateText() {
    setState(() {
      _idx = (_idx + 1) % _texts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_texts[_idx], style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateText,
              child: const Text('Click me', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
