import 'dart:io';

void main() {
  print('Digite um número inteiro:');
  String number = stdin.readLineSync() ?? "0";

  num value = int.parse(number);

  int sum = 0;

  for (var i = 3; i < value; i++) {
    if (i % 3 == 0 || i % 5 == 0) {
      sum += i;
    }
  }

  print("A soma resultante é: $sum");
}
