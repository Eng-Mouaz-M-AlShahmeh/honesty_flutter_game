/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/riverpod.dart';
import 'widgets/styles.dart';
import 'game_screen.dart';

class PlayersScreen extends ConsumerWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player1 = ref.watch(playerOneRiverpod);
    final player1Notifier = ref.read(playerOneRiverpod.notifier);
    final player2 = ref.watch(playerTwoRiverpod);
    final player2Notifier = ref.read(playerTwoRiverpod.notifier);
    final player3 = ref.watch(playerThreeRiverpod);
    final player3Notifier = ref.read(playerThreeRiverpod.notifier);
    final player4 = ref.watch(playerFourRiverpod);
    final player4Notifier = ref.read(playerFourRiverpod.notifier);

    final TextEditingController player1Controller =
    TextEditingController(text: player1.name ?? '');
    player1Controller.value = player1Controller.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
            offset: player1.name != null ? player1.name!.length : ''.length),
      ),
    );

    final TextEditingController player2Controller =
    TextEditingController(text: player2.name ?? '');
    player2Controller.value = player2Controller.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
            offset: player2.name != null ? player2.name!.length : ''.length),
      ),
    );

    final TextEditingController player3Controller =
    TextEditingController(text: player3.name ?? '');
    player3Controller.value = player3Controller.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
            offset: player3.name != null ? player3.name!.length : ''.length),
      ),
    );

    final TextEditingController player4Controller =
    TextEditingController(text: player4.name ?? '');
    player4Controller.value = player4Controller.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
            offset: player4.name != null ? player4.name!.length : ''.length),
      ),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Dialog(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                      children: [
                        InkWell(
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
                            Navigator.of(context).pop(false);
                          },
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.error,
                            size: 50,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: textInputDecoration(context).copyWith(
                            labelText: 'اللاعب الأول',
                          ),
                          controller: player1Controller,
                          onChanged: (String val) =>
                              player1Notifier.updateName(val),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: textInputDecoration(context).copyWith(
                            labelText: 'اللاعب الثاني',
                          ),
                          controller: player2Controller,
                          onChanged: (String val) =>
                              player2Notifier.updateName(val),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: textInputDecoration(context).copyWith(
                            labelText: 'اللاعب الثالث',
                          ),
                          controller: player3Controller,
                          onChanged: (String val) =>
                              player3Notifier.updateName(val),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: textInputDecoration(context).copyWith(
                            labelText: 'اللاعب الرابع',
                          ),
                          controller: player4Controller,
                          onChanged: (String val) =>
                              player4Notifier.updateName(val),
                        ),
                        const SizedBox(height: 10.0),
                        Expanded(
                          child: TextButton(
                            style: buttonSubmit(context),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Game(),
                                ),
                                    (route) => false,
                              );
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('موافق'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
