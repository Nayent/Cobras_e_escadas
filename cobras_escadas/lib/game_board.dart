import 'package:flutter/material.dart';
import 'dart:math';

class CobrasEscadas extends StatefulWidget {
  const CobrasEscadas({Key? key}) : super(key: key);

  @override
  _CobrasEscadasState createState() => _CobrasEscadasState();
}

class _CobrasEscadasState extends State<CobrasEscadas> {
  int dice1 = 0;
  int dice2 = 0;
  int sum = 0;
  int aux = 0;
  int positionPlayer1 = 0;
  int positionPlayer2 = 0;
  int winner = 0;
  var obstacles = {
    2: 38,
    7: 14,
    8: 31,
    15: 26,
    16: 6,
    21: 42,
    28: 84,
    36: 44,
    46: 25,
    49: 11,
    51: 67,
    62: 19,
    64: 60,
    71: 91,
    74: 53,
    78: 98,
    87: 94,
    89: 68,
    92: 88,
    95: 75,
    99: 80
  };

  void _play() {
    setState(() {
      if (aux == -1) {
        showDialog(context: context, builder: (_) => WinDialog(winner));
      } else {
        int _test(int player, int turn, int sum, obstacles) {
          aux++;
          player += sum;
          if (player == 100) {
            showDialog(context: context, builder: (_) => WinDialog(turn));
            aux = -1;
            winner = turn;
          } else if (player > 100) {
            player = 100 - (player - 100);
          }
          if (obstacles.containsKey(player)) {
            player = obstacles[player];
          }
          return player;
        }

        dice1 = 1 + Random().nextInt(5);
        dice2 = 1 + Random().nextInt(5);
        sum = dice1 + dice2;

        if (aux % 2 == 0) {
          positionPlayer1 = _test(positionPlayer1, 1, sum, obstacles);
        } else {
          positionPlayer2 = _test(positionPlayer2, 2, sum, obstacles);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Dado 1: $dice1'),
            Text('Dado 2: $dice2'),
            Text('Soma dos dados: $sum'),
            Text('Posição do jogador 1: $positionPlayer1'),
            Text('Posição do jogador 2: $positionPlayer2'),
            Text('aux: $aux'),
          ]),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, onPrimary: Colors.white, elevation: 5),
            autofocus: true,
            onPressed: () {
              _play();
            },
            child: const Text('Jogar', style: TextStyle(fontSize: 20)),
          ),
        ),
      ]),
    );
  }
}

class WinDialog extends StatelessWidget {
  int jogador;

  WinDialog(this.jogador);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Text(
      'Jogador $jogador Venceu!',
      style: TextStyle(fontSize: 32),
    ));
  }
}
