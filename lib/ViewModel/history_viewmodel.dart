import 'package:flutter/material.dart';

import '../Model/models/dice_roll_model.dart';

//que tiene un buen viewModel
// extiende de  ChangeNotifiers, para poder avisar a los oyentes (vistas) cuando se actualiza el modelo.
class HistoryViewModel extends ChangeNotifier {
  // -------------------------------------------------------------------------
  // 1. Estado Observable (Datos que la UI necesita mostrar)
  // -------------------------------------------------------------------------
  /* En esta app, lo que se debe mostrar es el historial de lanzamientos.
  * estos vienen de una lista de objetos de tipo DiceRoll.*/

  final List<RolledDice> _diceHistory = [];

  //Getters publicos para acceder a los datos.
  List<RolledDice> get diceHistory => List.unmodifiable(_diceHistory);

  // -------------------------------------------------------------------------
  // 2. Lógica de Presentación y Métodos (Acciones que la UI puede solicitar)
  // -------------------------------------------------------------------------

  /* En esta app, la logica dicta algo como:
   agarrar el ultimo resultado y agregarlo a la lista historial.
   hacer un if (lista > 10) borrar el ultimo resultado.
   notificar a los listeners (vistas) que el modelo ha cambiado.
*/

    void addRoll(int value) {
      final newRoll = RolledDice(value: value);
      _diceHistory.insert(0, newRoll);

      if (_diceHistory.length > 10) {
        _diceHistory.removeLast();
      }

      notifyListeners();
    }

 void clearHistory() {
      _diceHistory.clear();
      notifyListeners();
 }

}

