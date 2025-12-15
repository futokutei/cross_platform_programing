import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/data_provider.dart';

class w01 extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    final provider = Provider.of<DataProvider>(context);
    return Column(
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(provider.leftUpAngle),
              topRight: Radius.circular(provider.rightUpAngle),
              bottomLeft: Radius.circular(provider.leftDownAngle),
              bottomRight: Radius.circular(provider.rightDownAngle),
                ),
              )
            )
          ]
        );
    }
}