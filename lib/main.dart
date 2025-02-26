import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "feature/chart/hiragana_chart_screen.dart";
import "feature/home/home_screen.dart";
import "feature/quiz/deck_screen.dart";
import "feature/quiz/model/quiz_model.dart";
import "feature/quiz/quiz_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizModel(),
      child: MaterialApp(
        title: "Kana",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          scaffoldBackgroundColor: Colors.grey[200],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[200],
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomeScreen(
                onHiraganaChartOpen: () {
                  Navigator.of(context).pushNamed("/chart/hiragana");
                },
                onKatakanaChartOpen: () {
                  // TODO: Navigate to Katakana Chart
                },
                onDeckOpen: () {
                  Navigator.of(context).pushNamed("/deck");
                },
                onQuizOpen: () {
                  Navigator.of(context).pushNamed("/quiz");
                },
              ),
          "/chart/hiragana": (context) => HiraganaChartScreen(),
          "/deck": (context) => DeckScreen(),
          "/quiz": (context) => QuizScreen(),
        },
      ),
    );
  }
}
