import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milestone_2/domain/models/quiz.dart';
import 'package:milestone_2/domain/usecase/get_quiz.dart';
import 'package:milestone_2/presentation/result_page.dart';
import 'package:milestone_2/resources/strings.dart';
import 'package:milestone_2/utils/utils.dart';
import 'package:sprintf/sprintf.dart';

import '../utils/base/BasePage.dart';

class QuizPage extends BasePageScreen {
  const QuizPage({super.key});

  @override
  createState() => _QuizPageState();
}

class _QuizPageState extends BasePageScreenState<QuizPage> {
  late Quiz _quiz;
  int _selectedIndex = 0;
  double _progress = 1.0;
  int _currentTime = 0;
  String? _currentOptions;
  int _score = 0;
  int _correctAnswers = 0;
  bool _isButtonEnabled = false;


  @override
  void initState() {
    super.initState();
    _quiz = _getQuiz();
    _currentTime = _quiz.timeLimit;
    _startTimer();
  }

  Quiz _getQuiz() {
    return GetQuizUseCase().getQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 16, bottom: 6), child: _timerWidget()),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: _linearProgress()),
          const SizedBox(height: 80),
          _questionTitle(_selectedIndex + 1, _quiz.totalQuestions),
          const SizedBox(height: 8),
          _question(_quiz.questions[_selectedIndex].questionText),
          for (var item in _quiz.questions[_selectedIndex].options) _questionsAnswers(item),
          const SizedBox(height: 32),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buttonNext(_quiz.questions[_selectedIndex])
          )
        ],
      ),
    ));
  }

  _timerWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.timelapse,
          size: 16,
          color: MyColors.gray_7B7B7B,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            formatSecondsToMinutes(_currentTime),
            style: MyTextStyle.titleStyle(MyColors.gray_7B7B7B),
          ),
        ),
      ],
    );
  }

  _linearProgress() {
    return LinearProgressIndicator(
      value: _progress,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      backgroundColor: MyColors.grayD8d8d8,
      valueColor: const AlwaysStoppedAnimation(Colors.green),
      minHeight: 8,
    );
  }

  _questionTitle(int index, int maxIndex) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.centerLeft,
        child: Text(
          sprintf(Strings.titleQuestionCunt, [index, maxIndex]),
          style: MyTextStyle.titleStyle(MyColors.gray_7B7B7B),
        ));
  }

  _question(String question) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
        alignment: Alignment.centerLeft,
        child: Text(
          question,
          style: MyTextStyle.titleStyle(MyColors.black252C32),
        ));
  }

  _questionsAnswers(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _currentOptions == item ? Colors.blue : MyColors.grayF4F4F4,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(item,
                  style: MyTextStyle.titleStyle(
                      _currentOptions == item ? Colors.black : MyColors.gray_7B7B7B, FontWeight.w400)),
            ),
            Radio(
              value: item,
              fillColor: MaterialStateColor.resolveWith(
                  (states) => _currentOptions == item ? Colors.blue : MyColors.grayF4F4F4),
              onChanged: (value) {
                setState(() {
                  _isButtonEnabled = value.toString().isNotEmpty;
                  _currentOptions = value.toString();
                });
              },
              groupValue: _currentOptions,
            ),
          ],
        ),
      ),
    );
  }

  _buttonNext(Question question) {
    return ElevatedButton(
        onPressed: _isButtonEnabled ? () {
          setState(() {
            if (_selectedIndex + 1 == _quiz.totalQuestions) {
              Navigator.pushReplacement(
                  context,
                  createRoute(ResultQuizPage(
                      quizResult: QuizResult(
                          rating: 1,
                          maxScore: _quiz.totalQuestions * 2,
                          score: _score,
                          timeCompleted: _quiz.timeLimit - _currentTime,
                          correctAnswers: _correctAnswers,
                          totalAnswers: _quiz.totalQuestions))));
            } else {
              if (_currentOptions == question.options[question.correctOptionIndex]) {
                _score += 2;
                _correctAnswers++;
              }
              _isButtonEnabled = false;
              _selectedIndex = _selectedIndex + 1;
            }
          });
        } : null,
        style: _isButtonEnabled ? MyElevatedStyle.blackButtonStyle() : MyElevatedStyle.blackButtonNoActiveStyle(),
        child: const Text(Strings.keyNext, style: TextStyle(color: Colors.white)));
  }

  _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime == 0) {
        Navigator.pushReplacement(
            context,
            createRoute(ResultQuizPage(
                quizResult: QuizResult(
                    rating: 1,
                    maxScore: _quiz.totalQuestions * 2,
                    score: _score,
                    timeCompleted: _quiz.timeLimit - _currentTime,
                    correctAnswers: _correctAnswers,
                    totalAnswers: _quiz.totalQuestions))));
        timer.cancel();
      } else {
        setState(() {
          _currentTime -= 1;
          _progress = _currentTime / _quiz.timeLimit;
        });
      }
    });
  }

  String formatSecondsToMinutes(int seconds) {
    return sprintf("%s:%s", [(seconds / 60).floor(), seconds % 60]);
  }
}
