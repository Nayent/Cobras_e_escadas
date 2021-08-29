import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CobrasEscadas extends StatefulWidget {
  const CobrasEscadas({Key? key}) : super(key: key);

  @override
  _CobrasEscadasState createState() => _CobrasEscadasState();
}

class _CobrasEscadasState extends State<CobrasEscadas> {
  int dice1 = 1;
  int dice2 = 1;
  int sum = 0;
  int aux = 0;
  int positionPlayer1 = 0;
  int positionPlayer2 = 0;
  int winner = 0;
  String dice1Image = 'dice1.png';
  String dice2Image = 'dice1.png';
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
        showDialog(context: context, builder: (_) => OverDialog());
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
            showDialog(context: context, builder: (_) => ObstacleDialog(turn));
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

  void _restart() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      sum = 0;
      aux = 0;
      positionPlayer1 = 0;
      positionPlayer2 = 0;
      winner = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Cobras e Escadas',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  child: Image.network(
                    'https://raw.githubusercontent.com/Nayent/Escribo/main/cobras_escadas/assets/board.jpg',
                    height: MediaQuery.of(context).size.height * (2 / 3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _restart();
                          },
                          child: const Text('Reiniciar'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff333951),
                              textStyle: GoogleFonts.quicksand(
                                  fontSize: 24.0, color: Colors.white))),
                      Image.network(
                        'https://raw.githubusercontent.com/Nayent/Escribo/main/cobras_escadas/assets/dice$dice1.png',
                        height: 50,
                      ),
                      Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Soma dos dados: $sum'),
                              Text(
                                  'Jogador 1 está na posição $positionPlayer1'),
                              Text(
                                  'Jogador 2 está na posição $positionPlayer2'),
                            ]),
                      ),
                      Image.network(
                        'https://raw.githubusercontent.com/Nayent/Escribo/main/cobras_escadas/assets/dice$dice2.png',
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _play();
                          },
                          child: const Text('Jogar'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff333951),
                              textStyle: GoogleFonts.quicksand(
                                  fontSize: 24.0, color: Colors.white))),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WinDialog extends StatelessWidget {
  int jogador;

  WinDialog(this.jogador);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Jogador $jogador Venceu!',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}

class OverDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'O jogo acabou!',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}

class ObstacleDialog extends StatelessWidget {
  int jogador;

  ObstacleDialog(this.jogador);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'O jogagor $jogador caiu em um obstáculo!',
        style: TextStyle(fontSize: 32),
      ),
    ));
  }
}
