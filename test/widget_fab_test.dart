import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab15/main.dart';


void main() {
  testWidgets('FloatingActionButton with person icon exists', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.byIcon(Icons.person),
      findsOneWidget,
    );
  });
}