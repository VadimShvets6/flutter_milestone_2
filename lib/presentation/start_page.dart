import 'package:flutter/material.dart';
import 'package:milestone_2/presentation/quiz_page.dart';
import 'package:milestone_2/resources/strings.dart';
import 'package:milestone_2/utils/utils.dart';

import '../utils/base/BasePage.dart';

class MyHomePage extends BasePageScreen {
  const MyHomePage({super.key});

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends BasePageScreenState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return showExitConfirmationDialog(context);
        }, child : SafeArea(
          child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 358,
            height: 358,
          ),
          const SizedBox(height: 26),
          const Text(
            Strings.keyTitle,
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 56),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: ElevatedButton(
                style: MyElevatedStyle.blackButtonStyle(),
                onPressed: () {
                  Navigator.push(context, createRoute(const QuizPage()));
                },
                child: const Text(Strings.keyStart, style: TextStyle(color: Colors.white))),
          )
        ],
      )),
    )
    );
  }
}
