import "package:flutter/material.dart";

class KanaBox extends StatelessWidget {
  const KanaBox({super.key, required this.kana, required this.romaji});

  final String kana;
  final String romaji;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kana,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontFamily: "Noto Sans JP",
              fontVariations: [FontVariation.weight(500)],
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            romaji,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
