// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pokemon_card/models/pokemon.dart'; 
import 'package:pokemon_card/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon_card/utilities/animatedtext.dart';
import 'dart:math';


class FlippingPokemonCard extends StatelessWidget {

  final String type;
   final int height;
   final int weight;
   final int id;
   final String name;
   final String sprites;
   final String abilities;

    const FlippingPokemonCard({super.key, required this.type, required this.height, required this.weight, required this.id, required this.name, required this.sprites, required this.abilities,});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 550,
            width: 300,
            child: FlipCard(
                front: Container(
                  decoration: BoxDecoration(
                    color:  Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 3.0),
                        blurRadius: 9.0,
                        spreadRadius: 2.0
                      )
                    ],
                  ),
                  
                  child:  Image.network( 
                    sprites
                    // pokemonInfo!.sprites,
                  // scale: 0.1,
                  ) ,
                ),
                back: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0
                      )
                    ],
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      SizedBox(height: 20,),
                        Text(id.toString(),
                      // Text('ID: ${pokemonInfo!.id.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 59,
                      ),
                      ),
                      SizedBox(height: 10,),
                        Text(name,
                      // Text('Name: ${pokemonInfo!.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      ),

                      SizedBox(height: 10,),

                        Text(abilities,
                    // Text('abilty: ${pokemonInfo!.abilities}',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      ),

                      SizedBox(height: 10,),

                          Text('type',
                      // Text('Type: ${pokemonInfo!.type}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      ),

                      SizedBox(height: 10,),

                        Text(height.toString(),
                      // Text(
                      //  'Height: ${pokemonInfo!.height.toString()} cm',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      ),

                      SizedBox(height: 10,),

                        Text(weight.toString(),
                      // Text('weight: ${pokemonInfo!.weight} Kg',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      ),

                    ],
                  ),
                )),
          ),
        ),
        SizedBox(height: 10,),
        // Liquidtext(),
      ],
    );
  }
}

