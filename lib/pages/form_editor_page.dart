import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formlite/widgets/icon_textinput_field.dart';

class FormEditorPage extends StatefulWidget {
  const FormEditorPage({super.key});

  @override
  State<FormEditorPage> createState() => _FormEditorPageState();
}

const yourJsonString = '''
{
  "type": "row",
  "children": [
    {
      "type": "column", 
      "children": [
        {"type": "widget", "hint": "Nested 111", "id": "nested1"},
        {"type": "widget", "hint": "Nested 222", "id": "nested2"}
      ]
    },
   
    {
      "type": "column",
      "children": [
        {"type": "widget", "hint": "Nested 333",  "id": "nested3"},
        {"type": "row", "children":[
          {"type": "widget", "hint": "Nested 444", "id": "nested4"},
          {"type": "widget", "hint": "Nested 555", "id": "nested5"}
        ]}
      ]
    }
  ]
}
''';

var fieldData = {};
var dataRetreiver = '';

TextEditingController dataRetreiverController = TextEditingController();

class _FormEditorPageState extends State<FormEditorPage> {
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

  Widget buildWidget(dynamic data) {
    if (data is List) {
      // If data is a List, create a Column with nested children
      return Column(
        children: data.map((item) => buildWidget(item)).toList(),
      );
      // return SizedBox();
    } else if (data is Map && data.containsKey('type')) {
      // If data is a Map and contains a 'type' field, create corresponding widget
      switch (data['type']) {
        case 'row':
          return Container(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: (data['children'] as List)
                  .map((item) => Expanded(child: buildWidget(item)))
                  .toList(),
            ),
          );
        case 'column':
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: (data['children'] as List)
                  .map((item) => buildWidget(item))
                  .toList(),
            ),
          );
        case 'widget':
          var (actualField, controller) =
              addTextField(data['id'], data['hint']);
          fieldData[data['id']] = controller;

          return actualField;
        // Add more cases for other widget types as needed
        default:
          return const SizedBox(); // Return an empty widget if type is not recognized
      }
    } else {
      return const SizedBox(); // Return an empty widget if data type is not recognized
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Container(
              color: Colors.blueGrey.shade100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dataRetreiver =
                                fieldData[dataRetreiverController.text]!.text;
                          });
                        },
                        child: const Text('Get Data')),
                    IconTextInputField(
                        controller: dataRetreiverController,
                        hintText: 'Enter the ID of the field'),
                    Text('Retrieved Data: $dataRetreiver')
                  ],
                ),
              ),
            )),
            Flexible(
              flex: 3,
              child: SingleChildScrollView(
                child: buildWidget(json.decode(yourJsonString)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
