import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loyverse_demo/core/utitility/utillity.dart';
import 'package:loyverse_demo/db/db.dart';
import 'package:loyverse_demo/main.dart';
import 'package:loyverse_demo/presentation/bloc/item_bloc.dart';
import 'package:loyverse_demo/presentation/widgets/text_form_field_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateItemScreen extends StatefulWidget {
  static const routeName = '/CreateItemScreen';
  const CreateItemScreen({Key? key}) : super(key: key);

  @override
  State<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final skuController = TextEditingController();
  final barcodeController = TextEditingController();
  final pageController = PageController();
  String dropdownValue = 'No Category';
  int radioGroupValue = 0;
  ImagePicker picker = ImagePicker();
  XFile? imagePick;
  String soldBy = '';
  File? imageFile;

  int val = -1;
  bool switchValue = false;
  int selected = 0;
  List<MaterialColor> colorList = [
    Colors.grey,
    Colors.red,
    Colors.pink,
    Colors.amber,
    Colors.lightGreen,
    Colors.green,
    Colors.blue,
    Colors.indigo,
  ];

  List checkItemShape = [
    {
      "id": 0,
      "Value": false,
      "shape": 'Square',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<void> requestCameraPermission() async {
    final serviceStatus = await Permission.camera.isGranted;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildScreen1(),
      buildScreen2(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Create Items'),
        actions: [
          MaterialButton(
            onPressed: () async {
              final validate = _formKey.currentState!.validate();
              if (validate == null) {
                return;
              }
              String? imgStrng;
              if (radioGroupValue == 1) {
                imgStrng = Utility.base64String(imageFile!.readAsBytesSync());
              }
              final item = Item(
                  name: nameController.text,
                  price: int.parse(priceController.text),
                  soldBy: soldBy,
                  barCode: barcodeController.text,
                  category: dropdownValue,
                  sku: int.parse(skuController.text),
                  photo: radioGroupValue == 1
                      ? imgStrng == null || imgStrng == ''
                          ? '0'
                          : imgStrng
                      : '0',
                  avatar: selected);
              BlocProvider.of<ItemBloc>(context)
                  .add(CreateItemsEvent(item: item));

              _formKey.currentState!.save();
              nameController.clear;
              barcodeController.clear();
              dropdownValue = '';
              skuController.clear();
              priceController.clear();
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: BlocConsumer<ItemBloc, ItemState>(
        listener: (context, state) {
          if (state is CreateItemsLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Successfully Added')));
          }
        },
        builder: (context, state) {
          if (state is CreateItemsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Material(
                  elevation: 3,
                  // color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormWidget(
                            nameController: nameController,
                            labelText: 'Name',
                            errorText: '',
                            validatorFunction: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid Name!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButtonFormField<String>(
                            // value: dropdownValue,
                            items: <String>[
                              'No categories',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Sold by'),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: const Text('Each'),
                            leading: Radio(
                                value: 1,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    soldBy = 'Each';
                                    val = value as int;
                                  });
                                }),
                          ),
                          ListTile(
                            title: const Text('Weight'),
                            leading: Radio(
                                value: 2,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    soldBy = 'Weight';
                                    val = value as int;
                                  });
                                }),
                          ),
                          TextFormWidget(
                            nameController: priceController,
                            labelText: 'Price',
                            errorText: '',
                            validatorFunction: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid Price!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormWidget(
                            nameController: skuController,
                            labelText: 'Sku',
                            errorText: '',
                            validatorFunction: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid sku!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormWidget(
                            nameController: barcodeController,
                            labelText: 'Barcode',
                            errorText: '',
                            validatorFunction: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid Barcode ID!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Material(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Inventory',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      ListTile(
                        title: const Text('Track Stock '),
                        trailing: CupertinoSwitch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                          // activeTrackColor: Colors.green,
                          // trackColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Representation on POS',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Radio(
                                value: 0,
                                groupValue: radioGroupValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    radioGroupValue = value!;
                                  });
                                  pageController.jumpToPage(value!);
                                }),
                            const Text('Color and Shape'),
                            const SizedBox(width: 20),
                            Radio(
                                value: 1,
                                groupValue: radioGroupValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    radioGroupValue = value!;
                                  });
                                  pageController.jumpToPage(value!);
                                }),
                            const Text('Image'),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: PageView.builder(
                            controller: pageController,
                            itemCount: pages.length,
                            itemBuilder: (context, index) => pages[index],
                            onPageChanged: (int value) {
                              radioGroupValue = value;
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildScreen1() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: checkListItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) => Container(
        color: colorList[index],
        child: Transform.scale(
          scale: 3,
          child: Checkbox(
            fillColor: MaterialStateProperty.all(colorList[index]),
            checkColor: Colors.white,
            value: checkListItems[index]['value'],
            onChanged: (value) {
              setState(
                () {
                  for (var element in checkListItems) {
                    element["value"] = false;
                  }
                  checkListItems[index]["value"] = value;
                  selected = checkListItems[index]["id"];
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildScreen2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: imageFile != null
                  ? DecorationImage(
                      image: FileImage(imageFile!),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // requestCameraPermission();
                    // image = await picker.pickImage(source: ImageSource.gallery);
                    final status = await Permission.camera.status;
                    if (status.isGranted) {
                      final image =
                          await picker.pickImage(source: ImageSource.gallery);
                      final File file = File(image!.path);
                      // imagePick =  ;
                      imageFile = file;
                    }
                    if (status.isDenied) {
                      Permission.camera.request();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Camera Permission Required'),
                          content: const Text(
                              'It is neccesary to obtain permission for camera to take pictures using camera or pick images from gallery'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Deny'),
                            ),
                            MaterialButton(
                              onPressed: () {
                                openAppSettings();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Settings'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Pick From Gallery'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.camera.status;
                    if (status.isGranted) {
                      final image =
                          await picker.pickImage(source: ImageSource.gallery);
                      // imagePick = image;
                      final file = File(image!.path);
                      imageFile = file;
                    }
                    if (status.isDenied) {
                      Permission.camera.request();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Camera Permission Required'),
                          content: const Text(
                              'It is neccesary to obtain permission for camera to take pictures using camera or pick images from gallery'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Deny'),
                            ),
                            MaterialButton(
                              onPressed: () {
                                openAppSettings();
                              },
                              child: const Text('Settings'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Pick From Camera'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
