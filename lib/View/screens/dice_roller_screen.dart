import 'dart:math';
import 'package:flutter/material.dart';

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({super.key});

  @override
  State<DiceRollerScreen> createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  int _curentDiceValue = 1;

  void _rollDice() {
    int newRoll = Random().nextInt(6) + 1;

    setState(() {
      _curentDiceValue = newRoll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roll a Dice')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Lanza el dado:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/dice$_curentDiceValue.png'),
            ),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: (_rollDice),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Lanzar Dado'),
            ),
          ],
        ),
      ),
    );
  }
}


