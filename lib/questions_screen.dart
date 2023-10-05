import 'package:flutter/material.dart';
import 'package:flutter_application_2/answer_button.dart';
import 'package:flutter_application_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currenQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currenQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currenQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 228, 167, 231), fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
