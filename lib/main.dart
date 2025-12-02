import 'package:flutter/material.dart';
import 'widgets/log_in_page.dart';

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
        scaffoldBackgroundColor: Color(0xFF1d2025),
        textTheme:TextTheme(
          bodyLarge: TextStyle(color: Colors.white,fontSize: 16,
            fontFamily: 'Calibri',),
          bodyMedium: TextStyle(color: Colors.white,fontSize: 22,
            fontFamily: 'Calibri',),
          bodySmall: TextStyle(color: Colors.black,fontSize: 14,
            fontFamily: 'Calibri',),
          titleLarge: TextStyle(color: Colors.white, fontSize: 14,
            fontFamily: 'Calibri',),
          titleMedium: TextStyle(color: Colors.white, fontSize: 16,
            fontFamily: 'Calibri',),
          titleSmall: TextStyle(color: Colors.black,fontSize: 14,)
        ),
        bottomAppBarTheme: BottomAppBarThemeData(
            color: Color(0xD11d2025),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 100,
        ) ,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
        side: BorderSide(color: Colors.blue, width: 2.0),
        minimumSize: Size(188, 37),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      ),
        inputDecorationTheme: InputDecorationThemeData(
            hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.only(left: 16),
          border: InputBorder.none,
        ),
        useMaterial3: true,
      ),
      home: const log_in_page(),
    );
  }
}


