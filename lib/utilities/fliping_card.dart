// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pokemon_card/utilities/animatedtext.dart';

class FlippingPokemonCard extends StatelessWidget {
  final String type;
  final int height;
  final int weight;
  final int id;
  final String name;
  final String sprites;
  final String abilities;

  const FlippingPokemonCard({
    super.key,
    required this.type,
    required this.height,
    required this.weight,
    required this.id,
    required this.name,
    required this.sprites,
    required this.abilities,
  });

  final isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: FlipCard(
                  front: Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 3.0),
                            blurRadius: 9.0,
                            spreadRadius: 2.0)
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Image.network(sprites,
                              loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(child: CircularProgressIndicator());
                          }),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Name: $name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  back: LayoutBuilder(builder: (context, contraints) {
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                              spreadRadius: 2.0)
                        ],
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'ID: ${id.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 59,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Name: $name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if(contraints.maxHeight > 300)
                          Expanded(
                            child: Text(
                              'Ability: $abilities',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ) else Text(
                              'Ability: $abilities',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Type: $type',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Height: ${height.toString()} mm',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' Weight: ${weight.toString()} LBS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    );
                  },),),),
        ),
        SizedBox(
          height: 10,
        ),
        TextAnimation(),
      ],
    );
  }
}
