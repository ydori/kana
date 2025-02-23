import "package:flutter/material.dart";

import "widget/chart_card.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onHiraganaChartOpen,
    required this.onKatakanaChartOpen,
    required this.onPracticeOpen,
  });

  final VoidCallback onHiraganaChartOpen;
  final VoidCallback onKatakanaChartOpen;
  final VoidCallback onPracticeOpen;

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
            SizedBox(height: 20.0),
            FilledButton(
              onPressed: onPracticeOpen,
              child: Text("Practice"),
            ),
          ],
        ),
      ),
    );
  }
}
