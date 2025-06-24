import 'package:dice_rolle_and_pokeapi/View/widgets/dice_roll_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/models/dice_roll_model.dart';
import '../../ViewModel/history_viewmodel.dart';

//esta primera parte la dejo como esta
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

//aca si modifico
class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial del Dado'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              _showClearHistoryConfirmation(context);
              },
          )
        ],
      ),
      body: Consumer<HistoryViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.diceHistory.isEmpty) {
              return const Center(
                child: Text(
                  'No hay lanzamientos en el historial.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              );
            }

              else {
              return ListView.builder(
                itemCount: viewModel.diceHistory.length,
                itemBuilder: (context, index) {
                  // Muestra los lanzamientos más recientes primero
                  final roll = viewModel.diceHistory[index];
                  return DiceRollCard(
                    roll: roll,
                    // El 'index' ya no se pasa a la card si la card solo muestra el valor.
                    // Si quisieras mostrar 'Lanzamiento #1', necesitarías pasarlo de nuevo y usarlo en la card.
                  );
                },
              );
            }
          },
        ),
    );
  }
}

  void _showClearHistoryConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Eliminación'),
          content: Text('¿Estás seguro de que quieres borrar todo el historial de lanzamientos?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Borrar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Provider.of<HistoryViewModel>(context, listen: false).clearHistory();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

