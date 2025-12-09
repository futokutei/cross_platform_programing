import 'package:flutter/material.dart';

class second_page extends StatelessWidget{
  const second_page({super.key, required this.title, required this.textData, required this.fontSZ});
  final String title;
  final String textData;
  final double fontSZ;

  @override
  Widget build(BuildContext context){
   return Scaffold(
     appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title, style: Theme.of(context).textTheme.titleLarge)
     ),
         body:Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Column(
                    children: <Widget>[
                      Text("$textData", style: TextStyle(fontSize: fontSZ)),
                      Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 17),
                                    child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.pop(context, "Cool!");
                                    },
                                    child: Text(
                                        "OK"
                                    )
                                )
                                ),
                                OutlinedButton(
                                    onPressed: (){
                                      Navigator.pop(context, "Let`s try something else");},
                                    child: Text("Cancel", style: Theme.of(context).textTheme.bodySmall)
                                ),
                              ]
                          )
                      )
                    ]
                )
                )
              ]
            )
         ),
   );
  }
}