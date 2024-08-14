// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onPressed,
    super.key,
  });

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 250, 148, 182),
            padding: const EdgeInsets.all(25)),
        onPressed: onPressed,
        child: Text(
          style: GoogleFonts.lato(fontSize: 15),
          answerText,
          textAlign: TextAlign.center,
        ));
  }
}
