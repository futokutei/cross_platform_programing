import 'package:flutter/material.dart';
import '/providers/data_provider.dart';
import 'widgets/hierarhy/w02.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Color(0xFF1d2025),
        textTheme:TextTheme(
          bodySmall: TextStyle(color: Colors.white,fontSize: 14,
            fontFamily: 'Calibri',),
        ),
        sliderTheme: SliderThemeData(
        inactiveTrackColor: Color(0xC0696969),
        activeTrackColor: Color(0xFF213073),
          thumbColor: Color(0xFF23337d),
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final dataProvider = DataProvider();

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dataProvider = DataProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChangeNotifierProvider.value(
              value: dataProvider,
              child: w02()
            ),
          ],
        ),
      ),
    );
  }
}
