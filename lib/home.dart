import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 275,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Learn Flutter!",
            style: GoogleFonts.lato(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: const LinearBorder(bottom: LinearBorderEdge())),
              icon: const Icon(Icons.start_rounded),
              onPressed: switchScreen,
              label: Text('Start Quiz', style: GoogleFonts.lato()))
        ],
      ),
    );
  }
}
