import "package:flutter/material.dart";

import "feature/chart/hiragana_chart_screen.dart";
import "feature/home/home_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kana",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomeScreen(
              onHiraganaTap: () {
                Navigator.of(context).pushNamed("/chart/hiragana");
              },
            ),
        "/chart/hiragana": (context) => HiraganaChartScreen(),
      },
    );
  }
}
