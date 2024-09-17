import 'dart:io';
bool thereAreGuessesLeft = true;
int pin = 1234;
int balance = 5000;
int meralco = 300;
int water = 300;

void changePin() {
  print("New Pin: ");
  int? newPin = int.parse(stdin.readLineSync()!);
  pin = newPin;
}

void balInquiry() {
  print("You currently have ₱ $balance in your account.");
}

void deposit() {
  print("Deposit Amount: ");
  int? amount = int.parse(stdin.readLineSync()!);
  print("₱$amount added to account.");
  balance += amount;
}

void withdraw() {
  print("Withdraw Amount: ");
  int? amount = int.parse(stdin.readLineSync()!);
  if (amount < balance) {
    balance -= amount;
    print("₱$amount withdrawn from account.");
  } else {
    print("You don't have enough money in your account for this operation.");
  }
}

void transfer() {
  print("Transferring to Account No.: ");
  int? accountNo = int.parse(stdin.readLineSync()!);

  print("Transferring Amount: ");
  int? amount = int.parse(stdin.readLineSync()!);

  if (amount < balance) {
    balance -= amount;
    print("₱$amount transferred to Account No. $accountNo.");
  } else {
    print("You don't have enough money in your account for this operation.");
  }
}

void payBill() {
  print("Paying Bill for: ");
  print("[1] Meralco");
  print("[2] Water");
  print("NOTICE: Over payment will not be refunded.");

  print("Choose Bill: ");
  int? billInput = int.parse(stdin.readLineSync()!);

  switch (billInput) {
    case 1:
      print("Meralco Bill: ₱$meralco");
      break;
    case 2:
      print("Water Bill: ₱$water");
      break;
    default:
      print("No such bill found.");
  }

  print("Pay Amount: ");
  int? amount = int.parse(stdin.readLineSync()!);

  if (amount < balance) {
    balance -= amount;
    switch (billInput) {
      case 1:
        meralco - amount;
        break;
      case 2:
        water - amount;
        break;
      default:
        print("No such bill found.");
    }
  } else {
    print("You don't have enough money in your account for this operation.");
  }
}
