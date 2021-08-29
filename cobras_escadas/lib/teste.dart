import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class Teste extends StatelessWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        height: MediaQuery.of(context).size.height * (2 / 3),
        width: MediaQuery.of(context).size.height * (3 / 5),
        child: Stack(children: [
          Image.asset(
            'board.jpg',
            height: MediaQuery.of(context).size.height * (2 / 3),
          ),
          GridView.count(
            crossAxisCount: 10,
            childAspectRatio: 1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(100, (index) {
              return Container(
                  constraints: BoxConstraints(maxHeight: 1, maxWidth: 1),
                  child: Card(
                    color: Colors.blue,
                  ));
            }),
          ),
        ]),
      ),
    );
  }
}
