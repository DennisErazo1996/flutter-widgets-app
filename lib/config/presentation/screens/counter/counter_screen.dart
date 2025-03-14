import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context) {

    int valueCounter = 0;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body:  Center(
        child: Text('Valor: $valueCounter', style: const TextStyle(fontSize: 34)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          valueCounter++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}