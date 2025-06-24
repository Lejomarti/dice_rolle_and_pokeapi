import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/models/pokemon_model.dart';
import '../../ViewModel/pokeapi_viewmodel.dart';
import '../widgets/poke_card.dart';



// class PokeapiScreen extends StatefulWidget {
//   const PokeapiScreen({super.key});
//
//   @override
//   State<PokeapiScreen> createState() => _PokeapiScreenState();
// }
//
// class _PokeapiScreenState extends State<PokeapiScreen> {
//   final TextEditingController _idController = TextEditingController();
//
//   @override
//   void dispose() {
//     _idController.dispose(); // Libera los recursos del controlador
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Accede al ViewModel para usar sus métodos y observar su estado.
//     // Usamos listen: false aquí porque no queremos que la pantalla completa se reconstruya
//     // cada vez que el ViewModel notifique cambios (el Consumer ya se encarga de eso).
//     final pokeapiViewModel = Provider.of<PokeapiViewModel>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Poke API Explorer'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Input de texto para el ID del Pokémon
//             TextField(
//               controller: _idController,
//               keyboardType: TextInputType.number, // Solo permite teclado numérico
//               decoration: const InputDecoration(
//                 labelText: 'Pokémon ID',
//                 hintText: 'Introduce un ID numérico (ej. 1, 25, 100)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20), // Espacio
//
//             // Botón para confirmar la búsqueda
//             ElevatedButton(
//               onPressed: () {
//                 // Llama al método del ViewModel para buscar el Pokémon
//                 pokeapiViewModel.fetchPokemonDetails(_idController.text);
//               },
//               child: const Text('Buscar Pokémon'),
//             ),
//             const SizedBox(height: 30), // Espacio
//
//             // Aquí se usa el Consumer para reconstruir solo la sección que muestra
//             // el Pokémon, el indicador de carga o el mensaje de error.
//             Expanded(
//               child: Consumer<PokeapiViewModel>(
//                 builder: (context, viewModel, child) {
//                   if (viewModel.isLoading) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (viewModel.errorMessage != null) {
//                     return Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(
//                           viewModel.errorMessage!,
//                           style: const TextStyle(color: Colors.red, fontSize: 16),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     );
//                   } else if (viewModel.pokemon != null) {
//                     // Si se encontró un Pokémon, muestra la PokeCard
//                     return PokeCard(pokemon: viewModel.pokemon!);
//                   } else {
//                     // Mensaje inicial cuando no hay búsqueda o se limpió
//                     return const Center(
//                       child: Text(
//                         'Introduce un ID para buscar un Pokémon.',
//                         style: TextStyle(fontSize: 18, color: Colors.grey),
//                         textAlign: TextAlign.center,
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class PokeapiScreen extends StatefulWidget {
  const PokeapiScreen({super.key});

  @override
  State<PokeapiScreen> createState() => _PokeapiScreenState();
}

class _PokeapiScreenState extends State<PokeapiScreen> {
  // Controlador para el campo de texto. Debe ser gestionado en un StatefulWidget.
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose(); // IMPORTANTE: Liberar recursos del controlador al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Accede al ViewModel. Usamos listen: false porque solo vamos a llamar a un método
    // (fetchPokemonDetails) cuando se presione el botón.
    // La parte que reconstruye la UI es el Consumer.
    final pokeapiViewModel = Provider.of<PokeapiViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke API Explorer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. Input de texto con el título "Pokémon ID"
            TextField(
              controller: _idController,
              keyboardType: TextInputType.number, // Solo permite teclado numérico
              decoration: const InputDecoration(
                labelText: 'Pokémon ID',
                hintText: 'Introduce un ID numérico (ej. 1, 25, 100)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20), // 2. Espacio

            // 3. Botón para confirmar la búsqueda
            ElevatedButton(
              onPressed: () {
                pokeapiViewModel.clearPokemonData();
                // Llama al método del ViewModel para buscar el Pokémon
                pokeapiViewModel.fetchPokemonDetails(_idController.text);
              },
              child: const Text('Buscar Pokémon'),
            ),
            const SizedBox(height: 30), // 4. Espacio

            // 5. pokeCard: Se muestra de forma dinámica usando Consumer
            Expanded( // Permite que el contenido principal ocupe el resto del espacio vertical
              child: Consumer<PokeapiViewModel>(
                // El Consumer se suscribe a los cambios en el PokeapiViewModel.
                // Reconstruye su builder cada vez que el ViewModel llama a notifyListeners().
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    // Muestra un indicador de carga mientras se busca el Pokémon
                    return const Center(child: CircularProgressIndicator());
                  } else if (viewModel.errorMessage != null) {
                    // Muestra un mensaje de error si la búsqueda falló
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          viewModel.errorMessage!,
                          style: const TextStyle(color: Colors.red, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (viewModel.pokemon != null) {
                    // Si se encontró un Pokémon, muestra la PokeCard
                    return PokeCard(pokemon: viewModel.pokemon!);
                  } else {
                    // Mensaje inicial cuando no hay búsqueda o se limpió
                    return const Center(
                      child: Text(
                        'Introduce un ID para buscar un Pokémon.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}