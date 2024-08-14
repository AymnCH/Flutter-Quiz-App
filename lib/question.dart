import 'package:flutter/material.dart';
import 'package:flutter_application_2/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 40,
          ),
          ...currentQuestion.getShuffleAnswers().map(
            (e) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: AnswerButton(
                  answerText: e,
                  onPressed: () => answerQuestion(e),
                ),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
