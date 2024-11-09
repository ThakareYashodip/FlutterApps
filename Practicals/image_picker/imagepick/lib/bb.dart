import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  File? _selectedImage;

  Future _imagePicker() async {

    //final ImagePicker picker = ImagePicker();
      final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    //final XFile? returnImage = await picker.pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      setState(() {
        _selectedImage = File(returnImage.path);
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Demo'),
      ),
      body: Center(
        child: _selectedImage != null
            ? Image.file(_selectedImage!, height: 400, width: 400)
            : const Text('No image selected'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _imagePicker,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_photo_alternate),
      ),
    );
  }
}