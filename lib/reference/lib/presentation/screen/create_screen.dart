import 'dart:developer';
import 'dart:io';

import 'package:db_demo/core/db/db.dart';
import 'package:db_demo/core/utility.dart';
import 'package:db_demo/presentation/screen/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  ImagePicker _picker = ImagePicker();
  File? selectedImage;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final ageController = TextEditingController();
  void _validateForm() {
    final validate = _formKey.currentState!.validate();
    if (validate) {
      return;
    } else {
      'Please enter a valid data';
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DisplayScreen()));
        }),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: ((String? value) {
                        if (value!.length <= 1) {
                          return 'please enter a valid name';
                        }
                      }),
                    ),
                    TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        hintText: 'UserName',
                      ),
                      validator: ((String? value) {
                        if (value!.length <= 1) {
                          return 'please enter a valid name';
                        }
                      }),
                    ),
                    TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        hintText: 'Age',
                      ),
                      validator: ((String? value) {
                        if (value!.length <= 1) {
                          return 'please enter a valid name';
                        }
                      }),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  String imgStrng =
                      Utility.base64String(selectedImage!.readAsBytesSync());
                  _validateForm();
                  AppDatabase().insertNewItem(Item(
                    name: nameController.text,
                    // userName: userNameController.text,
                    age: int.parse(ageController.text),
                    userName: imgStrng,
                  ));
                },
                child: const Text('Submit'),
              ),
              MaterialButton(
                onPressed: () async {
                  var status = await Permission.camera.status;
                  log(status.toString());
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  final File file = File(pickedFile!.path);
                  selectedImage = file;
                },
                child: const Text('Upload Image'),
              ),
            ],
          ),
        ));
  }
}
