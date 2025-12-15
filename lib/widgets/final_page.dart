import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class yappy extends StatefulWidget {
  @override
  _yappy createState() => _yappy();
}

class _yappy extends State<yappy> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('sounds/yippee_2.flac'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _playSound,
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
