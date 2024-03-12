import 'package:flutter/material.dart';
import 'package:toonflix/screen/home_widget.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xff232b55),
            ),
          ),
          cardColor: const Color(0xfff4eddb),
          colorScheme: const ColorScheme(
            background: Color(0xffe7626c),
            onBackground: Color(0xffe7626c),
            brightness: Brightness.light,
            primary: Color(0xffe7626c),
            onPrimary: Color(0xffe7626c),
            secondary: Color(0xfff4eddb),
            onSecondary: Color(0xfff4eddb),
            error: Color(0xff232b55),
            onError: Color(0xff232b55),
            surface: Colors.white,
            onSurface: Colors.white,
          ),
        ),
        home: const HomeScreen());
  }
}
