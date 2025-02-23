import "package:flutter/material.dart";

import "../../core/hiragana.dart";
import "kana_box.dart";

// TODO: Break row to make the grid nicer, for example after "よ"
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: (orientation == Orientation.landscape)
                ? SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 120.0,
                  )
                : SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
            itemBuilder: (context, index) {
              final kana = hiraganas.keys.elementAt(index);
              return KanaBox(
                kana: kana,
                romaji: hiraganas[kana]!,
              );
            },
            itemCount: hiraganas.length,
          );
        },
      ),
    );
  }
}
