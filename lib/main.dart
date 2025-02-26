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
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => QuizModel(),
      child: MaterialApp(
        title: "Kana",
        theme: ThemeData(
          textTheme: theme.textTheme
              .copyWith(
                displayLarge: theme.textTheme.displayLarge?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                displayMedium: theme.textTheme.displayMedium?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                displaySmall: theme.textTheme.displaySmall?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                headlineLarge: theme.textTheme.headlineLarge?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                headlineMedium: theme.textTheme.headlineMedium?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                headlineSmall: theme.textTheme.headlineSmall?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                titleLarge: theme.textTheme.titleLarge?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                titleMedium: theme.textTheme.titleMedium?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                titleSmall: theme.textTheme.titleSmall?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                bodyLarge: theme.textTheme.bodyLarge?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                bodyMedium: theme.textTheme.bodyMedium?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                bodySmall: theme.textTheme.bodySmall?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                labelLarge: theme.textTheme.labelLarge?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                labelMedium: theme.textTheme.labelMedium?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
                labelSmall: theme.textTheme.labelSmall?.copyWith(
                  fontVariations: [FontVariation.weight(500)],
                ),
              )
              .apply(
                fontFamily: "Noto Sans JP",
                bodyColor: Colors.black,
                displayColor: Colors.black,
                decorationColor: Colors.black,
              ),
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
          "/quiz": (context) => QuizScreen(
                onDeckOpen: () {
                  Navigator.of(context).pushNamed("/deck");
                },
              ),
        },
      ),
    );
  }
}
