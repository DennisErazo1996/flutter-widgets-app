import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/presentation/providers/counter_provider.dart';
import 'package:widgets_app/config/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int valueCounter = ref.watch(counterProvider);
    final bool isDarkModeValue = ref.watch(isDarkModeProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: isDarkModeValue ? const Icon(Icons.dark_mode_rounded) : const Icon(Icons.light_mode_rounded),
             onPressed: () { 
                ref.read(isDarkModeProvider.notifier).update((state) => state = !state);
              },
          )
       
        ],
      ),
      body:  Center(
        child: Text('Valor: $valueCounter', style: const TextStyle(fontSize: 34)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}