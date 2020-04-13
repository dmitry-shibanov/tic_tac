import 'package:flutter/material.dart';
import 'package:tic_tac_toe/controller/oponnet.dart';

import 'models/game.dart';

class GameUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GameUIState();
  }
}

class GameUIState extends State<GameUI> {
  bool isCross = true;
  List<String> variants = [
    "assets/images/edit.png",
    "assets/images/circle.png",
    "assets/images/cross.png"
  ];

  Game _game;
  String message;
  Oponent _oponent = new Oponent();

  @override
  void initState() {
    _game = new Game();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("TicTacToe"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () => Navigator.pushNamed(context, "/statistic"))
        ],
      ),
      body: Stack(alignment: Alignment(0, 0.9), children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 8.0),
            itemBuilder: buildCard,
            itemCount: 9,
            primary: true,
            // shrinkWrap: true,
          ),
        ),
        RaisedButton(
          child: Text("Reset Game"),
          onPressed: resetGame,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(MediaQuery.of(context).size.height / 2),
              right: Radius.circular(MediaQuery.of(context).size.height / 2),
            ),
          ),
        )
      ]),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(child: Image.asset(variants[_game.square[index] + 1])),
      onTap: () => this.isCross && this._game.square[index] ==-1 ? playGame(index) : null,
    );
  }

  playGame(int index) {
    if (this.isCross) {
      if (this._game.square[index] == -1) {
        setState(() {
          this._game.square[index] = 1;
          this.isCross = !this.isCross;
          this.checkWin();
        });
      }
      playGame(_oponent.findBestMove(this._game.square));
    } else {
      setState(() {
        this._game.square[index] = 0;
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      this._game.square = [
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
      ];
      this.message = "";
    });
  }

  Delay() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        this.resetGame();
      });
    });
  }

  checkWin() {
    if ((_game.square[0] != -1) &&
        (_game.square[0] == _game.square[1]) &&
        (_game.square[1] == _game.square[2])) {
      // if any user Win update the message state
      setState(() {
        this.message = '${this._game.square[0]} wins';
        this.Delay();
      });
    } else if ((_game.square[3] != -1) &&
        (_game.square[3] == _game.square[4]) &&
        (_game.square[4] == _game.square[5])) {
      setState(() {
        this.message = '${this._game.square[3]} wins';
        this.Delay();
      });
    } else if ((_game.square[6] != -1) &&
        (_game.square[6] == _game.square[7]) &&
        (_game.square[7] == _game.square[8])) {
      setState(() {
        this.message = '${this._game.square[6]} wins';
        this.Delay();
      });
    } else if ((_game.square[0] != -1) &&
        (_game.square[0] == _game.square[3]) &&
        (_game.square[3] == _game.square[6])) {
      setState(() {
        this.message = '${this._game.square[0]} wins';
        this.Delay();
      });
    } else if ((_game.square[1] != -1) &&
        (_game.square[1] == _game.square[4]) &&
        (_game.square[4] == _game.square[7])) {
      setState(() {
        this.message = '${this._game.square[1]} wins';
        this.Delay();
      });
    } else if ((_game.square[2] != -1) &&
        (_game.square[2] == _game.square[5]) &&
        (_game.square[5] == _game.square[8])) {
      setState(() {
        this.message = '${this._game.square[2]} wins';
        this.Delay();
      });
    } else if ((_game.square[0] != -1) &&
        (_game.square[0] == _game.square[4]) &&
        (_game.square[4] == _game.square[8])) {
      setState(() {
        this.message = '${this._game.square[0]} wins';
        this.Delay();
      });
    } else if ((_game.square[2] != -1) &&
        (_game.square[2] == _game.square[4]) &&
        (_game.square[4] == _game.square[6])) {
      setState(() {
        this.message = '${this._game.square[2]} wins';
        this.Delay();
      });
    } else if (!_game.square.contains(-1)) {
      setState(() {
        this.message = 'Game Draw';
        this.Delay();
      });
    }
  }
}
