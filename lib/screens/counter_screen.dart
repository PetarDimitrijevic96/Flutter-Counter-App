import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_counter_button.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _changeCounter(int delta) {
    setState(() {
      _counter += delta;
    });
  }

  void _multiplyByTwo() {
    setState(() {
      _counter *= 2;
    });
  }

  void _divideByTwo() {
    setState(() {
      _counter = (_counter / 2).round(); // rundet ganzzahlig auf oder ab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Counter', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView( // Um Overflow auf kleinen Bildschirmen zu vermeiden
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Aktueller Zählerstand:',
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                '$_counter',
                style: const TextStyle(
                    fontSize: 72, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 50),
              
              // Layout für die Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    // Reihe 1: +1 und -1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCounterButton(
                          label: '1',
                          icon: Icons.add,
                          backgroundColor: Colors.green.shade400,
                          textColor: Colors.white,
                          borderRadius: 30.0, // stark abgerundet
                          onPressed: () => _changeCounter(1),
                        ),
                        CustomCounterButton(
                          label: '1',
                          icon: Icons.remove,
                          backgroundColor: Colors.red.shade400,
                          textColor: Colors.white,
                          borderRadius: 8.0, // leicht abgerundet
                          onPressed: () => _changeCounter(-1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Reihe 2: +2 und -2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCounterButton(
                          label: '2',
                          icon: Icons.keyboard_double_arrow_up,
                          backgroundColor: Colors.teal.shade500,
                          textColor: Colors.yellowAccent,
                          borderRadius: 15.0, // normal
                          onPressed: () => _changeCounter(2),
                        ),
                        CustomCounterButton(
                          label: '2',
                          icon: Icons.keyboard_double_arrow_down,
                          backgroundColor: Colors.orange.shade500,
                          textColor: Colors.black,
                          borderRadius: 12.0, // leicht abgerundet
                          onPressed: () => _changeCounter(-2),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Reihe 3: *2 und /2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCounterButton(
                          label: '2',
                          icon: Icons.close,
                          backgroundColor: Colors.indigo.shade600,
                          textColor: Colors.white,
                          borderRadius: 20.0,
                          onPressed: _multiplyByTwo,
                        ),
                        CustomCounterButton(
                          label: '2',
                          icon: CupertinoIcons.divide,
                          backgroundColor: Colors.pink.shade400,
                          textColor: Colors.white,
                          borderRadius: 50.0, // Pillen-Form
                          onPressed: _divideByTwo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
