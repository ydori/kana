import "package:flutter/material.dart";

class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: "Noto Sans JP",
                fontVariations: [FontVariation.weight(500)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
