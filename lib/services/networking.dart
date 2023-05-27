import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokemon_card/models/pokemon.dart';
import 'package:pokemon_card/utilities/show_error_dialog.dart';

Future<PokemonInfo> getpokemondata(
    BuildContext context, int characterid) async {
  try {
    String url = 'https://pokeapi.co/api/v2/pokemon/$characterid';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      final decodedData = jsonDecode(data);
      return PokemonInfo.fromJson(decodedData);
    } else {
      throw 'failed to load data : ${response.statusCode}';
    }
  } catch (e) {
    print(e.toString());
    showErrorDialog(context, 'An error occurred: $e');
    throw e.toString();
  }
}
