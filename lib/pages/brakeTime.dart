import 'package:flutter/material.dart';
import 'package:mindful_meal_timer/pages/home.dart';
import 'package:mindful_meal_timer/widgets/switch.dart';

import '../widgets/timer.dart';
import 'finishYourMeal.dart';

class BreakTimeScreen extends StatefulWidget {
  static const routeName = '/breakTime';
  const BreakTimeScreen({super.key});

  @override
  State<BreakTimeScreen> createState() => _BreakTimeScreenState();
}

class _BreakTimeScreenState extends State<BreakTimeScreen> {
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Mindful Meal Timer"),
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Text(
                "Break Time",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              const Text(
                "Take a five-minute break to check in on your level of fullness",
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              CustomTimer(
                duration: 30,
                isPause: false,
                routeName: FinishYourMealScreen.routeName,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
              MusicSwitch(
                isplay: isPlay,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 350.0,
                    height: 55.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ),
                  SizedBox(
                    width: 350.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent),
                      child: const Text(
                        "PAUSE",
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
              SizedBox(
                width: 350.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(HomeScreen.routeName)},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey, width: 0.5),
                  ),
                  child: const Text(
                    "LET'S STOP I'M FULL NOW",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
