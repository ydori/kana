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
                    title: "Basic",
                    kanaMaps: Hiragana.bases,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    title: "Dakuten",
                    kanaMaps: Hiragana.dakutens,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
                Expanded(
                  child: KanaChart(
                    title: "Handakuten",
                    kanaMaps: Hiragana.handakutens,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
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
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        KanaChart(
                          title: "Dakuten",
                          kanaMaps: Hiragana.dakutens,
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                        SizedBox(height: 16.0),
                        KanaChart(
                          title: "Handakuten",
                          kanaMaps: Hiragana.handakutens,
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                SizedBox(height: 16.0),
                KanaChart(
                  title: "Dakuten",
                  kanaMaps: Hiragana.dakutens,
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                SizedBox(height: 16.0),
                KanaChart(
                  title: "Handakuten",
                  kanaMaps: Hiragana.handakutens,
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
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
