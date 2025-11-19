import 'package:calculator/ui/view_models/calc_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final calculatorViewModel = CalcViewModel();

  test('2 ±', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('±');
    //Assert
    expect(calculatorViewModel.display, '-2');
  });

  test('2 ± ±', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('±');
    calculatorViewModel.onButton('±');
    //Assert
    expect(calculatorViewModel.display, '2');
  });

  test('2 + 2 = ', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '4');
  });

  test('2 - 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '-1');
  });

  test('2 x 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('x');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '6');
  });

  test('12 ÷ 2 = ', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('1');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('÷');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '6');
  });

  test('- 8 ÷ 2 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('8');
    calculatorViewModel.onButton('÷');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '-4');
  });

  test('2 + 2 = - 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('=');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '1');
  });

  test('2 + 2 - 3', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '1');
  });

  test('9 + - 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('9');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '6');
  });

  test('4 - + 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('4');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '7');
  });

  test('2 / x 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('/');
    calculatorViewModel.onButton('x');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '6');
  });

  test('9 + - 3 + 2 / 4 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('9');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('÷');
    calculatorViewModel.onButton('4');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '2');
  });

  test('2 / 3 + ', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('÷');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('+');
    //Assert
    expect(calculatorViewModel.display.substring(0, 10), '0.66666666');
  });

  test('8 / 2 - 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('8');
    calculatorViewModel.onButton('÷');
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('-');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '1');
  });

  test('2 + 5 x 3 =', () async {
    //Setup
    calculatorViewModel.onButton('C');
    //Act
    calculatorViewModel.onButton('2');
    calculatorViewModel.onButton('+');
    calculatorViewModel.onButton('5');
    calculatorViewModel.onButton('x');
    calculatorViewModel.onButton('3');
    calculatorViewModel.onButton('=');
    //Assert
    expect(calculatorViewModel.display, '21');
  });
}
