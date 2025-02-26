import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../quiz/model/quiz_model.dart";
import "widget/chart_card.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onHiraganaChartOpen,
    required this.onKatakanaChartOpen,
    required this.onDeckOpen,
    required this.onQuizOpen,
  });

  final VoidCallback onHiraganaChartOpen;
  final VoidCallback onKatakanaChartOpen;
  final VoidCallback onDeckOpen;
  final VoidCallback onQuizOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kana"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ChartCard(
                    title: "あ ",
                    subtitle: "Hiragana",
                    onTap: onHiraganaChartOpen,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ChartCard(
                    title: "ア ",
                    subtitle: "Katakana",
                    onTap: onKatakanaChartOpen,
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.0),
            Text("Let's review our study!"),
            SizedBox(height: 16.0),
            Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onDeckOpen,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        "Deck",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      Consumer<QuizModel>(
                        builder: (context, model, child) {
                          return Text(
                            "${model.totalKana} characters",
                            style: Theme.of(context).textTheme.labelSmall,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Consumer<QuizModel>(
              builder: (context, model, child) {
                return FilledButton(
                  onPressed: (model.kanaMaps.isEmpty) ? null : onQuizOpen,
                  child: Text("Start Quiz"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
