/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/riverpod.dart';

class SelectedQuestionAlert extends ConsumerWidget {
  const SelectedQuestionAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final turnNumber = ref.watch(wheelTurnRiverpod);
    final turnNumberQ = ref.watch(wheelTurnQRiverpod);
    final questionsList = ref.watch(questionsListRiverpod);
    final player1 = ref.watch(playerOneRiverpod);
    final player2 = ref.watch(playerTwoRiverpod);
    final player3 = ref.watch(playerThreeRiverpod);
    final player4 = ref.watch(playerFourRiverpod);

    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.question_mark_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 50,
          ),
          Text(
            turnNumber == 1
                ? player1.name!
                : turnNumber == 2
                    ? player2.name!
                    : turnNumber == 3
                        ? player3.name!
                        : turnNumber == 4
                            ? player4.name!
                            : '',
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${questionsList.firstWhere((element) => element.id == turnNumberQ).question}',
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'موافق',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
