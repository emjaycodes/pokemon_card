// To parse this JSON data, do
//
//     final pokemonInfo = pokemonInfoFromJson(jsonString);

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

PokemonInfo pokemonInfoFromJson(String str) => PokemonInfo.fromJson(json.decode(str));

// String pokemonInfoToJson(PokemonInfo data) => json.encode(data.toJson());


class PokemonInfo {
   String type;
   int height;
   int weight;
   int id;
   String name;
   String sprites;

   PokemonInfo({
   required this.type,
    required this.height,
     required this.weight,
     required this.id,
     required this.name,
     required this.sprites,
});

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo(
        type: json['types'][0]['type']['name'],
         height: json['height'],
         weight: json['weight'],
         id: json['id'],
        name: json['species']['name'], 
        sprites: json['sprites']['other']['home']['front_default']
        
        );
        
        
  }
}