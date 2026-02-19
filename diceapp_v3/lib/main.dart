import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  // Function to determine color based on total
  Color getTotalColor(int total) {
    if (total == 6) {
      return Colors.yellow;
    } else if (total < 6) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    int total = leftDiceNumber + rightDiceNumber;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Two Dice App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/dice$leftDiceNumber.png',
                  width: 160,
                ),
                const SizedBox(width: 20),
                Image.asset(
                  'assets/images/dice$rightDiceNumber.png',
                  width: 160,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Total with dynamic color
            Text(
              'Total: $total',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: getTotalColor(total),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
