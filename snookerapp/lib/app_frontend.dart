import 'package:flutter/material.dart';
import 'app_backend.dart'; // Импортируем backend

class SnookerStatsPage extends StatefulWidget {
  @override
  _SnookerStatsPageState createState() => _SnookerStatsPageState();
}

class _SnookerStatsPageState extends State<SnookerStatsPage> {
  // Получаем доступ к SnookerGameState через экземпляр
  final SnookerGameState gameState = SnookerGameState();

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width; // Получаем ширину экрана
    double screenHeight =
        MediaQuery.of(context).size.height; // Получаем высоту экрана

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Snooker.Statistics of Success')),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(
            screenWidth / 20.0), // Адаптивный padding для всего body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight / 300), // Адаптивный отступ
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: gameState.player1Name,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Player 1',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight / 140), // Адаптивный отступ
                    ),
                  ),
                ),
                SizedBox(width: screenWidth / 20), // Адаптивный отступ
                Expanded(
                  child: TextField(
                    controller: gameState.player2Name,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Player 2',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight / 140), // Адаптивный отступ
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight / 140), // Адаптивный отступ
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        buildShotStat(
                          "Pot Success",
                          gameState.player1PotSuccessShots,
                          gameState.player1PotSuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer1PotSuccess()),
                          () => setState(
                              () => gameState.increasePlayer1PotAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                        buildShotStat(
                          "Long Pot Success",
                          gameState.player1LongPotSuccessShots,
                          gameState.player1LongPotSuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer1LongPotSuccess()),
                          () => setState(
                              () => gameState.increasePlayer1LongPotAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                        buildShotStat(
                          "Rest Pot Success",
                          gameState.player1RestPotSuccessShots,
                          gameState.player1RestPotSuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer1RestPotSuccess()),
                          () => setState(
                              () => gameState.increasePlayer1RestPotAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                        buildShotStat(
                          "Safety Success",
                          gameState.player1SafetySuccessShots,
                          gameState.player1SafetySuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer1SafetySuccess()),
                          () => setState(
                              () => gameState.increasePlayer1SafetyAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Column(
                      children: [
                        buildShotStat(
                          "Pot Success",
                          gameState.player2PotSuccessShots,
                          gameState.player2PotSuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer2PotSuccess()),
                          () => setState(
                              () => gameState.increasePlayer2PotAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                        buildShotStat(
                          "Long Pot Success",
                          gameState.player2LongPotSuccessShots,
                          gameState.player2LongPotSuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer2LongPotSuccess()),
                          () => setState(
                              () => gameState.increasePlayer2LongPotAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                        buildShotStat(
                          "Rest Pot Success",
                          gameState.player2RestPotSuccessShots,
                          gameState.player2RestPotSuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer2RestPotSuccess()),
                          () => setState(
                              () => gameState.increasePlayer2RestPotAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                        buildShotStat(
                          "Safety Success",
                          gameState.player2SafetySuccessShots,
                          gameState.player2SafetySuccessAttempts,
                          () => setState(
                              () => gameState.increasePlayer2SafetySuccess()),
                          () => setState(
                              () => gameState.increasePlayer2SafetyAttempt()),
                          screenWidth: screenWidth, // Передаем screenWidth
                          screenHeight: screenHeight, // Передаем screenHeight
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 800), // Адаптивный отступ
            ElevatedButton(
              onPressed: () => setState(() => gameState.undo()),
              child: Text("Undo",
                  style: TextStyle(
                      fontSize: screenWidth / 23,
                      color: Colors.black)), // Адаптивный размер шрифта
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 158, 107, 213),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 12,
                    vertical: screenHeight / 100), // Адаптивные отступы
              ),
            ),
            SizedBox(height: screenHeight / 60), // Адаптивный отступ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => setState(() => gameState.resetPlayer1()),
                    child: Text("Reset P1",
                        style: TextStyle(
                            fontSize:
                                screenWidth / 30))), // Адаптивный размер шрифта
                ElevatedButton(
                    onPressed: () => setState(() => gameState.resetAll()),
                    child: Text("Reset All",
                        style: TextStyle(
                            fontSize:
                                screenWidth / 30))), // Адаптивный размер шрифта
                ElevatedButton(
                    onPressed: () => setState(() => gameState.resetPlayer2()),
                    child: Text("Reset P2",
                        style: TextStyle(
                            fontSize:
                                screenWidth / 30))), // Адаптивный размер шрифта
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShotStat(String label, int shots, int attempts,
      Function onIncrease, Function onDecrease,
      {required double screenWidth, required double screenHeight}) {
    // screenWidth и screenHeight теперь принимаются как параметры
    double successRate = (attempts > 0) ? (shots / attempts) * 100 : 0;
    return Column(
      children: [
        Text(
          "$label:",
          style: TextStyle(
              fontSize: screenWidth / 30,
              fontWeight: FontWeight.bold), // Адаптивный размер шрифта
        ),
        SizedBox(height: screenWidth / 50), // Адаптивный отступ
        Text(
          "$shots/$attempts → ${successRate.toStringAsFixed(1)}%",
          style:
              TextStyle(fontSize: screenWidth / 27), // Адаптивный размер шрифта
        ),
        SizedBox(height: screenWidth / 50), // Адаптивный отступ
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                gameState.saveState();
                onIncrease();
              },
              child: Text("+",
                  style: TextStyle(
                      fontSize: screenWidth / 20)), // Адаптивный размер шрифта
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(172, 84, 235, 89),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 15,
                    vertical: screenWidth / 75), // Адаптивные отступы
              ),
            ),
            SizedBox(width: screenWidth / 15), // Адаптивный отступ
            ElevatedButton(
              onPressed: () {
                gameState.saveState();
                onDecrease();
              },
              child: Text("-",
                  style: TextStyle(
                      fontSize: screenWidth / 20)), // Адаптивный размер шрифта
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(155, 248, 45, 30),
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 15,
                    vertical: screenWidth / 75), // Адаптивные отступы
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth / 30), // Адаптивный отступ
      ],
    );
  }
}
