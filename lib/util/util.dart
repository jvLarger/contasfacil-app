import 'package:contasfacil/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Util {
  static const double kDefaultPadding = 20;

  static const Color primaryColor = Color(0xFF02a498);

  static const MaterialColor primaryMc = MaterialColor(0xFF02a498, {
    50: Color.fromRGBO(2, 164, 152, .1),
    100: Color.fromRGBO(2, 164, 152, .2),
    200: Color.fromRGBO(2, 164, 152, .3),
    300: Color.fromRGBO(2, 164, 152, .4),
    400: Color.fromRGBO(2, 164, 152, .5),
    500: Color.fromRGBO(2, 164, 152, .6),
    600: Color.fromRGBO(2, 164, 152, .7),
    700: Color.fromRGBO(2, 164, 152, .8),
    800: Color.fromRGBO(2, 164, 152, .9),
    900: Color.fromRGBO(2, 164, 152, 1),
  });

  static showMessage(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Atenção',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          content: Text(msg, style: const TextStyle(fontSize: 12)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void goTo(BuildContext context, Widget homePage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage),
    );
  }
}
