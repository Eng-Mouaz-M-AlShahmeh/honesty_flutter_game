/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/riverpod.dart';
import '../../domain/hQuestion_model.dart';
import '../widgets/styles.dart';
import 'list.dart';

class UpdateQuestionScreen extends ConsumerWidget {
  const UpdateQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedQuestion = ref.watch(selectedQuestionRiverpod);
    final selectedQuestionNotifier =
        ref.read(selectedQuestionRiverpod.notifier);
    final questionsListNotifier = ref.read(questionsListRiverpod.notifier);

    final TextEditingController selectedQuestionController =
        TextEditingController(text: selectedQuestion.question ?? '');
    selectedQuestionController.value =
        selectedQuestionController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
            offset: selectedQuestion.question != null
                ? selectedQuestion.question!.length
                : ''.length),
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
              Expanded(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: textInputDecoration(context).copyWith(
                        labelText: 'السؤال',
                      ),
                      controller: selectedQuestionController,
                      onChanged: (String val) =>
                          selectedQuestionNotifier.updateQuestion(
                        HQuestionModel(id: selectedQuestion.id, question: val),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      style: buttonSubmit(context),
                      onPressed: () {
                        questionsListNotifier.updateHQuestion(selectedQuestion);

                        Navigator.of(context).pop(false);
                        Navigator.of(context).pop(false);
                        showDialog(
                          context: context,
                          builder: (context) => const QuestionsScreen(),
                        );
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('موافق'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
