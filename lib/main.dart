import 'package:flutter/material.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(const ExtendedCounterApp());
}

class ExtendedCounterApp extends StatelessWidget {
  const ExtendedCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}
