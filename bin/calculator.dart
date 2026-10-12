import 'dart:io';
import 'dart:math';

void main() {
  List<String> history = [];
  bool keepRunning = true;

  print('====================================');
  print('    ADVANCED DART CALCULATOR CLI    ');
  print('====================================');

  while (keepRunning) {
    print('\nSelect an operation:');
    print(' 1. Basic Arithmetic (+, -, *, /, %, ^)');
    print(' 2. Square Root (√)');
    print(' 3. Trigonometric Functions (sin, cos, tan)');
    print(' 4. Logarithm (ln)');
    print(' 5. View Calculation History');
    print(' 6. Exit');
    stdout.write('Enter your choice (1-6): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        performBasicArithmetic(history);
        break;
      case '2':
        performSquareRoot(history);
        break;
      case '3':
        performTrigonometry(history);
        break;
      case '4':
        performLogarithm(history);
        break;
      case '5':
        showHistory(history);
        break;
      case '6':
        keepRunning = false;
        print('\nThank you for using Advanced Dart Calculator!');
        break;
      default:
        print('Invalid choice! Please select a valid option (1-6).');
    }
  }
}

void performBasicArithmetic(List<String> history) {
  stdout.write('Enter first number: ');
  double? num1 = double.tryParse(stdin.readLineSync() ?? '');

  stdout.write('Enter operator (+, -, *, /, %, ^): ');
  String? operator = stdin.readLineSync();

  stdout.write('Enter second number: ');
  double? num2 = double.tryParse(stdin.readLineSync() ?? '');

  if (num1 == null || num2 == null || operator == null) {
    print('Error: Invalid numerical input!');
    return;
  }

  double result;
  switch (operator) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 == 0) {
        print('Error: Division by zero is undefined!');
        return;
      }
      result = num1 / num2;
      break;
    case '%':
      result = num1 % num2;
      break;
    case '^':
      result = pow(num1, num2).toDouble();
      break;
    default:
      print('Error: Unsupported operator!');
      return;
  }

  String entry = '$num1 $operator $num2 = $result';
  print('Result: $result');
  history.add(entry);
}

void performSquareRoot(List<String> history) {
  stdout.write('Enter number: ');
  double? num = double.tryParse(stdin.readLineSync() ?? '');

  if (num == null) {
    print('Error: Invalid input!');
    return;
  }

  if (num < 0) {
    print('Error: Cannot calculate square root of a negative number!');
    return;
  }

  double result = sqrt(num);
  String entry = '√($num) = $result';
  print('Result: $result');
  history.add(entry);
}

void performTrigonometry(List<String> history) {
  print('Select function: 1. sin  2. cos  3. tan');
  stdout.write('Choice (1-3): ');
  String? subChoice = stdin.readLineSync();

  stdout.write('Enter angle in degrees: ');
  double? degrees = double.tryParse(stdin.readLineSync() ?? '');

  if (degrees == null) {
    print('Error: Invalid angle value!');
    return;
  }

  double radians = degrees * (pi / 180);
  double result;
  String funcName;

  switch (subChoice) {
    case '1':
      result = sin(radians);
      funcName = 'sin';
      break;
    case '2':
      result = cos(radians);
      funcName = 'cos';
      break;
    case '3':
      result = tan(radians);
      funcName = 'tan';
      break;
    default:
      print('Error: Invalid option!');
      return;
  }

  String entry = '$funcName($degrees°) = $result';
  print('Result: $result');
  history.add(entry);
}

void performLogarithm(List<String> history) {
  stdout.write('Enter number (> 0): ');
  double? num = double.tryParse(stdin.readLineSync() ?? '');

  if (num == null || num <= 0) {
    print('Error: Natural log is only defined for numbers greater than 0!');
    return;
  }

  double result = log(num);
  String entry = 'ln($num) = $result';
  print('Result: $result');
  history.add(entry);
}

void showHistory(List<String> history) {
  print('\n--- Calculation History ---');
  if (history.isEmpty) {
    print('No calculations recorded yet.');
  } else {
    for (int i = 0; i < history.length; i++) {
      print('${i + 1}. ${history[i]}');
    }
  }
}