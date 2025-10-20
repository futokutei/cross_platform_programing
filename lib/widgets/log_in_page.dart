import 'package:flutter/material.dart';
import '/widgets/sing_up_page.dart';
import '/widgets/reset_pass.dart';
import '/widgets/final_page.dart';


final TextEditingController _emailController = TextEditingController();
final TextEditingController _passController = TextEditingController();

class log_in_page extends StatelessWidget{
  const log_in_page({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/img/logo.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                )
                ),
              ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 35.0, 0, 20.0),
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'Calibri',
                ),
                "Ввійдіть до застосунку",
              ),
            ) ,
             Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 3.0,
                          )
                       ),
                       height: 55.0,
                       alignment: Alignment.center,
                      child: TextFormField(

                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Email: ',
                        contentPadding: EdgeInsets.only(left: 16),


                      border: InputBorder.none,

                    ),
                  ),
                 ),
                  Container(
                      margin: EdgeInsets.only(top: 15.0),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                        border: Border.all(
                        color: Colors.grey,
                        width: 3.0,
                       )
                    ),
                  height: 55.0,
                  alignment: Alignment.center,
                    child: TextFormField(

                      controller: _passController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                      hintText: 'Пароль: ',
                      contentPadding: EdgeInsets.only(left: 16),

                      border: InputBorder.none,
                      )
                    )
                  )
                ]
            ),
            // до сіх
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xD11d2025),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 100,
        child:
        Column(
            children: <Widget>[
              SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                      onPressed: () {
                        _buttonPress(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text('Sing in')
                  )
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.blue, width: 2.0),
                          minimumSize: Size(188, 37),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const sing_up_page(),
                            ),
                          )
                        },
                        child: const Text('Sing up')
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.blue, width: 2.0),
                          minimumSize: Size(188, 37),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const reset_pass(),
                            ),
                          )
                        },
                        child: const Text('Reset password')
                    )
                  ]
              )
            ]
        ),
      ),
    );
  }
}

void _buttonPress(BuildContext context){
  if (_emailController.text.isEmpty && _passController.text.isEmpty){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Помилка"),
        content: const Text(
            'Будь ласка, заповніть усі поля.',
          style: TextStyle(color: Colors.black)
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  else if (_emailController.text.isEmpty){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Помилка"),
        content: const Text('Будь ласка, введіть вашу електронну пошту.', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  else if (_passController.text.isEmpty){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Помилка"),
        content: const Text('Будь ласка, введіть ваш пароль.', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const yappy(),
        ),
      );
    };
  }
