import 'package:tictactoe/core/constants.dart';
import 'package:tictactoe/core/winner_rules.dart';
import 'package:tictactoe/enums/player_type.dart';
import 'package:tictactoe/enums/winner_type.dart';
import 'package:tictactoe/models/game_tile.dart';

class GameController {
  List<GameTile> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  PlayerType currentPlayer;
  bool isSinglePlayer;
  int p1win = 0, p2win = 0, tie = 0;

  bool get hasMoves =>
      (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  bool get isBotTurn => isSinglePlayer && currentPlayer == PlayerType.player2;

  GameController() {
    initialize();
  }

  void initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    tiles = List<GameTile>.generate(BOARD_SIZE, (index) => GameTile(index + 1));
  }

  void mark(GameTile tile) {
    if (currentPlayer == PlayerType.player1) {
      tile.symbol = PLAYER1_SYMBOL;
      tile.color = PLAYER1_COLOR;
      movesPlayer1.add(tile.id);
      currentPlayer = PlayerType.player2;
    } else {
      tile.symbol = PLAYER2_SYMBOL;
      tile.color = PLAYER2_COLOR;
      movesPlayer2.add(tile.id);
      currentPlayer = PlayerType.player1;
    }

    tile.enable = false;
  }

  bool _checkPlayerWinner(List<int> moves) {
    return winnerRules.any((rule) =>
        moves.contains(rule[0]) &&
        moves.contains(rule[1]) &&
        moves.contains(rule[2]));
  }

  WinnerType checkWinner() {
    if (_checkPlayerWinner(movesPlayer1)) return WinnerType.player1;
    if (_checkPlayerWinner(movesPlayer2)) return WinnerType.player2;
    return WinnerType.none;
  }

  int automaticMove() {
    var moves = new List<int>.generate(BOARD_SIZE, (index) => index + 1);
    moves.removeWhere((element) => movesPlayer1.contains(element));
    moves.removeWhere((element) => movesPlayer2.contains(element));

    moves.shuffle();
    return moves[0];
  }
}
//06/10 - 0:56:00-desafios
