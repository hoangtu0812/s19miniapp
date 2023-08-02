import 'package:flutter/material.dart';

import 'app_screen.dart';

class Navigators {
  static void navigateToAppScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AppScreen()));
  }
}
