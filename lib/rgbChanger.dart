import 'package:flutter/material.dart';

class rgbChanger extends StatefulWidget{
  State<rgbChanger> createState() => _rgbChanger();
}

class _rgbChanger extends State<rgbChanger>{
  int _red = 102;
  int _green = 48;
  int _blue = 36;
  int _alpha = 255;
  double _sliderValueRed = 102;
  double _sliderValueGreen = 48;
  double _sliderValueBlue = 36;
  double _sliderValueAlpha = 255;

  _changeRed(double value){
    setState((){
      _sliderValueRed = value;
      _red = value.toInt();
    });
  }
  _changeBlue(double value){
    setState((){
      _sliderValueBlue = value;
      _blue = value.toInt();
    });
  }
  _changeGreen(double value) {
    setState(() {
      _sliderValueGreen = value;
      _green = value.toInt();
    });
  }
    _changeAlpha(double value){
      setState((){
        _sliderValueAlpha = value;
        _alpha = value.toInt();
      });
    }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Center(
                child: Column(
                  children:<Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 35.0, 0, 20.0),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color.fromARGB(_alpha, _red, _green, _blue),
                    ),
                  ),
                  Row(
                      children:<Widget>[
                        Text(
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Calibri',
                          ),
                          "Червоний"
                        ),
                        Expanded(
                          child:Slider(
                            value: _sliderValueRed,
                            min: 0,
                            max: 255,
                            onChanged: _changeRed,
                            activeColor: Color(0xFFFF0000),
                          ),
                        ),
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "$_red"
                        ),
                      ]
                    ),
                  Row(
                      children:<Widget>[
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "Зелений"
                        ),
                        Expanded(
                         child: Slider(value: _sliderValueGreen,
                            min: 0,
                            max: 255,
                            onChanged: _changeGreen,
                           activeColor: Color(0xFF00FF00),
                        ),
                    ),
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "$_green"
                        ),
                    ]
                  ),
                  Row(
                      children:<Widget>[
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "Синій"
                        ),
                        Expanded(
                          child: Slider(value: _sliderValueBlue,
                            min: 0,
                            max: 255,
                            onChanged: _changeBlue,
                            activeColor: Color(0xFF0000FF),
                          ),
                        ),
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "$_blue"
                        ),
                    ]
                  ),
                  Row(
                      children:<Widget>[
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "Альфа-канал"
                        ),
                        Expanded(
                          child: Slider(value: _sliderValueAlpha,
                            min: 0,
                            max: 255,
                            onChanged: _changeAlpha,
                          ),
                        ),
                        Text(
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Calibri',
                            ),
                            "$_alpha"
                        ),
                    ]
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}
