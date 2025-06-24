import 'package:dice_rolle_and_pokeapi/Model/models/dice_roll_model.dart';
import 'package:flutter/material.dart';

class DiceRollCard extends StatelessWidget {

  final RolledDice roll;

  const DiceRollCard({super.key, required this.roll});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/dice${roll.value}.png'),
            ),
            const SizedBox(width: 16),
            Text(
              'Resultado: ${roll.value}',
              style: const TextStyle(
                fontSize: 18,)
            )
          ]
        ),
      )
    );
  }
}
