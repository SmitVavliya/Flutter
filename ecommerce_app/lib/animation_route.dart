import 'package:flutter/material.dart';

class AnimationRoute extends PageTransitionsBuilder {
  const AnimationRoute();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _AnimationRoute(routeAnimation: animation, child: child);
  }
}

class _AnimationRoute extends StatelessWidget {
  final Animation<double> _scaleAnimation;

  _AnimationRoute({
    Key? key,
    required Animation<double> routeAnimation,
    required this.child,
  })  : _scaleAnimation = CurvedAnimation(
          parent: routeAnimation,
          curve: Curves.linear,
        ).drive(_scaleTween),
        super(key: key);

  static final Animatable<double> _scaleTween =
      Tween<double>(begin: 0.0, end: 1.0);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleTween.animate(
        CurvedAnimation(
          parent: _scaleAnimation,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: child,
    );
  }
}
