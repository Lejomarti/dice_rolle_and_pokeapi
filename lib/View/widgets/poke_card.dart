import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/models/pokemon_model.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokeCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Text(
                  'ID: ${pokemon.id}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),


            Text(
              'Tipo(s): ${pokemon.types.join(', ')}',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),


            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                pokemon.imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.contain,

                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}