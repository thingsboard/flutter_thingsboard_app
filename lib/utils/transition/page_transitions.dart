import 'package:flutter/material.dart';

class FadeOpenPageTransitionsBuilder extends PageTransitionsBuilder {
  /// Constructs a page transition animation that slides the page up.
  const FadeOpenPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double>? secondaryAnimation,
    Widget child,
  ) {
    return FadeOpenPageTransition(routeAnimation: animation, child: child);
  }
}

class FadeOpenPageTransition extends StatelessWidget {
  FadeOpenPageTransition({
    Key? key,
    required Animation<double>
        routeAnimation, // The route's linear 0.0 - 1.0 animation.
    required this.child,
  })  : _positionAnimation =
            routeAnimation.drive(_leftRightTween.chain(_fastOutSlowInTween)),
        _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _leftRightTween = Tween<Offset>(
    begin: const Offset(0.5, 0.0),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: child,
      ),
    );
  }
}
