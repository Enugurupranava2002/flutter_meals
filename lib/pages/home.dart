import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindful_meal_timer/pages/nom.dart';
import 'package:mindful_meal_timer/widgets/switch.dart';

import '../widgets/timer.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Mindful Meal Timer"),
        leading: IconButton(
          onPressed: () => {SystemNavigator.pop()},
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Center(
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
                          shape: BoxShape.circle, color: Colors.grey),
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
              "Time to ear mindfully",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
            const Text(
              "It's simple: eat slowly for ten minutes, rest for five, then finish your mean",
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            CustomTimer(
              duration: 30,
              isPause: true,
              routeName: "",
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            const MusicSwitch(
              isplay: false,
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () =>
                    {Navigator.of(context).pushNamed(NomScreen.routeName)},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent),
                child: const Text(
                  "Start",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
