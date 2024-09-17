import 'package:atm_activity_1/atm_activity_1.dart' as atm_activity_1;
import 'dart:io';

void main(List<String> arguments) {
  while (atm_activity_1.thereAreGuessesLeft) {
    print("ATM.");
    int guess = 3;
    while (guess > 0) {
      print("Enter PIN: ");
      int? pinInput = int.parse(stdin.readLineSync()!);

      if (guess == 0) print("No guesses left. Leave.");

      if (pinInput != atm_activity_1.pin) {
        guess--;
        if (guess == 0) atm_activity_1.thereAreGuessesLeft = false;
        print("Wrong input. Try again. $guess guesses left.");
      } else {
        mainMenu();
        break;
      }
    }
  }
}

void mainMenu() {
  while (true) {
    print("Available Operations:");
    print("[1] Balance Inquiry");
    print("[2] Withdraw Cash");
    print("[3] Transfer Money");
    print("[4] Change Pin");
    print("[5] Pay Bills");
    print("[6] Deposit Money");
    print("[7] Exit");

    print("Choose Operation: ");
    int? operationInput = int.parse(stdin.readLineSync()!);

    if (operationInput == 7) break;

    switch (operationInput) {
      case 1:
        atm_activity_1.balInquiry();
        break;
      case 2:
        atm_activity_1.withdraw();
        break;
      case 3:
        atm_activity_1.transfer();
        break;
      case 4:
        atm_activity_1.changePin();
        break;
      case 5:
        atm_activity_1.payBill();
        break;
      case 6:
        atm_activity_1.deposit();
        break;
      default:
        break;
    }
  }
}
