import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../models/pokemon_model.dart';

//aca se va a llamar al http

class PokeapiRemoteDataSource {
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  Future<Pokemon> getPokemonDetails(int id) async {
    final url = Uri.parse('$_baseUrl/pokemon/$id');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Pokemon.fromJson(data);
      } else if (response.statusCode == 404) {
        throw Exception('Pokemon con ID $id no encontrado.');
      } else {
        throw Exception('Error al cargar Pokémon: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión o parseo: $e');
    }
  }
}
