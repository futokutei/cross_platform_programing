import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class Native_User extends StatefulWidget{
  const Native_User({super.key,});

  State<Native_User> createState() => native_user();

}


class NativeCodeService {
  static const MethodChannel _channel = MethodChannel('com.example/lab14');

  static Future<String?> getNativeData() async {
    final String? nativeData = await _channel.invokeMethod('getNativeData');
    return nativeData;
  }
}
Future<String?> getTime() async {
  final time = await NativeCodeService.getNativeData();
  return time;
}


class native_user extends State<Native_User>{

  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70, // зменшення розміру
    );
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 400,
                        width: 400,
                        child:
                        _image != null
                            ? Image.file(
                          _image!,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                            : const Text('Фото ще не зроблено'),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: 75,
                        height: 75,
                        child:
                        ElevatedButton(
                          onPressed: _takePhoto,
                          child: const Icon(Icons.camera),
                        ),
                      ),
                      FutureBuilder<String?>(
                        future: getTime(), // ⟵ чекаємо тут
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final time = snapshot.data ?? "No time";
                            return Text(time,
                              style: TextStyle(fontSize: 18),
                            );
                          }
                        },
                      ),

                    ]
                )
            )
        )
    );
  }
}

