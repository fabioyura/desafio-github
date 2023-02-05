import 'package:app/helpers/ts.dart';
import 'package:flutter/material.dart';

Route animatedRoute(context, page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 800),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.decelerate;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

openScreen(BuildContext context, screen, {origin}) {
  Navigator.of(context).push(animatedRoute(context, screen));
}

closeScreen(context, code, {var returnValue}) {
  Navigator.of(context).pop(returnValue);
}

initializeTs() {
  ts = Ts();
}
