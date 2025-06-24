import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Model/models/pokemon_model.dart';

class PokeapiViewModel extends ChangeNotifier {

  //pokemon actual
  Pokemon? _pokemon;
  bool _isLoading = false;
  String? _errorMessage;
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  //los getters de los privados
  Pokemon? get pokemon => _pokemon;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchPokemonDetails(String idText) async {
    final int id = int.tryParse(idText) ?? 0;
//1. verificar si el id es valido
    if (id ==0){
      _errorMessage = 'Por favor ingrese un ID válido';
      _pokemon = null;
      _isLoading = false;
      notifyListeners();
      return;
    }

//2. estado de carga y limpiar estados anteriores
    _isLoading = true;
    _pokemon = null;
    _errorMessage = null;
    notifyListeners();

    //3. hacer el trycatch con

    try{
      final url = Uri.parse('$_baseUrl/pokemon/$id');
      final response = await http.get(url);

      //4.usar el http para el try
      if(response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        _pokemon = Pokemon.fromJson(data);
      } else if(response.statusCode == 404){
        _errorMessage = 'Pokémon no encontrado';
      }else{
        _errorMessage = 'Error al cargar el Pokémon: ${response.statusCode}';
      }
      //5. manejar los errores
    }catch(e){
      _errorMessage = 'Error al cargar el Pokémon: $e';
    }finally{
      _isLoading = false;
      notifyListeners();
    }

  }

  void clearPokemonData() {
    _pokemon = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }


}