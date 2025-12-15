import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/data_provider.dart';
import 'w01.dart';

class w02 extends StatefulWidget{
  const w02({super.key});
  @override
  State<w02> createState() => _changeSlider();
}

class _changeSlider extends State<w02>{
    double _luValue = 0.0;
    double _ruValue = 0.0;
    double _rdValue = 0.0;
    double _ldValue = 0.0;

    changeLU(double value){
      setState((){
        _luValue = value;
      });
    }
    changeRU(double value){
      setState((){
        _ruValue = value;
      });
    }
    changeLD(double value){
      setState((){
        _ldValue = value;
      });
    }
    changeRD(double value){
      setState((){
        _rdValue = value;
      });
    }
    @override
    Widget build(BuildContext context){
      final provider = Provider.of<DataProvider>(context);
      return Column(
        children:<Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 70.0),
            child: w01()
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
              children: <Widget>[
                Text(
                    "┌ : ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Expanded(
                    child:
                      Slider(
                        value:_luValue,
                        min: 0,
                        max: 150,
                        onChanged:(double v){
                          changeLU(v);
                          provider.leftUpAngle = _luValue;},
                      )
                ),
                Text(
                    " ┐ : ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Expanded(child:
                    Slider(
                      value:_ruValue,
                      min: 0,
                      max: 150,
                      onChanged:(double v){
                        changeRU(v);
                        provider.rightUpAngle = v;},
                    )
                )
              ]
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
              children: <Widget>[
                Text(
                    "└ : ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Expanded(child:
                    Slider(
                      value:_ldValue,
                      min: 0,
                      max: 150,
                      onChanged:(double v){
                        changeLD(v);
                        provider.leftDownAngle = v;},
                    )
                ),
                Text(
                    " ┘ : ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Expanded(child:
                    Slider(
                      value:_rdValue,
                      min: 0,
                      max: 150,
                      onChanged:(double v){
                        changeRD(v);
                        provider.rightDownAngle = v;},
                    )
                )
              ]
          )
          )
        ]
      );
    }
}