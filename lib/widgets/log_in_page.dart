import 'package:flutter/material.dart';
import '/widgets/sing_up_page.dart';
import '/widgets/reset_pass.dart';
import '/widgets/final_page.dart';


final TextEditingController _emailController = TextEditingController();
final TextEditingController _passController = TextEditingController();

class log_in_page extends StatefulWidget{
  const log_in_page({super.key});
  State<log_in_page> createState() => validateStatus();
}
class validateStatus extends State<log_in_page>{
  final _formKey = GlobalKey<FormState>();



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
                "Ввійдіть до застосунку",
              ),
            ) ,
             Form(
               key:_formKey,
               child: Column(
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
                       height: 59.0,
                       alignment: Alignment.center,
                      child: TextFormField(
                        validator: (String? value) { return value != null && RegExp('@').hasMatch(value) ? null : "Неправильний email";},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailController,
                        decoration: const InputDecoration(
                        hintText: 'Email: '
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
                  height: 59.0,
                  alignment: Alignment.center,
                    child: TextFormField(
                        validator: (String? value) { return value != null && value.length >= 7 ? null : "Неправильний пароль";},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passController,
                      decoration: const InputDecoration(
                      hintText: 'Пароль: '
                      )
                    )
                  )
                ]
            ),
             ),
            // до сіх
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child:
        Column(
            children: <Widget>[
              SizedBox(
                  width: double.infinity,
                  child:  ElevatedButton(
                      onPressed: () {
                        final isValid = _formKey.currentState?.validate();
                        if(isValid == true){
                          _buttonPress(context);
                        }
                        else if ((_emailController.text.isEmpty && _passController.text.isEmpty)|| (_passController.text.isEmpty)||(_emailController.text.isEmpty)){
                          _buttonPress(context);
                        }
                      },
                      child: const Text('Sing in')
                  )
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlinedButton(
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
                    OutlinedButton(
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
        content: Text(
            'Будь ласка, заповніть усі поля.',
          style: Theme.of(context).textTheme.bodySmall,
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
        content: Text('Будь ласка, введіть вашу електронну пошту.', style: Theme.of(context).textTheme.bodySmall,),
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
        content: Text('Будь ласка, введіть ваш пароль.', style: Theme.of(context).textTheme.bodySmall,),
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
          builder: (context) => yappy(),
        ),
      );
    };
  }
