import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab15/main.dart';

void main() {
  testWidgets('Text widget with correct pattern exists', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.text("IPZS-21: Olexander`s last Flutter App"),
      findsOneWidget,
    );
  });
}