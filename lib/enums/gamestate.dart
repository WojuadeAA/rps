import 'package:flutter/material.dart';

enum GameState { start, win, lose, draw }

extension GameStateExtension on GameState {
  String get description {
    switch (this) {
      case GameState.start:
        return "Start";
      case GameState.win:
        return "You Win";
      case GameState.lose:
        return "You Lose";
      case GameState.draw:
        return "Draw";
    }
  }

  Color get backgroundColor {
    switch (this) {
      case GameState.start:
        return Colors.yellow;
      case GameState.win:
        return Colors.green;
      case GameState.lose:
        return Colors.red;
      case GameState.draw:
        return Colors.grey;
    }
  }
}
