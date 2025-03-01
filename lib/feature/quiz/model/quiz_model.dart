import "dart:collection";

import "package:flutter/material.dart";

import "../../../core/model/hiragana.dart";

class QuizModel extends ChangeNotifier {
  QuizModel();

  final KanaMap _kanas = Hiragana.all.fold({}, (previousValue, element) {
    previousValue.addAll(element);
    return previousValue;
  });
  final Set<KanaMap> _kanaMaps = {};
  final Stopwatch _stopwatch = Stopwatch();
  List<String> _quizKanas = [];
  List<String> _correctKanas = [];
  List<String> _incorrectKanas = [];
  int _totalKana = 0;
  bool _isFinished = false;

  UnmodifiableMapView<String, String> get allKanas =>
      UnmodifiableMapView(_kanas);
  UnmodifiableSetView<KanaMap> get kanaMaps => UnmodifiableSetView(_kanaMaps);
  UnmodifiableListView<String> get correctKanas =>
      UnmodifiableListView(_correctKanas);
  UnmodifiableListView<String> get incorrectKanas =>
      UnmodifiableListView(_incorrectKanas);

  int get totalKana => _totalKana;
  int get remainingKana => _quizKanas.length;
  String? get quizKana => _quizKanas.firstOrNull;
  bool get isFinished => _isFinished;
  Duration get quizTime => _stopwatch.elapsed;

  void addColumnToDeck(KanaMap kana) {
    _kanaMaps.add(kana);
    _totalKana += kana.length;
    notifyListeners();
  }

  void removeColumnFromDeck(KanaMap kana) {
    _kanaMaps.remove(kana);
    _totalKana -= kana.length;
    notifyListeners();
  }

  void initQuiz() {
    _quizKanas = _kanaMaps
        .fold(
          <MapEntry<String, String>>[],
          (previousValue, element) => previousValue + element.entries.toList(),
        )
        .map((e) => e.key)
        .toList()
      ..shuffle();
    _correctKanas = [];
    _incorrectKanas = [];
    _isFinished = false;
    _stopwatch
      ..reset()
      ..start();
    notifyListeners();
  }

  void answer(String answer) {
    // Check if answer is correct.
    final quizKana = _quizKanas.removeAt(0);
    if (answer.toUpperCase() == _kanas[quizKana]) {
      _correctKanas.add(quizKana);
    } else {
      _incorrectKanas.add(quizKana);
    }

    // Check finished state.
    if (_quizKanas.isEmpty) {
      _isFinished = true;
      _stopwatch.stop();
    }
    notifyListeners();
  }
}
