import 'package:flutter/material.dart';
import '/repo/records.dart';
import 'package:provider/provider.dart';
import 'w2.dart';

final TextEditingController _textController = TextEditingController();
class w1 extends StatefulWidget{
  w1({super.key});

  @override
  State<w1> createState() => _W1();

}

class _W1 extends State<w1>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<RecordsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child:
          Column(
            children:<Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Expanded(
                      child:
                    Container(
                    child:
                      Form(
                        key: _formKey,
                        child:
                        TextFormField(
                          validator: (String? value) {if (value == null || value.isEmpty){return "Помилка. Порожнє значення";}else{return null;}},
                          autovalidateMode: AutovalidateMode.disabled,
                          controller: _textController,
                        )
                      )
                  )
                  ),

                  ElevatedButton(
                    onPressed: (){final isValid = _formKey.currentState?.validate(); if (isValid == true){provider.add(_textController.text);}},
                    child: Text(
                      "Add"
                            )
                          ),
                        ]
                      ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 7.0),
                        child: w2()
                    ),
                    ]
                  )
    );
  }
}
