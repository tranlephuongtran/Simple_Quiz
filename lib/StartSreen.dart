import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(172, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Giải đố cùng Phương Trân',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: startQuiz,
          icon: const Icon(Icons.arrow_right_alt, color: Colors.white,),
          label: const Text(
            'Start Quiz',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}

