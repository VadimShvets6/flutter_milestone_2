import 'package:flutter/material.dart';

import '../../resources/strings.dart';

/*
abstract class _BaseStatefulState<T extends StatefulWidget> extends State<T> {

  _BaseStatefulState(){
    //Parent constructor
  }

  PageRoute createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      const Placeholder(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}*/

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({Key? key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen> extends State<Page> {
  PageRoute createRoute(StatefulWidget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  PageRoute createPopRoute(StatefulWidget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Future<bool> showExitConfirmationDialog(BuildContext context,
      {String title = Strings.keyExit,
      String description = Strings.exitDescription,
      String textButtonNegative = Strings.buttonCancel,
      String textButtonPositive = Strings.buttonGoOut,
      Route? route}) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(textButtonNegative),
            ),
            TextButton(
              onPressed: () {
                if (route == null) {
                  Navigator.of(context).pop(true);
                } else {
                  Navigator.pushReplacement(context, route);
                }
              },
              child: Text(textButtonPositive),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
