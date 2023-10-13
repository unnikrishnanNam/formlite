import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:formlite/widgets/icon_textinput_field.dart';

List<Widget> acceptedData = [];

Widget layout = ListView.builder(
  itemCount: acceptedData.length,
  itemBuilder: (context, index) {
    return acceptedData[index];
  },
);

class ViewportV1 extends StatefulWidget {
  const ViewportV1({super.key, required this.data});
  final String data;

  @override
  State<ViewportV1> createState() => _ViewportV1State();
}

class _ViewportV1State extends State<ViewportV1> {
  // Essential Variables
  var fieldData = {};

  // Add TextField
  (Widget, TextEditingController) addTextField(String id, String hintText) {
    final TextEditingController controller =
        TextEditingController(text: hintText);
    return (
      IconTextInputField(
        controller: controller,
        hintText: hintText,
      ),
      controller,
    );
  }

  // // Recursive Builder
  @override
  Widget build(BuildContext context) {
    Widget layout = ListView.builder(
      itemCount: acceptedData.length,
      itemBuilder: (context, index) {
        return acceptedData[index];
      },
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: DottedBorder(
            strokeCap: StrokeCap.round,
            strokeWidth: 2,
            dashPattern: const [10, 10],
            color: const Color(0xFFA3A7BA),
            borderType: BorderType.RRect,
            radius: const Radius.circular(6),
            padding: const EdgeInsets.all(6),
            child: Center(
              child: DragTarget<Widget>(
                onAccept: (data) => setState(() {
                  acceptedData.add(data);
                }),
                builder: (BuildContext context, List<Object?> candidateData,
                    List<dynamic> rejectedData) {
                  return Container(
                      // height: 580,
                      // width: 450,
                      decoration: BoxDecoration(
                          // color: Colors.deepPurpleAccent.shade200,
                          borderRadius: BorderRadius.circular(5)),
                      child: layout);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
