// To parse this JSON data, do
//
//     final pokemonInfo = pokemonInfoFromJson(jsonString);

import 'dart:convert';

PokemonInfo pokemonInfoFromJson(String str) => PokemonInfo.fromJson(json.decode(str));


class PokemonInfo {
   String type;
   int height;
   int weight;
   int id;
   String name;
   String? sprites;
   String abilities;

   PokemonInfo({
   required this.type,
    required this.height,
     required this.weight,
     required this.id,
     required this.name,
      this.sprites,
     required this.abilities
});

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo(
        type: json['types'][0]['type']['name'] ?? 'Unkwown',
         height: json['height'] ?? 0,
         weight: json['weight'] ?? 0,
         id: json['id'] ?? 0,
        name: json['species']['name'] ?? 'Unkwown', 
        sprites: json['sprites'] != null ? json['sprites']['other']['home']['front_default'] : null,
        abilities: json['abilities'][0]['ability']['name'] ?? 'Unkwown',
        );
        
        
  }
}