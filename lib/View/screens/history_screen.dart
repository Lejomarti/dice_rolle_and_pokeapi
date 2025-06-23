import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial del Dado'),
      ),
      body: const Center(
        child: Text(
          'Contenido de la pantalla Historial del Dado',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}