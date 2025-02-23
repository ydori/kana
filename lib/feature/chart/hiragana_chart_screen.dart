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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth / 5;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) {
              final kanas = hiraganas[index].entries.toList();
              return SizedBox(
                height: size,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox.square(
                      dimension: size,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: KanaBox(
                              kana: kanas[index].key,
                              romaji: kanas[index].value,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: kanas.length,
                ),
              );
            },
            itemCount: hiraganas.length,
          );
        },
      ),
    );
  }
}
