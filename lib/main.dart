import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 75.0;
const _bgColor = Colors.red;
const _borderColor = Colors.black;
const _borderWidth = 4.0;
const _borderRadius = 15.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text(widget.title)
      ),
      body: Center(
        child: Row(// замінено з Column на Row
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildTwo())
      )
    );

  }
}

List<Widget>_buildTwo(){
  return[
    _buildFrFoLine(),
    _buildScdLine(),
    _buildTrdLine(),
    _buildFrFoLine(),
  ];
}
Widget _buildSqr(){
  return Container(
    width: _size,
    height: _size,
    decoration: BoxDecoration(
      color: _bgColor,
      borderRadius: const BorderRadius.all(
      Radius.circular(_borderRadius)
      ),
      border: Border.all(
        color: _borderColor,
        width: _borderWidth,
      )
    ),
  );
}
 Widget _buildEmpty(){
  return const SizedBox(
    width: _size,
    height: _size,
  );
 }

 Widget _buildFrFoLine(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildEmpty(),
      _buildSqr(),
      _buildEmpty(),
      _buildEmpty(),
      _buildSqr(),
    ],
  );
}

Widget _buildScdLine(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildSqr(),
      _buildEmpty(),
      _buildEmpty(),
      _buildSqr(),
      _buildSqr(),
    ],
  );
}

Widget _buildTrdLine(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildSqr(),
      _buildEmpty(),
      _buildSqr(),
      _buildEmpty(),
      _buildSqr(),
    ],
  );
}