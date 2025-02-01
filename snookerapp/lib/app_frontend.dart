import 'package:flutter/material.dart';
import 'app_backend.dart';

class SnookerStatsPage extends StatefulWidget {
  final SnookerGameLogic gameLogic;

  SnookerStatsPage({required this.gameLogic});

  @override
  _SnookerStatsPageState createState() => _SnookerStatsPageState();
}

class _SnookerStatsPageState extends State<SnookerStatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Snooker.Statistics of Success')),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            _buildPlayerNames(),
            SizedBox(height: 15),
            Expanded(child: _buildStatistics()),
            SizedBox(height: 10),
            _buildUndoButton(),
            SizedBox(height: 10),
            _buildAllPottedBalls(),
            SizedBox(height: 20),
            _buildResetButtons(),
          ],
        ),
      ),
    );
  }

  /// Строит поля для ввода имен игроков
  Widget _buildPlayerNames() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.gameLogic.player1Name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Player 1',
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: widget.gameLogic.player2Name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Player 2',
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ],
    );
  }

  /// Строит статистику для обоих игроков
  Widget _buildStatistics() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildPlayerStats(widget.gameLogic, true)),
        VerticalDivider(),
        Expanded(child: _buildPlayerStats(widget.gameLogic, false)),
      ],
    );
  }

  /// Строит статистику для одного игрока
  Widget _buildPlayerStats(SnookerGameLogic gameLogic, bool isPlayer1) {
    return Column(
      children: [
        _buildShotStat(
          "Pot Success",
          isPlayer1
              ? gameLogic.player1PotSuccessShots
              : gameLogic.player2PotSuccessShots,
          isPlayer1
              ? gameLogic.player1PotSuccessAttempts
              : gameLogic.player2PotSuccessAttempts,
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1PotSuccessShots++;
              gameLogic.player1PotSuccessAttempts++;
            } else {
              gameLogic.player2PotSuccessShots++;
              gameLogic.player2PotSuccessAttempts++;
            }
            gameLogic.saveState();
          }),
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1PotSuccessAttempts++;
            } else {
              gameLogic.player2PotSuccessAttempts++;
            }
            gameLogic.saveState();
          }),
        ),
        _buildShotStat(
          "Long Pot Success",
          isPlayer1
              ? gameLogic.player1LongPotSuccessShots
              : gameLogic.player2LongPotSuccessShots,
          isPlayer1
              ? gameLogic.player1LongPotSuccessAttempts
              : gameLogic.player2LongPotSuccessAttempts,
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1LongPotSuccessShots++;
              gameLogic.player1LongPotSuccessAttempts++;
              gameLogic.player1PotSuccessShots++; // Успешный удар
              gameLogic.player1PotSuccessAttempts++; // Общая попытка
            } else {
              gameLogic.player2LongPotSuccessShots++;
              gameLogic.player2LongPotSuccessAttempts++;
              gameLogic.player2PotSuccessShots++; // Успешный удар
              gameLogic.player2PotSuccessAttempts++; // Общая попытка
            }
            gameLogic.saveState();
          }),
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1LongPotSuccessAttempts++;
              gameLogic.player1PotSuccessAttempts++; // Общая попытка
            } else {
              gameLogic.player2LongPotSuccessAttempts++;
              gameLogic.player2PotSuccessAttempts++; // Общая попытка
            }
            gameLogic.saveState();
          }),
        ),
        _buildShotStat(
          "Rest Pot Success",
          isPlayer1
              ? gameLogic.player1RestPotSuccessShots
              : gameLogic.player2RestPotSuccessShots,
          isPlayer1
              ? gameLogic.player1RestPotSuccessAttempts
              : gameLogic.player2RestPotSuccessAttempts,
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1RestPotSuccessShots++;
              gameLogic.player1RestPotSuccessAttempts++;
              gameLogic.player1PotSuccessShots++; // Успешный удар
              gameLogic.player1PotSuccessAttempts++; // Общая попытка
            } else {
              gameLogic.player2RestPotSuccessShots++;
              gameLogic.player2RestPotSuccessAttempts++;
              gameLogic.player2PotSuccessShots++; // Успешный удар
              gameLogic.player2PotSuccessAttempts++; // Общая попытка
            }
            gameLogic.saveState();
          }),
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1RestPotSuccessAttempts++;
              gameLogic.player1PotSuccessAttempts++; // Общая попытка
            } else {
              gameLogic.player2RestPotSuccessAttempts++;
              gameLogic.player2PotSuccessAttempts++; // Общая попытка
            }
            gameLogic.saveState();
          }),
        ),
        _buildShotStat(
          "Safety Success",
          isPlayer1
              ? gameLogic.player1SafetySuccessShots
              : gameLogic.player2SafetySuccessShots,
          isPlayer1
              ? gameLogic.player1SafetySuccessAttempts
              : gameLogic.player2SafetySuccessAttempts,
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1SafetySuccessShots++;
              gameLogic.player1SafetySuccessAttempts++;
            } else {
              gameLogic.player2SafetySuccessShots++;
              gameLogic.player2SafetySuccessAttempts++;
            }
            gameLogic.saveState();
          }),
          () => setState(() {
            if (isPlayer1) {
              gameLogic.player1SafetySuccessAttempts++;
            } else {
              gameLogic.player2SafetySuccessAttempts++;
            }
            gameLogic.saveState();
          }),
        ),
      ],
    );
  }

  /// Строит блок для одной строки статистики
  Widget _buildShotStat(String label, int shots, int attempts,
      Function onIncrease, Function onDecrease) {
    double successRate = (attempts > 0) ? (shots / attempts) * 100 : 0;
    return Column(
      children: [
        Text(
          "$label:",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "$shots/$attempts → ${successRate.toStringAsFixed(1)}%",
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onIncrease(),
              child: Text("+", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(172, 84, 235, 89),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => onDecrease(),
              child: Text("-", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(155, 248, 45, 30),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
          ],
        ),
        SizedBox(height: 3),
      ],
    );
  }

  /// Строит кнопку Undo
  Widget _buildUndoButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.gameLogic.undo();
        });
      },
      child: Text("Undo", style: TextStyle(fontSize: 18, color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 160, 101, 232),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      ),
    );
  }

  /// Строит блок "All Potted Balls"
  Widget _buildAllPottedBalls() {
    return Column(
      children: [
        Text(
          "All Potted Balls:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${widget.gameLogic.player1Name.text}: ${widget.gameLogic.getPlayer1TotalBalls()}",
              style: TextStyle(fontSize: 13),
            ),
            Text(
              "${widget.gameLogic.player2Name.text}: ${widget.gameLogic.getPlayer2TotalBalls()}",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }

  /// Строит кнопки сброса
  Widget _buildResetButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.gameLogic.resetPlayer1();
            });
          },
          child: Text("Reset P1"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.gameLogic.resetAll();
            });
          },
          child: Text("Reset All"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.gameLogic.resetPlayer2();
            });
          },
          child: Text("Reset P2"),
        ),
      ],
    );
  }
}
