import "package:flutter/material.dart";

import "widget/chart_card.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onHiraganaChartOpen,
    required this.onKatakanaChartOpen,
  });

  final VoidCallback onHiraganaChartOpen;
  final VoidCallback onKatakanaChartOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kana"),
      ),
      body: Container(
        constraints: BoxConstraints(maxWidth: 300.0),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ChartCard(
                  label: "あ ",
                  onTap: onHiraganaChartOpen,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ChartCard(
                  label: "ア ",
                  onTap: onKatakanaChartOpen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
