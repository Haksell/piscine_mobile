import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ex00',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('A Simple Text', style: TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                print('Button pressed');
              },
              child: const Text('Click me', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
