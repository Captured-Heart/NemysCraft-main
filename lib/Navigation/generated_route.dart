// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:nemy_krafts/Screens/contact.dart';


class AppRouter {
  // final StopwatchCubit _stopwatchCubit = StopwatchCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => Contact());
        break;

      // case '/second':
      //   return MaterialPageRoute(
      //       builder: (_) => SecondScreen(title: 'Second Screen'));
      //   break;

      // case '/third':
      //   return MaterialPageRoute(
      //       builder: (_) => ThirdScreen(title: 'Third Screen'));
      //   break;

      default:
        return null;
    }
    // return null;
  }

  // void dispose() {
  //   _stopwatchCubit.close();
  // }
}
