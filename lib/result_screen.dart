import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswer, this.resetQuiz, {super.key});
  final List<String> chosenAnswer;
  final void Function() resetQuiz;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = getSummaryData();
    final numOfQuestions = questions.length;
    final numOfCorrectAnswers = summary.where((data){
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Bạn đã trả lời đúng $numOfCorrectAnswers trên tổng $numOfQuestions câu hỏi!', style: const TextStyle(fontSize: 25, color: Color.fromARGB(255, 237, 182, 247)), textAlign: TextAlign.center,),
          const SizedBox(height: 30),
          QuestionSummary(summary),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const Icon(Icons.restart_alt_rounded, color: Colors.white),
            TextButton(
            onPressed: resetQuiz,
            child: const Text('Chơi lại', style: TextStyle(fontSize: 23, color: Colors.white,),),
              )
          ],)
        ],
      ),
    );
  }
}
