import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// membuat object
QuizBrain quizBrain = QuizBrain();

// fungsi main
void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'NCT 127 QUIZZES',
            style: TextStyle(
              color: Colors.black,
                fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.lightGreenAccent,
          centerTitle: true,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // menghitung jawaban benar dan salah
  int numCorrect = 1;
  int numIncorrect = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    // setState
    setState(() {
      // mengecek quiz telah selesai atau belum
      if (quizBrain.isFinished()) {
        // jika quiz sudah selesai
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the Quiz\n'
              'Correct Answers: $numCorrect\n'
              'Incorrect Answers: $numIncorrect\n'
              'Total Questions: ${quizBrain.getTotalQuestions()}',
        ).show();

        quizBrain.reset();
        scoreKeeper = [];

      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check_circle,
            color: Colors.lightGreenAccent,
          ));
          numCorrect++;
        } else {
          scoreKeeper.add(const Icon(
            Icons.close_sharp,
            color: Colors.red,
          ));
          numIncorrect++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  )
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.lightGreenAccent),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "TRUE",
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 20.0),
                ),
              ),
              child: const Text(
                "FALSE",
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}