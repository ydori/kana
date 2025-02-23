import "package:flutter/material.dart";

import "../../core/model/hiragana.dart";
import "widget/kana_chart.dart";

class HiraganaChartScreen extends StatelessWidget {
  const HiraganaChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hiragana",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontFamily: "Noto Sans JP",
            fontVariations: [FontVariation.weight(500)],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final padding = EdgeInsets.all(4.0);
          if (constraints.maxWidth > 1500) {
            return Row(
              children: [
                Expanded(
                  child: KanaChart(
                    title: "Basic",
                    kanaMaps: Hiragana.bases,
                    padding: padding,
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    title: "Dakuten",
                    kanaMaps: Hiragana.dakutens,
                    padding: padding,
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    title: "Handakuten",
                    kanaMaps: Hiragana.handakutens,
                    padding: padding,
                  ),
                ),
              ],
            );
          }
          if (constraints.maxWidth > 1000) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: KanaChart(
                    title: "Basic",
                    kanaMaps: Hiragana.bases,
                    padding: padding,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        KanaChart(
                          title: "Dakuten",
                          kanaMaps: Hiragana.dakutens,
                          padding: padding,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                        SizedBox(height: 16.0),
                        KanaChart(
                          title: "Handakuten",
                          kanaMaps: Hiragana.handakutens,
                          padding: padding,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                KanaChart(
                  title: "Basic",
                  kanaMaps: Hiragana.bases,
                  padding: padding,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                SizedBox(height: 16.0),
                KanaChart(
                  title: "Dakuten",
                  kanaMaps: Hiragana.dakutens,
                  padding: padding,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                SizedBox(height: 16.0),
                KanaChart(
                  title: "Handakuten",
                  kanaMaps: Hiragana.handakutens,
                  padding: padding,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
