import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class Native_User extends StatefulWidget {
  const Native_User({super.key});

  @override
  State<Native_User> createState() => _NativeUserState();
}

class NativeCodeService {
  static const MethodChannel _channel = MethodChannel('com.example/lab14');

  static Future<String?> getNativeData() async {
    final String? nativeData = await _channel.invokeMethod('getNativeData');
    return nativeData;
  }
}

class _NativeUserState extends State<Native_User> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  String _currentTime = "Завантаження...";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Запускаємо таймер, який оновлюватиме час щосекунди
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      String? time = await NativeCodeService.getNativeData();
      setState(() {
        _currentTime = time ?? "Помилка";
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // зупиняємо таймер щоб не витрачати ресурси
    super.dispose();
  }

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 400,
                width: 400,
                child: _image != null
                    ? Image.file(_image!,
                    width: 200, height: 200, fit: BoxFit.cover)
                    : const Text('Фото ще не зроблено'),
              ),
              SizedBox(height: 70, width: 70, child:
              ElevatedButton(
                onPressed: _takePhoto,
                child: const Icon(Icons.camera),
              )),
              SizedBox(height: 20),
              Text(
                _currentTime,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}