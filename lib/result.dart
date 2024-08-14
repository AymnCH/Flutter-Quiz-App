import 'package:flutter/material.dart';

import 'package:flutter_application_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCorrectAnswer = 0;
    final summaryData = getSummaryData();

    for (var i = 0; i < summaryData.length; i++) {
      if (summaryData[i]['user_answer'] == summaryData[i]['correct_answer']) {
        numOfCorrectAnswer++;
      }
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        height: 2000,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You answered $numOfCorrectAnswer out of ${questions.length} questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              ...getSummaryData().map((e) => Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                e['user_answer'] == e['correct_answer']
                                    ? Colors.green.shade700
                                    : Colors.red.shade900,
                            child: Text(
                              ((e['question_index'] as int) + 1).toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['question'].toString(),
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(e['user_answer'].toString()),
                                Text(e['correct_answer'].toString(),
                                    style: GoogleFonts.lato(
                                        color: Colors.green.shade900,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 11,
                      )
                    ],
                  )),
              TextButton.icon(
                  icon: const Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                  onPressed: restart,
                  label: const Text(
                    'Restart Quiz',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
