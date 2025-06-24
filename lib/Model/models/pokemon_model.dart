import "package:flutter/foundation.dart";

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<String> typesList = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'].toString())
        .toList();

    final String imageUrl = json['sprites']['other']?['official-artwork']?['front_default'] ?? '';
    return Pokemon(
      id: json['id'] as int,
      name: json['name'].toString(),
      types: typesList,
      imageUrl: imageUrl,
    );
  }

//esto sirve para enviar datos a la pokeApi u otras APIs
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'types': types,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, types: $types, imageUrl: $imageUrl}';
  }

}
