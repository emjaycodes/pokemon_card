// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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

class _HomePageState extends State<HomePage> {
 
  
  void updateUI(){
   setState(() {
      // make changes to the state here.
      final number = Random().nextInt(1200);
      getpokemondata(number);
      print(number);
    });
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
          Column(
            children: [
              
              SizedBox(height: 35),
              
              SizedBox(height: 20),
              FlippingPokemonCard(
                
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
                        spreadRadius: 1.0
                      )
                    ],
                      ),
                      
                  child: Center(
                      child: Text(
                    'Generate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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


