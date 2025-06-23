

import 'package:flutter/material.dart';

class DiceRollCard extends StatelessWidget {
  const DiceRollCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: (Row(
        children: [
          SizedBox(),//imagen
          SizedBox(width: 16), //espacio
          Text("resultado: #1")
        ]
      )),
    );
  }
}
