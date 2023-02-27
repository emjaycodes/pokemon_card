// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_card/models/pokemon.dart';


Future<PokemonInfo> getpokemondata(String query) async {
    
    query = 'pichu';
    String url = 'https://pokeapi.co/api/v2/pokemon/$query';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
        String data = response.body;
        final decodedData = jsonDecode(data);
        return PokemonInfo.fromJson(decodedData);
    } else {
        throw (response.statusCode);
    }
}