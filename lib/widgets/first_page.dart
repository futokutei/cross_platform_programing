import 'package:flutter/material.dart';
import '/widgets/second_page.dart';

class first_page extends StatefulWidget {
  const first_page({super.key, required this.title});
  final String title;

  State<first_page> createState() => _fontSizeChange();
}

class _fontSizeChange extends State<first_page> {
  final TextEditingController _textData = TextEditingController();
  double _fontSize = 14;
  int textfontSize = 0;
  fontChange(double value){
    setState((){
      _fontSize = value;
      textfontSize = _fontSize.toInt();
    });
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge)
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _textData,
                        decoration: const InputDecoration(
                          helperText: 'Enter some text',
                          labelText: "Text",
                        )
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                               "Font size: $textfontSize",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Expanded(
                                child: Slider(
                                  min: 10,
                                  max: 100,
                                  value: _fontSize,
                                  onChanged:fontChange,
                                )
                              )
                            ]
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: ElevatedButton(
                                onPressed: ()async {final res = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => second_page(
                                      title: "Previewer",
                                      textData: _textData.text,
                                      fontSZ: _fontSize,
                                    ),
                                  ),
                                );
                                if (res != null){
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext ctx){
                                      return AlertDialog(
                                          title: Image.network('https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090', width: 100, height: 100),
                                          content: Text(res, textAlign: TextAlign.center),
                                          actions:<Widget>[
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed:() => Navigator.of(ctx).pop(),
                                            ),
                                          ]
                                      );
                                    },
                                  );
                                }
                                else {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext ctx){
                                      return AlertDialog(
                                          title: Image.network('https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090', width: 100, height: 100),
                                          content: Text("Don`t know what to say", textAlign: TextAlign.center),
                                          actions:<Widget>[
                                            TextButton(
                                              child: Text("OK"),
                                              onPressed:() => Navigator.of(ctx).pop(),
                                            ),
                                          ]
                                      );
                                    },
                                  );
                                  }
                                },
                                child: Text(
                                    "Preview"
                                )
                            )
                          )
                        ]
                      )
                    )
                    ],
                )
          )
    );
  }
}
