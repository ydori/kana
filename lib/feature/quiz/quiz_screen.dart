import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";

import "../../core/widget/kana_box.dart";
import "model/quiz_model.dart";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onDeckOpen});

  final VoidCallback onDeckOpen;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _controller = TextEditingController();
  late final FocusNode _focusNode;
  late final QuizModel _model;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Initialize current quiz session.
    _model = context.read<QuizModel>()..addListener(onModelChanges);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _model.initQuiz();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _model.removeListener(onModelChanges);
    super.dispose();
  }

  void onModelChanges() {
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
          actions: [
            Consumer<QuizModel>(
              builder: (context, model, child) {
                return Text(
                  (model.isFinished)
                      ? "Time: ${_formatQuizTime(model.quizTime)}"
                      : "${model.remainingKana} remaining",
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
            SizedBox(width: 24.0),
          ],
        ),
        body: Consumer<QuizModel>(
          builder: (context, model, child) {
            // Show quiz result.
            if (model.isFinished) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 64.0),
                    Text(
                      "${model.correctKanas.length}/${model.totalKana}",
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    if (model.incorrectKanas.isEmpty)
                      Text(
                        "Good job!",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    SizedBox(height: 32.0),
                    if (model.incorrectKanas.isNotEmpty) ...[
                      Text(
                        "You're getting there! Try reviewing these characters a bit more.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.0),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                        ),
                        itemBuilder: (context, index) {
                          final kana = model.incorrectKanas[index];
                          return KanaBox(
                            kana: kana,
                            romaji: model.allKanas[kana] ?? "",
                          );
                        },
                        itemCount: model.incorrectKanas.length,
                      ),
                      SizedBox(height: 64.0),
                    ],
                    FilledButton.tonal(
                      onPressed: () {
                        widget.onDeckOpen();
                      },
                      child: Text("Update Deck"),
                    ),
                    SizedBox(height: 8.0),
                    FilledButton(
                      onPressed: () {
                        model.initQuiz();
                      },
                      child: Text("Restart Quiz"),
                    ),
                    SizedBox(height: 32.0),
                  ],
                ),
              );
            }

            final kana = model.quizKana;
            if (kana == null) {
              return SizedBox();
            }

            // Show current kana card.
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 64.0),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: 200.0,
                      width: 150.0,
                      alignment: Alignment.center,
                      child: Text(
                        kana,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                      hintText: "What is this character?",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                              ),
                    ),
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) => newValue..text.toUpperCase(),
                      ),
                    ],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onSubmitted: (value) {
                      model.answer(value);
                    },
                  ),
                  SizedBox(height: 32.0),
                  Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

String _formatQuizTime(Duration duration) {
  // ignore: prefer_interpolation_to_compose_strings
  return duration.inMinutes.toString().padLeft(2, "0") +
      ":" +
      (duration.inSeconds % 60).toString().padLeft(2, "0");
}
