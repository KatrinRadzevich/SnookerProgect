import 'package:flutter/material.dart';

class SnookerGameLogic {
  // Контроллеры для имен игроков
  final TextEditingController player1Name =
      TextEditingController(text: "Player1");
  final TextEditingController player2Name =
      TextEditingController(text: "Player2");

  // Переменные для статистики игроков
  int player1PotSuccessShots = 0, player1PotSuccessAttempts = 0;
  int player2PotSuccessShots = 0, player2PotSuccessAttempts = 0;

  int player1LongPotSuccessShots = 0, player1LongPotSuccessAttempts = 0;
  int player2LongPotSuccessShots = 0, player2LongPotSuccessAttempts = 0;

  int player1SafetySuccessShots = 0, player1SafetySuccessAttempts = 0;
  int player2SafetySuccessShots = 0, player2SafetySuccessAttempts = 0;

  int player1RestPotSuccessShots = 0, player1RestPotSuccessAttempts = 0;
  int player2RestPotSuccessShots = 0, player2RestPotSuccessAttempts = 0;

  // История изменений для функции Undo
  List<Map<String, dynamic>> history = [];

  /// Сохраняет текущее состояние в историю
  void saveState() {
    history.add({
      'player1PotSuccessShots': player1PotSuccessShots,
      'player1PotSuccessAttempts': player1PotSuccessAttempts,
      'player2PotSuccessShots': player2PotSuccessShots,
      'player2PotSuccessAttempts': player2PotSuccessAttempts,
      'player1LongPotSuccessShots': player1LongPotSuccessShots,
      'player1LongPotSuccessAttempts': player1LongPotSuccessAttempts,
      'player2LongPotSuccessShots': player2LongPotSuccessShots,
      'player2LongPotSuccessAttempts': player2LongPotSuccessAttempts,
      'player1SafetySuccessShots': player1SafetySuccessShots,
      'player1SafetySuccessAttempts': player1SafetySuccessAttempts,
      'player2SafetySuccessShots': player2SafetySuccessShots,
      'player2SafetySuccessAttempts': player2SafetySuccessAttempts,
      'player1RestPotSuccessShots': player1RestPotSuccessShots,
      'player1RestPotSuccessAttempts': player1RestPotSuccessAttempts,
      'player2RestPotSuccessShots': player2RestPotSuccessShots,
      'player2RestPotSuccessAttempts': player2RestPotSuccessAttempts,
    });
  }

  /// Отменяет последнее действие (аналог Ctrl+Z)
  void undo() {
    if (history.isNotEmpty) {
      Map<String, dynamic> lastState = history.removeLast();
      player1PotSuccessShots = lastState['player1PotSuccessShots'];
      player1PotSuccessAttempts = lastState['player1PotSuccessAttempts'];
      player2PotSuccessShots = lastState['player2PotSuccessShots'];
      player2PotSuccessAttempts = lastState['player2PotSuccessAttempts'];
      player1LongPotSuccessShots = lastState['player1LongPotSuccessShots'];
      player1LongPotSuccessAttempts =
          lastState['player1LongPotSuccessAttempts'];
      player2LongPotSuccessShots = lastState['player2LongPotSuccessShots'];
      player2LongPotSuccessAttempts =
          lastState['player2LongPotSuccessAttempts'];
      player1SafetySuccessShots = lastState['player1SafetySuccessShots'];
      player1SafetySuccessAttempts = lastState['player1SafetySuccessAttempts'];
      player2SafetySuccessShots = lastState['player2SafetySuccessShots'];
      player2SafetySuccessAttempts = lastState['player2SafetySuccessAttempts'];
      player1RestPotSuccessShots = lastState['player1RestPotSuccessShots'];
      player1RestPotSuccessAttempts =
          lastState['player1RestPotSuccessAttempts'];
      player2RestPotSuccessShots = lastState['player2RestPotSuccessShots'];
      player2RestPotSuccessAttempts =
          lastState['player2RestPotSuccessAttempts'];
    }
  }

  /// Сбрасывает статистику для Player 1
  void resetPlayer1() {
    player1PotSuccessShots = 0;
    player1PotSuccessAttempts = 0;
    player1LongPotSuccessShots = 0;
    player1LongPotSuccessAttempts = 0;
    player1SafetySuccessShots = 0;
    player1SafetySuccessAttempts = 0;
    player1RestPotSuccessShots = 0;
    player1RestPotSuccessAttempts = 0;
  }

  /// Сбрасывает статистику для Player 2
  void resetPlayer2() {
    player2PotSuccessShots = 0;
    player2PotSuccessAttempts = 0;
    player2LongPotSuccessShots = 0;
    player2LongPotSuccessAttempts = 0;
    player2SafetySuccessShots = 0;
    player2SafetySuccessAttempts = 0;
    player2RestPotSuccessShots = 0;
    player2RestPotSuccessAttempts = 0;
  }

  /// Сбрасывает всю статистику и имена игроков
  void resetAll() {
    player1Name.text = "Player1";
    player2Name.text = "Player2";
    resetPlayer1();
    resetPlayer2();
  }

  /// Возвращает общее количество сыгранных шаров для Player 1
  int getPlayer1TotalBalls() {
    return player1PotSuccessShots +
        player1LongPotSuccessShots +
        player1RestPotSuccessShots +
        player1SafetySuccessShots;
  }

  /// Возвращает общее количество сыгранных шаров для Player 2
  int getPlayer2TotalBalls() {
    return player2PotSuccessShots +
        player2LongPotSuccessShots +
        player2RestPotSuccessShots +
        player2SafetySuccessShots;
  }
}
