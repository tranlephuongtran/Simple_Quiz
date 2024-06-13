import 'package:flutter/material.dart';
import 'package:quiz_app/StartSreen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}
class _QuizState extends State<Quiz>{
  var activeScreen = 'start-screen';
  List<String> choosedAnswers = [];
  void switchScreen(){
    setState(() {
      choosedAnswers = [];
      activeScreen = 'question-screen';
    });
  }
  void chooseAnswer(String answer){
    choosedAnswers.add(answer);
    if(choosedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(choosedAnswers, switchScreen);
    }
    return MaterialApp(
    home: Scaffold(body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 107, 15, 168),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Center(
        child: screenWidget
      ),
    )),
  );
  }
}