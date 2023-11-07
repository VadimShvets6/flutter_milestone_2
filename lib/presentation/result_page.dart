import 'package:flutter/material.dart';
import 'package:milestone_2/domain/models/quiz.dart';
import 'package:milestone_2/presentation/quiz_page.dart';
import 'package:milestone_2/presentation/start_page.dart';
import 'package:milestone_2/utils/utils.dart';
import 'package:sprintf/sprintf.dart';

import '../resources/strings.dart';
import '../utils/base/BasePage.dart';

class ResultQuizPage extends BasePageScreen {
  final QuizResult quizResult;

  const ResultQuizPage({super.key, required this.quizResult});

  @override
  createState() => _ResultQuizPageState();
}

class _ResultQuizPageState extends BasePageScreenState<ResultQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: MyColors.grayF4F4F4,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                _newRatingTitleUI(),
                _setRating(widget.quizResult.rating),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _scoreBlock(widget.quizResult.score, widget.quizResult.maxScore),
                    _correctBlock(widget.quizResult.correctAnswers, widget.quizResult.totalAnswers),
                    _completedTimeBlock(widget.quizResult.timeCompleted)
                  ],
                ),
                const SizedBox(height: 24),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: _buttonLeave()),
                const SizedBox(height: 16),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: _buttonNext()),
                const SizedBox(height: 24)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _newRatingTitleUI() {
    return Text(Strings.keyNewRating, style: MyTextStyle.titleStyle());
  }

  _setRating(int rating) {
    return Text(rating.toString(), style: MyTextStyle.semiBoldStyle(32));
  }

  _scoreBlock(int score, int maxScore) {
    return Column(
      children: [
        Text(
          Strings.keyScore,
          style: MyTextStyle.titleStyle(MyColors.gray929292),
        ),
        Text(
          _resultStringFormat(score, maxScore),
          style: MyTextStyle.semiBoldStyle(),
        ),
      ],
    );
  }

  _correctBlock(int correctAnswers, int maxAnswers) {
    return Column(
      children: [
        Text(Strings.keyCorrect, style: MyTextStyle.titleStyle(MyColors.gray929292)),
        Text(_resultStringFormat(correctAnswers, maxAnswers), style: MyTextStyle.semiBoldStyle()),
      ],
    );
  }

  _completedTimeBlock(int completedTime) {
    return Column(
      children: [
        Text(Strings.keyCompletedIn, style: MyTextStyle.titleStyle(MyColors.gray929292)),
        Text(_formatSeconds(completedTime)),
      ],
    );
  }

  _buttonNext() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context, createPopRoute(const QuizPage()));
      },
      style: MyElevatedStyle.blackButtonStyle(),
      child: const Text(
        Strings.keyNewGame,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _buttonLeave() {
    return ElevatedButton(
      onPressed: () {
        showExitConfirmationDialog(context, route: createPopRoute(const MyHomePage()));
      },
      style: MyElevatedStyle.blackButtonNoActiveStyle(),
      child: const Text(
        Strings.keyLeave,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _resultStringFormat(int result, int maxResult) {
    return sprintf("%s/%s", [result, maxResult]);
  }

  String _formatSeconds(int seconds) {
    int minutes = (seconds ~/ 60);
    int remainingSeconds = (seconds % 60);
    return sprintf("%sm %ss", [minutes, remainingSeconds]);
  }
}
