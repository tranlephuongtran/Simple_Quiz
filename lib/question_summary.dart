import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return data['user_answer'] == data['correct_answer']
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: const Color.fromARGB(255, 114, 187, 246),
                            child: Center(
                              child: Text(
                                ((data['question_index'] as int) + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Text(
                                  'Câu trả lời của bạn: ${data['user_answer']}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 214, 146, 225)),
                                ),
                                Text(
                                  'Câu trả lời đúng: ${data['correct_answer']}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 128, 191, 243)),
                                ),
                            const SizedBox(height: 5),
                          ]),
                        ),
                      ],
                    ),
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: const Color.fromARGB(255, 255, 104, 230),
                            child: Center(
                              child: Text(
                                ((data['question_index'] as int) + 1).toString(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['question'] as String,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              Text('Câu trả lời của bạn: ${data['user_answer']}', 
                              style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 214, 146, 225)),
                              ),
                              Text(
                                  'Câu trả lời đúng: ${data['correct_answer']}',
                              style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 128, 191, 243)
                              ),
                              ),
                              const SizedBox(height: 5),
                      ]),
                        ),
                      ],
                    ),
                );
          }).toList(),
        ),
      ),
    );
  }
}
