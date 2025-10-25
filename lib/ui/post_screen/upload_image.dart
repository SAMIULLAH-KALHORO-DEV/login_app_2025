import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:login_app_2025/widgets/round_botton.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? _image;
  final picker = ImagePicker();

  Future getImageGallary() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 40);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        Utils().toastMessage('Select Image');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  getImageGallary();
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  height: 200,
                  width: 200,
                  child: _image != null ? Image.file(_image!.absolute) : Icon(Icons.image),
                ),
              ),
            ),
            SizedBox(height: 30),
            RoundBotton(title: 'Upload', height: 50, ontap: () {}),
          ],
        ),
      ),
    );
  }
}
