import 'dart:math';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CustomTimer extends StatefulWidget {
  final int duration;
  final bool isPause;
  final String routeName;

  CustomTimer(
      {super.key,
      required this.duration,
      required this.isPause,
      required this.routeName});

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<CustomTimer> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _animationController;
  int animationTracker = 0;

  late Animation<double> timerCount;
  late AnimationController _timerCountController;
  int timeCountTracker = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: Duration(seconds: (widget.duration).round()), vsync: this);
    animation = Tween<double>(begin: 60, end: 0).animate(_animationController)
      ..addListener(
        () {
          setState(
            () {
              animationTracker = animation.value.toInt();
            },
          );
        },
      );

    _timerCountController = AnimationController(
        duration: Duration(seconds: widget.duration), vsync: this);
    timerCount = Tween<double>(begin: 30, end: 0).animate(_timerCountController)
      ..addListener(
        () {
          setState(
            () {
              timeCountTracker = timerCount.value.toInt();
              if (timeCountTracker == 0) {
                if (widget.routeName != "") {
                  Future(() {
                    Navigator.of(context).pushNamed(widget.routeName);
                  });
                }
              }
            },
          );
        },
      );
    _animationController.forward();
    _timerCountController.forward();

    print("init State");
    print(widget.isPause);

    if (widget.isPause) {
      _animationController.stop();
      _timerCountController.stop();

      timeCountTracker = timerCount.value.toInt();
      animationTracker = animation.value.toInt();
      setState(() {});
      return;
    }
    // else {
    //   _timerCountController.forward(from: timeCountTracker.toDouble());
    //   _animationController.forward(from: animationTracker.toDouble());
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            width: 340,
            height: 340,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 40.0),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            width: 280,
            height: 280,
            child: Stack(
              children: [
                Center(
                  child: CircularStepProgressIndicator(
                    totalSteps: 60,
                    currentStep: animationTracker,
                    padding: 1.7 * (pi / 60),
                    arcSize: ((2 * pi)),
                    selectedColor: Colors.greenAccent,
                    unselectedColor: Colors.grey,
                    stepSize: 10,
                    width: 220,
                    height: 220,
                    startingAngle: 0,
                    child: Center(
                      child: Column(
                        children: [
                          const Spacer(),
                          Text(
                            "00:${timeCountTracker.toString().padLeft(2, "0")}",
                            style: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "minutes remaining",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.0),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CircularStepProgressIndicator(
                    totalSteps: animationTracker == 0 ? 1 : animationTracker,
                    currentStep: animationTracker,
                    padding: 0,
                    arcSize: ((2 * pi) / 60) * animationTracker,
                    selectedColor: Colors.greenAccent,
                    unselectedColor: Colors.white,
                    stepSize: 10,
                    width: 240,
                    height: 240,
                    startingAngle: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
