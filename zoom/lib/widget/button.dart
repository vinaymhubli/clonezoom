

import 'package:flutter/material.dart';

import '../utils/colors.dart';
class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Button({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35,right: 35),
      child: ElevatedButton(
        child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        onPressed: onPressed,
        style:  ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            minimumSize: const Size(
              double.infinity,
              50,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: buttonColor),
            ),
      )),
    );
  }
}