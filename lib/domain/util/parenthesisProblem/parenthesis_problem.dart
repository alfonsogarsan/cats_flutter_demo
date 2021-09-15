import 'dart:math';

import 'package:cats/domain/util/parenthesisProblem/stack.dart';
import 'package:cats/domain/util/parenthesisProblem/symbol_pair.dart';

const maxNumberOfPairsInPassword = 10;

final List<SymbolPair> symbolPairs = [
  SymbolPair(openSymbol: "(", closeSymbol: ")"),
  SymbolPair(openSymbol: "[", closeSymbol: "]"),
  SymbolPair(openSymbol: "{", closeSymbol: "}"),
];

String generateValidParenthesisProblemString() {
  ///We store the password here while we generating and validating the symbols
  StringBuffer passwordBuffer = new StringBuffer();

  /// We can validate the whole process against a Stack
  Stack<SymbolPair> stack = Stack<SymbolPair>();

  int pairsInPassword = Random().nextInt(maxNumberOfPairsInPassword + 1);
  int passwordLength = 2 * pairsInPassword;

  int remainingLength = passwordLength - passwordBuffer.length;

  ///Do while our password is shorter than predefined password length
  while (remainingLength > 0) {
    if (stack.count == 0) {
      /// Must choose an open symbol
      _chooseOpenSymbol(stack, passwordBuffer);
    } else if (remainingLength == stack.count) {
      /// Must choose a close symbol
      _chooseCloseSymbol(stack, passwordBuffer);
    } else {
      /// Can choose both new open symbol or close one
      Random().nextBool()
          ? _chooseOpenSymbol(stack, passwordBuffer)
          : _chooseCloseSymbol(stack, passwordBuffer);
    }
    remainingLength = passwordLength - passwordBuffer.length;
  }

  return passwordBuffer.toString();
}

void _chooseOpenSymbol(Stack<SymbolPair> stack, StringBuffer passwordBuffer) {
  SymbolPair pair = symbolPairs[Random().nextInt(3)];
  stack.push(pair);
  passwordBuffer.write(pair.openSymbol);
}

void _chooseCloseSymbol(Stack<SymbolPair> stack, StringBuffer passwordBuffer) {
  passwordBuffer.write(stack.pop().closeSymbol);
}
