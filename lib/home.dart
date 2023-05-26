// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon_card/models/pokemon.dart';
import 'package:pokemon_card/services/networking.dart';
import 'utilities/fliping_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities/animatedtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isLoading = false;
PokemonInfo? pokemonInfo;

class _HomePageState extends State<HomePage> {
  int updateUI() {
    // make changes to the state here.
    final number = Random().nextInt(1200);
    print(number);
    return number;
  }

  @override
  void initState() {
    getpokemondata(updateUI());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Center(child: Text('POKEMON CARD')),
      ),
      body: ListView(
        children: [
          isLoading
              ? SpinKitRotatingPlain(
                  size: 20,
                  color: Colors.purple,
                )
              : Column(
                  children: [
                    SizedBox(height: 35),
                    SizedBox(height: 20),
                    FlippingPokemonCard(
                      abilities: pokemonInfo!.abilities,
                      height: pokemonInfo!.height,
                      id: pokemonInfo!.id,
                      name: pokemonInfo!.name,
                      sprites: pokemonInfo!.sprites,
                      type: pokemonInfo!.type,
                      weight: pokemonInfo!.weight,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          updateUI();
                        });
                      }),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 3.0),
                                blurRadius: 1.0,
                                spreadRadius: 1.0)
                          ],
                        ),
                        child: Center(
                            child: Text(
                          'Generate',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        )),
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
