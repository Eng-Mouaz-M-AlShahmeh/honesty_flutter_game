/* Developed by Eng Mouaz M AlShahmeh */
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/hQuestion_model.dart';
import '../domain/player_model.dart';

// START GAME LOGIC
// Questions List
final questionsListRiverpod =
    StateNotifierProvider<QuestionsListNotifier, List<HQuestionModel>>((ref) {
  return QuestionsListNotifier();
});

class QuestionsListNotifier extends StateNotifier<List<HQuestionModel>> {
  QuestionsListNotifier() : super([]);

  updateHQuestion(HQuestionModel model) {
    if (state.isEmpty) {
      state.add(model);
      return;
    } else {
      for (int i = 0; i < state.length; i++) {
        if (state[i].id == model.id) {
          state[i] = model;
          return;
        }
      }
      state.add(model);
      return;
    }
  }

  deleteHQuestion(int id) {
    state.removeWhere((element) => element.id == id);
  }
}

// Selected Question
final selectedQuestionRiverpod =
    StateNotifierProvider<SelectedQuestionNotifier, HQuestionModel>((ref) {
  return SelectedQuestionNotifier();
});

class SelectedQuestionNotifier extends StateNotifier<HQuestionModel> {
  SelectedQuestionNotifier() : super(HQuestionModel(id: 0, question: ''));

  updateQuestion(HQuestionModel model) {
    state = model;
  }
}

// players
// One
final playerOneRiverpod =
    StateNotifierProvider<PlayerOneNotifier, PlayerModel>((ref) {
  return PlayerOneNotifier();
});

class PlayerOneNotifier extends StateNotifier<PlayerModel> {
  PlayerOneNotifier() : super(PlayerModel(id: 1, name: ''));

  updateName(String name) {
    state.name = name;
  }
}

// Two
final playerTwoRiverpod =
    StateNotifierProvider<PlayerTwoNotifier, PlayerModel>((ref) {
  return PlayerTwoNotifier();
});

class PlayerTwoNotifier extends StateNotifier<PlayerModel> {
  PlayerTwoNotifier() : super(PlayerModel(id: 2, name: ''));

  updateName(String name) {
    state.name = name;
  }
}

// Three
final playerThreeRiverpod =
    StateNotifierProvider<PlayerThreeNotifier, PlayerModel>((ref) {
  return PlayerThreeNotifier();
});

class PlayerThreeNotifier extends StateNotifier<PlayerModel> {
  PlayerThreeNotifier() : super(PlayerModel(id: 3, name: ''));

  updateName(String name) {
    state.name = name;
  }
}

// Four
final playerFourRiverpod =
    StateNotifierProvider<PlayerFourNotifier, PlayerModel>((ref) {
  return PlayerFourNotifier();
});

class PlayerFourNotifier extends StateNotifier<PlayerModel> {
  PlayerFourNotifier() : super(PlayerModel(id: 4, name: ''));

  updateName(String name) {
    state.name = name;
  }
}

// wheel turn choose player
final wheelTurnRiverpod = StateNotifierProvider<WheelTurnNotifier, int>((ref) {
  return WheelTurnNotifier();
});

class WheelTurnNotifier extends StateNotifier<int> {
  WheelTurnNotifier() : super(0);

  shuffle() {
    int random = Random().nextInt(4) + 1;
    state = random;
  }
}

// wheel turn choose question
final wheelTurnQRiverpod =
    StateNotifierProvider<WheelTurnQNotifier, int>((ref) {
  return WheelTurnQNotifier();
});

class WheelTurnQNotifier extends StateNotifier<int> {
  WheelTurnQNotifier() : super(0);

  shuffle(int val) {
    int random = Random().nextInt(val) + 1;
    state = random;
  }
}

// END GAME LOGIC
