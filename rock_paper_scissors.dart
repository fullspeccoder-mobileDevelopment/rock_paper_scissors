import 'dart:io';
import 'dart:math';

enum Move { rock, paper, scissors }

void main() {
  final rng = Random();
  // while true
  while (true) {
    // show prompt
    stdout.write("Rock, paper, or scissors? (r/p/s) ");
    // read user input from console
    final input = stdin.readLineSync();
    // if input is a valid move ("r", "p", "s")
    if (input == "r" || input == "p" || input == "s") {
      var playerMove;
      switch (input) {
        case "r":
          playerMove = Move.rock;
          break;
        case "p":
          playerMove = Move.paper;
          break;
        case "s":
          playerMove = Move.scissors;
          break;
        default:
          break;
      }
      // choose the ai move at random
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      print("You played: ${playerMove}\nAI played: $aiMove");
      // compare the player move with the ai move
      if (playerMove == aiMove) {
        print("Draw");
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print("You win");
      } else {
        print("You lose");
      }
      // show result
      print("Some result with selected input: $input");
    } else if (input == "q") {
      break;
    } else {
      print("Invalid input | input: $input");
    }
  }
}
