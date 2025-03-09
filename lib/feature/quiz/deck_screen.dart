import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../core/model/hiragana.dart";
import "../../core/model/kana_map.dart";
import "../../core/model/katakana.dart";
import "model/quiz_model.dart";

class DeckScreen extends StatefulWidget {
  const DeckScreen({super.key});

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

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
          return Column(
            children: [
              TabBar(
                controller: _tabController,
                onTap: (value) {
                  _pageController.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                tabs: [
                  Tab(text: "Hiragana"),
                  Tab(text: "Katakana"),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    _tabController.animateTo(value);
                  },
                  children: [
                    DeckItemList(
                      model: model,
                      kanaMaps: Hiragana.all,
                    ),
                    DeckItemList(
                      model: model,
                      kanaMaps: Katakana.all,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DeckItemList extends StatelessWidget {
  const DeckItemList({super.key, required this.model, required this.kanaMaps});

  final QuizModel model;
  final List<KanaMap> kanaMaps;

  @override
  Widget build(BuildContext context) {
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
  }
}
