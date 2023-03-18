/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/riverpod.dart';
import '../../domain/hQuestion_model.dart';
import 'add_question.dart';
import 'update_question.dart';

class QuestionsScreen extends ConsumerWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsList = ref.watch(questionsListRiverpod);
    final questionsListNotifier = ref.read(questionsListRiverpod.notifier);
    final selectedQuestionNotifier =
    ref.read(selectedQuestionRiverpod.notifier);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      selectedQuestionNotifier
                          .updateQuestion(HQuestionModel(id: 0, question: ''));
                      showDialog(
                        context: context,
                        builder: (context) => const AddQuestionScreen(),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_box,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                        const Text('إضافة سؤال جديد'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
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
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemExtent: MediaQuery.of(context).size.height * 0.07,
                  itemCount: questionsList.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
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
                        selectedQuestionNotifier
                            .updateQuestion(questionsList[index]);
                        showDialog(
                          context: context,
                          builder: (context) => const UpdateQuestionScreen(),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            questionsList[index].id.toString(),
                          ),
                        ),
                        title: Text('السؤال رقم ${questionsList[index].id}'),
                        trailing: InkWell(
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
                            questionsListNotifier
                                .deleteHQuestion(questionsList[index].id!);
                            Navigator.of(context).pop(false);
                            showDialog(
                              context: context,
                              builder: (context) => const QuestionsScreen(),
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.error,
                            size: 30,
                          ),
                        ),
                      ),
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
