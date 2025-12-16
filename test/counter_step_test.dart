import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab15/main.dart';


void main() {
  testWidgets('Counter increments by correct step', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);
  });
}