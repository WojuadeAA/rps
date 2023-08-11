import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rps/enums/gamestate.dart';
import 'package:rps/enums/sign.dart';
import 'package:rps/rps_home_state.dart';

class RPSStateNotifier extends StateNotifier<RPSHomeState> {
  RPSStateNotifier()
      : super(const RPSHomeState(
          backgroundColor: Colors.yellow,
          botSign: "🤖",
          playerSign: "",
          gameStateDescription: "tap options to play",
        ));

  void play(Sign player) {
    final bot = generateBotSign();
    final gameState = determineGameState(player, bot);
    final gameStateDescription = gameState.description;
    final playerSign = player.emoji;
    final botSign = bot.emoji;
    state = state.copyWith(
      backgroundColor: gameState.backgroundColor,
      botSign: botSign,
      playerSign: playerSign,
      gameStateDescription: gameStateDescription,
    );
  }

  //can i move this to a service or repository?
  GameState determineGameState(Sign playerSign, Sign botSign) {
    switch (playerSign) {
      case Sign.rock:
        if (botSign == Sign.rock) {
          return GameState.draw;
        } else if (botSign == Sign.paper) {
          return GameState.lose;
        } else if (botSign == Sign.scissors) {
          return GameState.win;
        }
      case Sign.paper:
        if (botSign == Sign.rock) {
          return GameState.win;
        } else if (botSign == Sign.paper) {
          return GameState.draw;
        } else if (botSign == Sign.scissors) {
          return GameState.lose;
        }
      case Sign.scissors:
        if (botSign == Sign.rock) {
          return GameState.lose;
        } else if (botSign == Sign.paper) {
          return GameState.win;
        } else if (botSign == Sign.scissors) {
          return GameState.draw;
        }
    }
    return GameState.start;
  }

  Sign generateBotSign() {
    return Sign.values[Random().nextInt(Sign.values.length)];
  }

  Color determineBackgroundColor(GameState gameState) {
    switch (gameState) {
      case GameState.start:
        return Colors.yellow;
      case GameState.win:
        return Colors.green;
      case GameState.lose:
        return Colors.red;
      case GameState.draw:
        return Colors.blue;
    }
  }

  void playAgain() {
    state = state.copyWith(
      backgroundColor: Colors.yellow,
      botSign: "🤖",
      playerSign: "",
      gameStateDescription: "tap options to play",
    );
  }
}

final rpsStateNotifierProvider =
    StateNotifierProvider<RPSStateNotifier, RPSHomeState>((ref) {
  return RPSStateNotifier();
});
