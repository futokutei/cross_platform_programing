import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';



class yappy extends StatelessWidget{
  const yappy({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _audioPlay,
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/img/yappy.jpg"),

                    )
                )
            )
        )
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xD11d2025),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 100,
        child:
        Column(
            children: <Widget>[ SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                      onPressed: () => {
                        Navigator.pop(context)
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.blue, width: 2.0),
                        minimumSize: Size(188, 37),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text('Back')
                  )
              ),
        ]
        ),
      ),
    );
  }
}
final player = AudioPlayer();
Future<void> _audioPlay() async {
  await player.play(AssetSource("sounds/yippee_2.mp3"));

}