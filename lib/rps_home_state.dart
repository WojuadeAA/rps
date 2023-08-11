import 'package:flutter/material.dart';

@immutable
class RPSHomeState {
  final Color backgroundColor;
  final String botSign;
  final String playerSign;
  final String gameStateDescription;

  const RPSHomeState({
    required this.backgroundColor,
    required this.botSign,
    required this.playerSign,
    required this.gameStateDescription,
  });

  RPSHomeState copyWith({
    Color? backgroundColor,
    String? botSign,
    String? playerSign,
    String? gameStateDescription,
  }) {
    return RPSHomeState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      botSign: botSign ?? this.botSign,
      playerSign: playerSign ?? this.playerSign,
      gameStateDescription: gameStateDescription ?? this.gameStateDescription,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RPSHomeState &&
          runtimeType == other.runtimeType &&
          backgroundColor == other.backgroundColor &&
          botSign == other.botSign &&
          playerSign == other.playerSign &&
          gameStateDescription == other.gameStateDescription;

  @override
  int get hashCode =>
      backgroundColor.hashCode ^
      botSign.hashCode ^
      playerSign.hashCode ^
      gameStateDescription.hashCode;
}
