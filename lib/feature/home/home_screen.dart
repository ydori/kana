import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onHiraganaTap});

  final VoidCallback onHiraganaTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kana"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onHiraganaTap,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "ひらがな",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: "Noto Sans JP",
                      fontVariations: [FontVariation.weight(500)],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
