// ignore_for_file: prefer_const_constructors
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
  final textController = TextEditingController();
  String characterName = '';
  late String query;

  @override
  Widget build(BuildContext context) {
    // getpokemondata(characterName);

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    hintText: 'Type character name',
                    hintStyle: GoogleFonts.poppins(fontSize: 12),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    characterName = textController.text;
                    FlippingPokemonCard(query: characterName);
                    print(characterName);
                  });
                }),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                       boxShadow: [
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
                    'Search',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  )),
                ),
              ),
              SizedBox(height: 20),
              FlippingPokemonCard(
                query: characterName,
              ),
              SizedBox(
                height: 30,
              ),
              
            
            ],
          ),
        ],
      ),
    );
  }
}


