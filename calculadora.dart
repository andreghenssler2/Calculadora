import 'dart:io';

void main() {
  print('=== Calculadora Simples ===');

  // Lista de operações válidas
  List<String> operacoes = ['+', '-', '*', '/'];

  bool continuar = true;

  while (continuar) {
    try {
      // Solicita o primeiro número
      stdout.write('Digite o primeiro número: ');
      String? input1 = stdin.readLineSync();
      if (input1 == null) break;
      double num1 = double.parse(input1);

      // Solicita a operação
      stdout.write('Digite a operação (+, -, *, /): ');
      String? operacao = stdin.readLineSync();
      if (operacao == null || !operacoes.contains(operacao)) {
        print('Operação inválida! Tente novamente.\n');
        continue;
      }

      // Solicita o segundo número
      stdout.write('Digite o segundo número: ');
      String? input2 = stdin.readLineSync();
      if (input2 == null) continue;
      double num2 = double.parse(input2);

      double resultado;

      // Realiza a operação
      if (operacao == '+') {
        resultado = num1 + num2;
      } else if (operacao == '-') {
        resultado = num1 - num2;
      } else if (operacao == '*') {
        resultado = num1 * num2;
      } else if (operacao == '/') {
        if (num2 == 0) {
          print('Erro: divisão por zero não é permitida.\n');
          continue;
        }
        resultado = num1 / num2;
      } else {
        print('Operação desconhecida!\n');
        continue;
      }

      print('Resultado: $num1 $operacao $num2 = $resultado\n');

      // Pergunta se o usuário deseja continuar
      stdout.write('Deseja continuar? (s/n): ');
      String? resp = stdin.readLineSync();
      if (resp == null || resp.toLowerCase() != 's') {
        continuar = false;
      }

    } catch (e) {
      print('Entrada inválida! Digite números válidos.\n');
    }
  }

  print('Calculadora encerrada. Até logo!');
}
