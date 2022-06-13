import 'package:flutter/material.dart';
import 'package:flutter_app/screens/quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({Key? key}) : super(key: key);

  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  QuizBrain quizBrain = QuizBrain();

  var scoreKeeper = <Icon>[];
  // or
  // List<Icon> scoreKeeper = [

  // int questionNumber = 0;

  void _checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {

        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }

      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: Colors.green,
                child: TextButton(
                  child: const Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    _checkAnswer(true);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: Colors.red,
                child: TextButton(
                  child: const Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    _checkAnswer(true);
                  },
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
