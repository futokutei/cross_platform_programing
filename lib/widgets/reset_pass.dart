import 'package:flutter/material.dart';
import '/widgets/final_page.dart';

final TextEditingController _emailController = TextEditingController();

class reset_pass extends StatefulWidget{
  const reset_pass({super.key});
  State<reset_pass> createState() => validateStatus();
}

class validateStatus extends State<reset_pass>{
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
                  "Відновлення паролю",
                ),
              ) ,
              Form(
                key:_formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
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
                        validator: (String? value) { return value != null && RegExp('@').hasMatch(value) ? null : "Неправильний email";},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email: ',
                        ),
                      ),
                    ),
                  ]
              ),
              ),
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
                        else if (_emailController.text.isEmpty){
                          _buttonPress(context);
                        }
                      },
                      child: const Text('Reset')
                  )
              ),
              SizedBox(
                  width: double.infinity,
                  child:  OutlinedButton(
                      onPressed: () => {
                        Navigator.pop(context)
                      },
                      child: const Text('Back')
                  )
              ),
            ]
        ),
      ),
    );
  }
}

void _buttonPress(BuildContext context){
  if (_emailController.text.isEmpty){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Помилка"),
        content: Text(
            'Будь ласка, введіть вашу електронну пошту.',
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
  else {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => yappy(),
        ),
      );
    };
  }
