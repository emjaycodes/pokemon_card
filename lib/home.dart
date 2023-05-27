import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon_card/models/pokemon.dart';
import 'package:pokemon_card/services/networking.dart';
import 'package:pokemon_card/utilities/generate_button.dart';
import 'utilities/fliping_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int number;

  late Future<PokemonInfo> getpokemon;

  @override
  void initState() {
    number = Random().nextInt(1000);
    getpokemon = getpokemondata(context,number);
    super.initState();
  }

  void generateRandomPokemon() {
    setState(() {
      number = Random().nextInt(1000);
      getpokemon = getpokemondata(context,number);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: const Center(child: Text('POKEMON CARD')),
      ),
      body: Column(
        children: [
          const SizedBox(height: 35),
          Expanded(
            child: FutureBuilder<PokemonInfo>(
                future: getpokemon,
                builder:
                    (BuildContext context, AsyncSnapshot<PokemonInfo> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SpinKitRotatingPlain(
                      size: 20,
                      color: Colors.yellow,
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return FlippingPokemonCard(
                      abilities: snapshot.data!.abilities,
                      height: snapshot.data!.height,
                      id: snapshot.data!.id,
                      name: snapshot.data!.name,
                      sprites: snapshot.data?.sprites ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
                      type: snapshot.data!.type,
                      weight: snapshot.data!.weight,
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 10,
          ),
         GenerateButton(function: generateRandomPokemon),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
