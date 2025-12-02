import 'package:flutter/material.dart';
import '/widgets/final_page.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passController = TextEditingController();
final TextEditingController _nameController = TextEditingController();

class sing_up_page extends StatelessWidget{
  const sing_up_page({super.key});

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
                  "Реєстрація",
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

                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: "Ім'я: ",
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

                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email: ',
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
                              hintText: 'Пароль: ',
                            )
                        )
                    )
                  ]
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
                        _buttonPress(context);
                      },
                      child: const Text('Sing up')
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
  if (_emailController.text.isEmpty && _passController.text.isEmpty && _nameController.text.isEmpty){
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
  else if (_nameController.text.isEmpty){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Помилка"),
        content: Text("Будь ласка, введіть вашe ім'я.", style: Theme.of(context).textTheme.bodySmall,),
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