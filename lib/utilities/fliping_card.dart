// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pokemon_card/models/pokemon.dart'; 
import 'package:pokemon_card/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon_card/utilities/animatedtext.dart';


class FlippingPokemonCard extends StatefulWidget {

    FlippingPokemonCard({super.key, required this.query,});
  
  String query;
  @override
  State<FlippingPokemonCard> createState() => _FlippingPokemonCardState();
}

class _FlippingPokemonCardState extends State<FlippingPokemonCard> {
  
    
     PokemonInfo? pokemonInfo;
      bool initialized = false;
      
    
  @override
  void initState() {
    super.initState();
    try {
      getpokemondata('').then((res) {
          pokemonInfo = res;
          initialized = true;
          if (mounted) setState(() {});
      });
    } catch (e) {
      AlertDialog(
        title: Text(e.toString()),
      );
    }
      
         
      } 
  @override
  Widget build(BuildContext context) {
    if (!initialized) return SpinKitRotatingPlain(color: Colors.yellow, size: 70,);
    return Column(
      children: [
        Center(
          child: Container(
            height: 400,
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
                  
                  child:  Image.network(pokemonInfo!.sprites,
                  scale: 0.1,
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

                      Text('ID: ${pokemonInfo!.id.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 59,
                      ),
                      ),
                      SizedBox(height: 10,),

                      Text(pokemonInfo!.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      ),

                      SizedBox(height: 10,),

                      Text('Type: ${pokemonInfo!.type}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      ),

                      SizedBox(height: 10,),

                      Text(
                       'Height: ${pokemonInfo!.height.toString()} Ft',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      ),

                      SizedBox(height: 10,),

                      Text('weight: ${pokemonInfo!.weight} Kg',
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      )
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

