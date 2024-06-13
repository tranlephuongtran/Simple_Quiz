import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer_buttons.dart';
import 'package:quiz_app/data/questions.dart';
class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen(this.onSelectedAnswer, {super.key});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text(currentQuestion.text, style: const TextStyle(color: Color.fromARGB(255, 233, 213, 255), fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        const SizedBox(height: 30),
        ...currentQuestion.getShuffledAnswers().map((answer){
          return AnswerButtons(answer, (){answerQuestion(answer);});
        })
      ],),
    );
  }
}