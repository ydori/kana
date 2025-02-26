import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";

import "model/quiz_model.dart";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

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
                  "${model.remainingKana} remaining",
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
            SizedBox(width: 24.0),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0),
          child: Consumer<QuizModel>(
            builder: (context, model, child) {
              final kana = model.quizKana;
              if (model.isFinished) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${model.correctKanas.length}/${model.totalKana}",
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Keep it up!",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32.0),
                      FilledButton(
                        onPressed: () {
                          model.initQuiz();
                        },
                        child: Text("Restart Quiz"),
                      ),
                      SizedBox(height: 64.0),
                    ],
                  ),
                );
              }
              if (kana == null) {
                return SizedBox();
              }
              return Column(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
