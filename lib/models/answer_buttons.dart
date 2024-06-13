import 'package:flutter/material.dart';
class AnswerButtons extends StatelessWidget{
  const AnswerButtons(this.text, this.onTap, {super.key});
  final String text;
  final void Function() onTap;
  @override
  Widget build(context){
    return 
    ElevatedButton(onPressed: onTap, 
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(149, 51, 5, 112),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    ),
    child: Text(text),);
  }
}