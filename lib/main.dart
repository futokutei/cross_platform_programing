import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/w1.dart';
import 'repo/records.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
            bodySmall: TextStyle(color: Colors.white,fontSize: 14,
              fontFamily: 'Calibri',),
            titleLarge: TextStyle(color: Colors.black, fontSize: 24,
              fontFamily: 'Calibri',),
            titleMedium: TextStyle(color: Colors.white, fontSize: 18,
              fontFamily: 'Calibri',),
            titleSmall: TextStyle(color: Colors.white,fontSize: 12,)
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
              borderRadius: BorderRadius.circular(9.0),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dataProvider = RecordsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
      ),
      body:SingleChildScrollView(
    padding: EdgeInsets.only(
    bottom: MediaQuery.of(context).viewInsets.bottom,
    ),child:  Center(
        child: Column(
          children: <Widget>[
            ChangeNotifierProvider.value(
                value: dataProvider,
                child: w1()
            ),
          ],
        ),
      ),
    )
    );
  }
}
