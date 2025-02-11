import 'package:flutter/material.dart';
import 'app_frontend.dart'; // Импортируем frontend

void main() {
  runApp(SnookerApp());
}

class SnookerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snooker.Statistics of Success',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      home: SnookerStatsPage(), // Используем SnookerStatsPage из frontend
    );
  }
}
