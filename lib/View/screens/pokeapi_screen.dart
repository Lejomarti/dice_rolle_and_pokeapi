import 'package:flutter/material.dart';

class PokeapiScreen extends StatelessWidget {
  const PokeapiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke API'),
      ),
      body: const Center(
        child: Text(
          'Contenido de la pantalla Poke API',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
