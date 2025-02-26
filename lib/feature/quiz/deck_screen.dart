import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../core/model/hiragana.dart";
import "model/quiz_model.dart";

class DeckScreen extends StatelessWidget {
  const DeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Deck",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Consumer<QuizModel>(
        builder: (context, model, child) {
          final kanaMaps = Hiragana.all;
          return ListView.separated(
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final kanaMap = kanaMaps[index];
              final isInDeck = model.kanaMaps.contains(kanaMap);
              return FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: (isInDeck)
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.surface,
                ),
                onPressed: () {
                  (isInDeck)
                      ? model.removeColumnFromDeck(kanaMap)
                      : model.addColumnToDeck(kanaMap);
                },
                child: Row(
                  children: [
                    Text(
                      "${kanaMap.entries.first.key} / ${kanaMap.entries.first.value}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Spacer(),
                    Text(
                      "${kanaMap.length} characters",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.0);
            },
            itemCount: kanaMaps.length,
          );
        },
      ),
    );
  }
}
