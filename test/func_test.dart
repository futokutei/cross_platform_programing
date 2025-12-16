import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/func.dart';


void main() {
  group('Func class tests', () {
    test('Correct calculation for x = 2', () {
      final func = Func(2);
      expect(func.y(), 4);
    });

    test('Correct calculation for x = 4', () {
      final func = Func(4);
      expect(func.y(), 1);
    });
  });
}