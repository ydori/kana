import "package:flutter/material.dart";

import "../../../core/model/hiragana.dart";
import "kana_box.dart";

class KanaChart extends StatelessWidget {
  const KanaChart({
    super.key,
    required this.title,
    required this.kanaMaps,
    required this.padding,
    this.scrollPhysics,
    this.shrinkWrap = false,
  });

  final String title;
  final List<KanaMap> kanaMaps;
  final EdgeInsets padding;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = (constraints.maxWidth - padding.horizontal) / 5;
        return ListView.builder(
          padding: padding,
          physics: scrollPhysics,
          shrinkWrap: shrinkWrap,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            final rowEntries = kanaMaps[index - 1].entries.toList();
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
          itemCount: kanaMaps.length + 1,
        );
      },
    );
  }
}
