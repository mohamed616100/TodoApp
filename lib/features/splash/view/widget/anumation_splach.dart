import 'package:flutter/animation.dart';
class AnumationSplach{
  late AnimationController animationController;
  late Animation<Offset> animation;

  AnumationSplach({
    required TickerProvider vsync,
    required Duration duration,
  })
  {
      animationController = AnimationController(
        vsync: vsync,
        duration: duration,
      );

      animation = Tween<Offset>(
        begin: const Offset(0, 8),
        end: Offset.zero,
      ).animate(animationController);
  }

  void start() {
    animationController.forward();
  }

  void dispose() {
    animationController.dispose();
  }

}