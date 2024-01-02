import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';
import 'package:flutter_basic_topics/utiles/constants.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';


Map<String, String>? getHeaders = {
  'Content-Type': 'application/json; charset=UTF-8',
};

//Display Toast Messege
// void displayToastMessage({required String message}) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

//Alert Dialog
showAlertDialog(BuildContext context, String title, String content,
    {String error = 'success'}) {
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 16.0,
      ),
    ),
    content: Row(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(width: 20),
        Text(
          content,
          style: TextStyle(
            color: error == "success" ? Colors.green : Colors.red,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

InputDecoration getInputDecoration({
  String? label,
  VoidCallback? onTap,
  IconData? suffixIcon,
  IconData? prefixIcon,
}) {
  return InputDecoration(
      suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            suffixIcon,
            color: greyColor,
            size: 20,
          )),
      prefixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            prefixIcon,
            color: greyColor,
            size: 22,
          )),
      isDense: true,
      filled: true,
      enabled: true,
      hintText: label,
      hintStyle:
          const TextStyle(color: greyColor, fontSize: 16, fontFamily: "Medium"),
      fillColor: white,
      isCollapsed: true,
      contentPadding: const EdgeInsets.all(10),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: grey, width: 0.2),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: red, width: 0.2),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: red, width: 0.2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: grey, width: 0.2),
      ));
}

//renderinglist
// int selectedIndex = 0;
//
// List<RenderWidgetModel> getRenderList({required VoidCallback? widgetRender}) {
//   List<RenderWidgetModel> renderScreenWidgetList = [
//     RenderWidgetModel(DashBoardScreen(
//       widgetBody: widgetRender,
//     )),
//     RenderWidgetModel(const InBoundTicketsScreen()),
//     RenderWidgetModel(const AddUsersScreen()),
//     RenderWidgetModel(const Screen3()),
//   ];
//   return renderScreenWidgetList;
// }

String getCurrentDatetime() {
  return DateFormat("dd-MM-yyyy").format(DateTime.now());
}

Image getImage(String bytes) {
  return Image.memory(base64Decode(bytes));
}

Widget loadNetworkImage(src) {
  return Image.network(src);
}

Future<File> compressFile(File file) async {
  File compressedFile = await FlutterNativeImage.compressImage(
    file.path,
    quality: 70,
  );
  return compressedFile;
}

void clearSignature({required SignatureController controller}) {
  controller.clear();
}

//by using this function we will able to generate unit8list array from signature widget
Future<String?> generateUnit8List(
    {required SignatureController controller,
      required BuildContext context}) async {
  showAlertDialog(context, 'please wait', 'loading..');
  Uint8List? unit8ListArray;
  if (controller.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        key: Key('snackbarPNG'),
        content: Text('No content'),
      ),
    );
    return null;
  }

  unit8ListArray = await controller.toPngBytes();

  String base64String = base64Encode(unit8ListArray!);
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      key: Key('success'),
      content: Text('Data Saved Successfully'),
    ),
  );
  Navigator.pop(context);
  return base64String;
}

//by using this function we will able to clear all default stored variables data
void resetRoPlantDefaults() {
  ConstantVariables.remarks = '';
  ConstantVariables.selectedImages.clear();
  if (ConstantVariables.customerSignatureImageArray != null &&
      ConstantVariables.customerSignatureImageArray
          .toString()
          .trim()
          .isNotEmpty) {
    ConstantVariables.customerSignatureImageArray = "";
  }
  if (ConstantVariables.executiveSignatureImageArray != null &&
      ConstantVariables.executiveSignatureImageArray
          .toString()
          .trim()
          .isNotEmpty) {
    ConstantVariables.executiveSignatureImageArray = "";
  }
}