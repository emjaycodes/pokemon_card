// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_card/models/pokemon.dart';

Future<PokemonInfo> getpokemondata(int characterid) async {
  try {
    String url = 'https://pokeapi.co/api/v2/pokemon/$characterid';
    final response = await http.get(Uri.parse(url));
    String data = response.body;
    print(response.statusCode);
    final decodedData = jsonDecode(data);
    return PokemonInfo.fromJson(decodedData);
  } catch (e) {
    throw e.toString();
    // print(e.toString());
  }
}
