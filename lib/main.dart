import 'package:flutter/material.dart';
import "widgets/first_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:TextTheme(
            bodyLarge: TextStyle(color: Colors.black,fontSize: 16,
              fontFamily: 'Calibri',),
            bodyMedium: TextStyle(color: Colors.black,fontSize: 22,
              fontFamily: 'Calibri',
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(color: Colors.black,fontSize: 14,
              fontFamily: 'Calibri',),
            titleLarge: TextStyle(color: Colors.black,fontSize: 26,
              fontFamily: 'Calibri'),
            titleMedium: TextStyle(color: Colors.black, fontSize: 16,
              fontFamily: 'Calibri',),
            titleSmall: TextStyle(color: Colors.black,fontSize: 14,)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(color: Colors.purple, width: 2.0),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationThemeData(
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.only(left: 16),
          border: OutlineInputBorder(),
        ),
        useMaterial3: true,
      ),
      home: const first_page(title: 'Text previewer'),
    );
  }
}
