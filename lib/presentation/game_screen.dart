/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/riverpod.dart';
import 'players_screen.dart';
import 'questions/list.dart';
import 'questions/selected_question_alert.dart';
import 'widgets/selected_q_alert_error.dart';

class Game extends ConsumerWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final turnNumber = ref.watch(wheelTurnRiverpod);
    final turnNumberNotifier = ref.read(wheelTurnRiverpod.notifier);
    final turnNumberQNotifier = ref.read(wheelTurnQRiverpod.notifier);
    final questionsList = ref.watch(questionsListRiverpod);
    final player1 = ref.watch(playerOneRiverpod);
    final player2 = ref.watch(playerTwoRiverpod);
    final player3 = ref.watch(playerThreeRiverpod);
    final player4 = ref.watch(playerFourRiverpod);

    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.height * 0.4
                              : MediaQuery.of(context).size.width * 0.4,
                        ),
                        radius: MediaQuery.of(context).size.width >
                                MediaQuery.of(context).size.height
                            ? MediaQuery.of(context).size.height * 0.4
                            : MediaQuery.of(context).size.width * 0.4,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const PlayersScreen(),
                          );
                        },
                        child: Icon(
                          Icons.people,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.height * 0.4
                              : MediaQuery.of(context).size.width * 0.4,
                        ),
                        radius: MediaQuery.of(context).size.width >
                                MediaQuery.of(context).size.height
                            ? MediaQuery.of(context).size.height * 0.4
                            : MediaQuery.of(context).size.width * 0.4,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const QuestionsScreen(),
                          );
                        },
                        child: Icon(
                          Icons.question_answer,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      player1.name!,
                      style: TextStyle(
                          fontWeight: turnNumber == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.height * 0.03
                              : MediaQuery.of(context).size.width * 0.03,
                          color: turnNumber == 1
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          player2.name!,
                          style: TextStyle(
                              fontWeight: turnNumber == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width >
                                      MediaQuery.of(context).size.height
                                  ? MediaQuery.of(context).size.height * 0.03
                                  : MediaQuery.of(context).size.width * 0.03,
                              color: turnNumber == 2
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width >
                              MediaQuery.of(context).size.height
                          ? MediaQuery.of(context).size.height * 0.2
                          : MediaQuery.of(context).size.width * 0.2,
                    ),
                    radius: MediaQuery.of(context).size.width >
                            MediaQuery.of(context).size.height
                        ? MediaQuery.of(context).size.height * 0.2
                        : MediaQuery.of(context).size.width * 0.2,
                    onTap: () {
                      if (questionsList.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              const SelectedQuestionAlertError(),
                        );
                        return;
                      }

                      turnNumberNotifier.shuffle();
                      turnNumberQNotifier.shuffle(questionsList.length);

                      Future.delayed(const Duration(seconds: 1), () {
                        showDialog(
                          context: context,
                          builder: (context) => const SelectedQuestionAlert(),
                        );
                      });
                    },
                    child: AnimatedRotation(
                      turns: turnNumber == 1
                          ? 360.0 / 360.0 * 4
                          : turnNumber == 2
                              ? 90.0 / 360.0 * 5
                              : turnNumber == 3
                                  ? 180.0 / 360.0 * 3
                                  : turnNumber == 4
                                      ? 270.0 / 360.0 * 5
                                      : 1,
                      duration: const Duration(milliseconds: 500),
                      child: Icon(
                        Icons.arrow_circle_up,
                        color: Theme.of(context).colorScheme.primary,
                        size: MediaQuery.of(context).size.width >
                                MediaQuery.of(context).size.height
                            ? MediaQuery.of(context).size.height * 0.5
                            : MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          player4.name!,
                          style: TextStyle(
                              fontWeight: turnNumber == 4
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: MediaQuery.of(context).size.width >
                                      MediaQuery.of(context).size.height
                                  ? MediaQuery.of(context).size.height * 0.03
                                  : MediaQuery.of(context).size.width * 0.03,
                              color: turnNumber == 4
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      player3.name!,
                      style: TextStyle(
                          fontWeight: turnNumber == 3
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height
                              ? MediaQuery.of(context).size.height * 0.03
                              : MediaQuery.of(context).size.width * 0.03,
                          color: turnNumber == 3
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
