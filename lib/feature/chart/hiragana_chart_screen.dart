import "package:flutter/material.dart";

import "../../core/hiragana.dart";
import "kana_chart.dart";

class HiraganaChartScreen extends StatelessWidget {
  const HiraganaChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ひらがな",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontFamily: "Noto Sans JP",
            fontVariations: [FontVariation.weight(500)],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1500) {
            return Row(
              children: [
                Expanded(
                  child: KanaChart(
                    kanaMaps: Hiragana.bases,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    kanaMaps: Hiragana.dakutens,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    kanaMaps: Hiragana.handakutens,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
              ],
            );
          }
          if (constraints.maxWidth > 1000) {
            return Row(
              children: [
                Expanded(
                  child: KanaChart(
                    kanaMaps: Hiragana.bases,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    kanaMaps: Hiragana.dakutens + Hiragana.handakutens,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
              ],
            );
          }
          return KanaChart(
            kanaMaps: Hiragana.all,
            padding: EdgeInsets.symmetric(horizontal: 4.0),
          );
        },
      ),
    );
  }
}
