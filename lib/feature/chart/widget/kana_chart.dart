import "package:flutter/material.dart";

import "../../../core/model/hiragana.dart";
import "kana_box.dart";

class KanaChart extends StatelessWidget {
  const KanaChart({super.key, required this.kanaMaps, required this.padding});

  final List<KanaMap> kanaMaps;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = (constraints.maxWidth - padding.horizontal) / 5;
        return ListView.builder(
          padding: padding,
          itemBuilder: (context, index) {
            final rowEntries = kanaMaps[index].entries.toList();
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
                            kana: rowEntries[index].key,
                            romaji: rowEntries[index].value,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: rowEntries.length,
              ),
            );
          },
          itemCount: kanaMaps.length,
        );
      },
    );
  }
}
