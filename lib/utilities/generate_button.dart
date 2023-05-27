import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key, required this.function});

  final  Function()? function;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: 150,
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
        child: const Center(
            child: Text(
          'Generate',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        )),
      ),
    );
  }
}
