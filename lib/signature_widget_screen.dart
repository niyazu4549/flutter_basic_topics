import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/utiles/colors.dart';
import 'package:flutter_basic_topics/utiles/common_functions.dart';
import 'package:flutter_basic_topics/utiles/constants.dart';
import 'package:signature/signature.dart';

class SignatureWidgetScreen extends StatefulWidget {
  const SignatureWidgetScreen({super.key});

  @override
  State<SignatureWidgetScreen> createState() => _SignatureWidgetScreenState();
}

class _SignatureWidgetScreenState extends State<SignatureWidgetScreen> {
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _plantPhotosController = TextEditingController();
  final TextEditingController _reportController = TextEditingController();
  final TextEditingController _reportOneController = TextEditingController();
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _executiveNameController =
  TextEditingController();

  final SignatureController executiveSignatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

  FocusNode remarksFocusNode = FocusNode();
  FocusNode imagesFocusNode = FocusNode();
  FocusNode customerFocusNode = FocusNode();
  FocusNode executiveFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:
            const EdgeInsets.only(left: 35, right: 20, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // customer signature button
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: indigo,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(22))),
                      ),
                      onPressed: (){

                      },
                      // onPressed: () async {
                      //   remarksFocusNode.unfocus();
                      //   imagesFocusNode.unfocus();
                      //   ConstantVariables.customerSignatureImageArray =
                      //   await generateUnit8List(
                      //       controller: customerSignatureController,
                      //       context: context);
                      // },
                      child: const Text(
                        "customerSignatureButton",
                        style:
                        TextStyle( fontSize: 14),
                      ),
                    ),
                  ),
                ),
                //for spacing
                const SizedBox(
                  width: 10,
                ),
                // clear signature button
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: indigo,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(22))),
                      ),
                      onPressed: () {
                        // if (ConstantVariables
                        //     .customerSignatureImageArray !=
                        //     null &&
                        //     ConstantVariables
                        //         .customerSignatureImageArray
                        //         .toString()
                        //         .trim()
                        //         .isNotEmpty) {
                        //   ConstantVariables
                        //       .customerSignatureImageArray = "";
                        // }
                        // clearSignature(
                        //     controller: customerSignatureController);
                      },
                      child: const Text(
                        "clearSignatureButton",
                        style:
                        TextStyle( fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //text for text field
          Container(
            margin: const EdgeInsets.only(left: 45, bottom: 3),
            child: const Text(
              "textForTextField3",
              style: TextStyle(
                  color: black, fontSize: 17, ),
            ),
          ),
          //text for text field
          Container(
            margin: const EdgeInsets.only(left: 45, bottom: 15),
            child: const Text(
              "textForTextField4",
              style: TextStyle(
                  color: black, fontSize: 17, ),
            ),
          ),
          Container(
            margin:
            const EdgeInsets.only(bottom: 15, left: 35, right: 20),
            child: TextFormField(
              focusNode: executiveFocusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value!.isEmpty) {
                  return 'Please enter Executive Name';
                }
                return null;
              },
              controller: _executiveNameController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  ConstantVariables.executiveName = value;
                }
              },
              decoration:
              getInputDecoration(label: 'Enter Executive Name'),
            ),
          ),
          // report text field
          Container(
            margin:
            const EdgeInsets.only(bottom: 15, left: 35, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              border: Border.all(width: 3.0, color: Colors.indigo),
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Signature(
                height: 200,
                width: MediaQuery.of(context).size.width,
                key: const Key('signature'),
                controller: executiveSignatureController,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          // signature buttons
          Container(
            margin:
            const EdgeInsets.only(left: 35, right: 20, bottom: 40),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // executive signature button
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: indigo,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(22))),
                      ),
                      onPressed: () async {
                      },
                      child: const Text(
                        "executiveSignatureButton",
                        style:
                        TextStyle( fontSize: 14),
                      ),
                    ),
                  ),
                ),
                //for spacing
                const SizedBox(
                  width: 10,
                ),
                // clear signature button
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: indigo,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(22))),
                      ),
                      onPressed: () {
                        if (ConstantVariables
                            .executiveSignatureImageArray !=
                            null &&
                            ConstantVariables
                                .executiveSignatureImageArray
                                .toString()
                                .trim()
                                .isNotEmpty) {
                          ConstantVariables
                              .executiveSignatureImageArray = "";
                        }
                        clearSignature(
                            controller: executiveSignatureController);
                      },
                      child: const Text(
                        "clearSignatureButton",
                        style:
                        TextStyle( fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //submit and cancel buttons
          Container(
            margin:
            const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // submit button
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: orangeAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12))),
                      ),
                      onPressed: () {
                        // _submitButton();
                      },
                      child: const Text(
                        "submitButton",
                        style:
                        TextStyle( fontSize: 30),
                      ),
                    ),
                  ),
                ),
                //for spacing
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
