import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'NCT 127 debut July 7, 2016', questionAnswer: true),
    Question(questionText: 'NCT 127 debut song is Cherry Bomb', questionAnswer: false),
    Question(questionText: 'The youngest member in NCT 127 is Haechan', questionAnswer: true),
    Question(questionText: 'Taeyong is NCT 127 leader', questionAnswer: true),
    Question(questionText: 'The 7th Sense is NCT 127 song', questionAnswer: false),
    Question(questionText: 'Johnny is the oldest member of NCT 127', questionAnswer: false),
    Question(questionText: 'Doyoung joined NCT 127 in 2017', questionAnswer: true),
    Question(questionText: 'Mark is the main rapper of NCT 127', questionAnswer: true),
    Question(questionText: 'Taeil is the main vocalist of NCT 127', questionAnswer: true),
    Question(questionText: 'Yuta is NCT 127 member born in America', questionAnswer: false),
    Question(questionText: 'Jungwoo firt studio album is NCT #127 Regular-Irregular  ', questionAnswer:  true),
    Question(questionText: 'Jaehyun is main focal and rapper in NCT 127', questionAnswer: true),
    Question(questionText: 'NCT 127 Home', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - create isFinished method that checks the last questions.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }
  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}