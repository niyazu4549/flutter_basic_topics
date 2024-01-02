import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';
import 'package:flutter_basic_topics/utiles/common_functions.dart';
import 'package:flutter_basic_topics/utiles/constants.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  FocusNode imagesFocusNode = FocusNode();
  final TextEditingController _plantPhotosController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();


  XFile? imageFile;
  XFile? videoFile;
  bool enableAudio = true;
  File? image;
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

// Camera Functionality
  void pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, maxWidth: 300, maxHeight: 300);
      if (image == null) return;
      this.image = File(image.path);
      print('image test');
      if (this.image != null) {
        File file = await compressFile(this.image!);
        List<int> bytes = await file.readAsBytesSync();
        ConstantVariables.selectedImages.add(base64Encode(bytes));
        ConstantVariables.selectedImages =
            ConstantVariables.selectedImages.reversed.toList();
        _plantPhotosController.text = this.image!.path.toString();
        setState(() {});
      }
    } on PlatformException catch (e) {
      print('Failed to pic image: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //logo image and top text
          Container(
            margin:
            const EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                //logo image
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const SearchPlantScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 45),
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/call.png"),
                  ),
                ),
                //top text
                const Text(
                  'RO Plant Report',
                  style: TextStyle(
                      color: indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          // remarks text field
          Container(
            margin:
            const EdgeInsets.only(bottom: 15, left: 35, right: 20),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value!.isEmpty) {
                  return 'Please enter Remarks';
                }
                return null;
              },
              controller: _remarksController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  ConstantVariables.remarks = value;
                }
              },
              decoration: getInputDecoration(label: 'Enter Remarks'),
            ),
          ),
          // plant photos text field
          ConstantVariables.selectedImages.isNotEmpty
              ? Container(
            height: 100,
            margin: const EdgeInsets.only(
                bottom: 10, left: 35, right: 20),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (int i = 0;
                  i < ConstantVariables.selectedImages.length;
                  i++)
                    Card(
                        margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(18))),
                        child: Image.memory(base64Decode(
                            ConstantVariables.selectedImages[i])))
                ],
              ),
            ),
          )
              : Container(),
          Container(
            margin:
            const EdgeInsets.only(bottom: 10, left: 35, right: 20),
            child: TextFormField(
              focusNode: imagesFocusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {},
              onTap: () {
                pickImage(ImageSource.camera);
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please select the image';
                }
                return null;
              },
              controller: _plantPhotosController,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(22),
                ),
                fillColor: white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: indigo, width: 2.0),
                  borderRadius: BorderRadius.circular(22),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: indigo, width: 2.0),
                  borderRadius: BorderRadius.circular(22),
                ),
                hintText: "plantPhotos",
                hintStyle: const TextStyle(
                    color: grey, fontSize: 14),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: indigo,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            pickImage(ImageSource.camera);
                          },
                          child: const Icon(Icons.camera_alt,
                              color: white, size: 23))),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
