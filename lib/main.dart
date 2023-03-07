import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindful_meal_timer/pages/brakeTime.dart';
import 'package:mindful_meal_timer/pages/finishYourMeal.dart';
import 'package:mindful_meal_timer/pages/home.dart';
import 'package:mindful_meal_timer/pages/nom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mindful Meal Timer",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: ((context) {
          return const HomeScreen();
        }),
        NomScreen.routeName: ((context) {
          return const NomScreen();
        }),
        BreakTimeScreen.routeName: ((context) {
          return const BreakTimeScreen();
        }),
        FinishYourMealScreen.routeName: ((context) {
          return const FinishYourMealScreen();
        })
      },
    );
  }
}
