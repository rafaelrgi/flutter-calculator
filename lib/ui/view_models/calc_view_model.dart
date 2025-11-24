import 'package:flutter/material.dart';

enum _Operations { none, add, subtract, multiply, divide }

class CalcViewModel extends ChangeNotifier {
  //
  String _display = '0';
  double _op1 = 0;
  _Operations _operator = _Operations.none;
  bool _insertMode = false; //as computer insert key; overwrites text of display
  bool _isError = false; //error state, like ÷0

  String get display => _display;
  String get previous => '${_format(_op1)} ${_getOperator()}';
  String get operator => _getOperator();

  //process calculator buttons dispatching the call to  the right method
  void onButton(String button) {
    //if previous state = error, clear it on any button
    if (_isError) _buttonClear();

    try {
      switch (button) {
        case 'C':
          _buttonClear();
          break;
        case 'CE':
          _buttonClearEntry();
          break;
        case '.':
          _buttonDecimal();
          break;
        case '±':
          _buttonPlusMinus();
          break;
        case '+':
          _buttonPlus();
          break;
        case '-':
          _buttonMinus();
          break;
        case '÷':
        case '/':
          _buttonDivide();
          break;
        case 'x':
          _buttonMultiply();
          break;
        case '=':
          _buttonTotal();
          break;
        //number
        default:
          _display = (_insertMode || _display == '0')
              ? button
              : _display + button;
          _insertMode = false;
      }
    } catch (e) {
      //if error, clear the calculation and tell the user
      _buttonClear();
      _display = e.toString();
      _insertMode = true;
      _isError = true;
    }

    notifyListeners();
  }

  //format number for the display
  String _format(double val) {
    var s = val.toString();
    if (s.endsWith('.0')) {
      return s.substring(0, s.length - 2);
    }
    return s;
  }

  //C: clears all
  void _buttonClear() {
    _op1 = 0;
    _display = '0';
    _operator = _Operations.none;
    _insertMode = false;
    _isError = false;
  }

  //CE: clears only the display
  void _buttonClearEntry() {
    _display = '0';
  }

  //yes, the decimal separator
  void _buttonDecimal() {
    if (_insertMode) {
      if (_op1 == 0) {
        _op1 = _getValueFromDisplay();
      }
      _display = '0.';
      _insertMode = false;
      return;
    }
    if (_display.contains('.')) return;
    _display += '.';
  }

  //invert the number in the display (positive/negative)
  void _buttonPlusMinus() {
    //-0 is weird
    if (_display == '0') return;

    if (_display.startsWith('-')) {
      _display = _display.substring(1);
    } else {
      _display = '-$_display';
    }
  }

  void _buttonPlus() {
    _doOperation(_Operations.add);
  }

  void _buttonMinus() {
    _doOperation(_Operations.subtract);
  }

  void _buttonMultiply() {
    _doOperation(_Operations.multiply);
  }

  void _buttonDivide() {
    _doOperation(_Operations.divide);
  }

  //= calculate the operation
  void _buttonTotal() {
    _doOperation(_Operations.none);
  }

  double _getValueFromDisplay() {
    if (!_display.contains(',')) {
      return double.tryParse(_display) ?? 0;
    }
    return double.tryParse(_display.replaceAll('.', '').replaceAll(',', '.')) ??
        0;
  }

  String _getOperator() {
    switch (_operator) {
      case _Operations.add:
        return '+';
      case _Operations.subtract:
        return '-';
      case _Operations.multiply:
        return 'x';
      case _Operations.divide:
        return '÷';
      case _Operations.none:
        return '';
    }
  }

  double _calculate(double op1, double op2, _Operations operator) {
    switch (operator) {
      case _Operations.add:
        return op1 + op2;
      case _Operations.subtract:
        return op1 - op2;
      case _Operations.multiply:
        return op1 * op2;
      case _Operations.divide:
        if (op2 == 0) {
          throw 'Error';
        }
        return op1 / op2;
      default:
        return 0;
    }
  }

  void _doOperation(_Operations operator) {
    //first operation?
    if (_insertMode || _operator == _Operations.none) {
      _operator = operator;
    }
    if (_insertMode) return;

    //do previous calculation from stack
    var op2 = _getValueFromDisplay();
    //x-  -y >> x - y
    if (_operator == _Operations.subtract && op2 < 0) {
      _operator = _Operations.add;
    }
    _op1 = (_op1 == 0) ? _op1 = op2 : _calculate(_op1, op2, _operator);

    //store new operation
    _operator = operator;

    //- needs special treatment, may be just a negative number beeing typed
    if (operator == _Operations.subtract) {
      _display = '-';
      _insertMode = false;
    } else {
      _display = _format(_op1);
      _insertMode = true;
    }
  }
}
