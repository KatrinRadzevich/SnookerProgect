import 'package:flutter/material.dart';

class SnookerGameState {
  TextEditingController player1Name = TextEditingController(text: "Player1");
  TextEditingController player2Name = TextEditingController(text: "Player2");

  int player1PotSuccessShots = 0;
  int player1PotSuccessAttempts = 0;
  int player2PotSuccessShots = 0;
  int player2PotSuccessAttempts = 0;

  int player1LongPotSuccessShots = 0;
  int player1LongPotSuccessAttempts = 0;
  int player2LongPotSuccessShots = 0;
  int player2LongPotSuccessAttempts = 0;

  int player1SafetySuccessShots = 0;
  int player1SafetySuccessAttempts = 0;
  int player2SafetySuccessShots = 0;
  int player2SafetySuccessAttempts = 0;

  int player1RestPotSuccessShots = 0;
  int player1RestPotSuccessAttempts = 0;
  int player2RestPotSuccessShots = 0;
  int player2RestPotSuccessAttempts = 0;

  List<Map<String, dynamic>> history = [];

  // Getters для общего количества шаров
  int get player1TotalBalls =>
      player1PotSuccessShots +
      player1LongPotSuccessShots +
      player1RestPotSuccessShots +
      player1SafetySuccessShots;

  int get player2TotalBalls =>
      player2PotSuccessShots +
      player2LongPotSuccessShots +
      player2RestPotSuccessShots +
      player2SafetySuccessShots;

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

  void resetAll() {
    player1Name.text = "Player1";
    player2Name.text = "Player2";
    resetPlayer1();
    resetPlayer2();
  }

  // Методы для увеличения счетчиков, чтобы их вызывал Frontend
  void increasePlayer1PotSuccess() {
    player1PotSuccessShots++;
    player1PotSuccessAttempts++;
  }

  void increasePlayer1PotAttempt() {
    player1PotSuccessAttempts++;
  }

  void increasePlayer1LongPotSuccess() {
    player1LongPotSuccessShots++;
    player1LongPotSuccessAttempts++;
    player1PotSuccessShots++; // Успешный удар
    player1PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer1LongPotAttempt() {
    player1LongPotSuccessAttempts++;
    player1PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer1RestPotSuccess() {
    player1RestPotSuccessShots++;
    player1RestPotSuccessAttempts++;
    player1PotSuccessShots++; // Успешный удар
    player1PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer1RestPotAttempt() {
    player1RestPotSuccessAttempts++;
    player1PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer1SafetySuccess() {
    player1SafetySuccessShots++;
    player1SafetySuccessAttempts++;
  }

  void increasePlayer1SafetyAttempt() {
    player1SafetySuccessAttempts++;
  }

  void increasePlayer2PotSuccess() {
    player2PotSuccessShots++;
    player2PotSuccessAttempts++;
  }

  void increasePlayer2PotAttempt() {
    player2PotSuccessAttempts++;
  }

  void increasePlayer2LongPotSuccess() {
    player2LongPotSuccessShots++;
    player2LongPotSuccessAttempts++;
    player2PotSuccessShots++; // Успешный удар
    player2PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer2LongPotAttempt() {
    player2LongPotSuccessAttempts++;
    player2PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer2RestPotSuccess() {
    player2RestPotSuccessShots++;
    player2RestPotSuccessAttempts++;
    player2PotSuccessShots++; // Успешный удар
    player2PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer2RestPotAttempt() {
    player2RestPotSuccessAttempts++;
    player2PotSuccessAttempts++; // Общая попытка
  }

  void increasePlayer2SafetySuccess() {
    player2SafetySuccessShots++;
    player2SafetySuccessAttempts++;
  }

  void increasePlayer2SafetyAttempt() {
    player2SafetySuccessAttempts++;
  }
}
