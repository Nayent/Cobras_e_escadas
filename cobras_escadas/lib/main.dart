import 'package:cobras_escadas/game_board.dart';
import 'package:cobras_escadas/teste.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cobras e Escadas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CobrasEscadas(),
    );
  }
}
