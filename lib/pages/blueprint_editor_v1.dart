import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formlite/widgets/button.dart';
import 'package:formlite/widgets/icon_textinput_field.dart';
import 'package:formlite/widgets/placeholders/colbox.dart';
import 'package:formlite/widgets/placeholders/rowbox.dart';
import 'package:formlite/widgets/placeholders/textbox.dart';
import 'package:formlite/widgets/viewport_v1.dart';
import 'package:google_fonts/google_fonts.dart';

// A class to represent a widget node in the JSON structure
class WidgetNode {
  final String type;
  final List<WidgetNode> children;
  final String hint;
  final String id;

  WidgetNode({
    required this.type,
    this.children = const [],
    this.hint = '',
    this.id = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'type': type,
      'children': children.map((child) => child.toJson()).toList(),
      'hint': hint,
      'id': id,
    };
    return json;
  }
}

class BluePrintEditorv1Page extends StatefulWidget {
  const BluePrintEditorv1Page({super.key});

  @override
  State<BluePrintEditorv1Page> createState() => _BluePrintEditorv1PageState();
}

var yourJsonString = '''
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
TextEditingController jsonStringController = TextEditingController();

class _BluePrintEditorv1PageState extends State<BluePrintEditorv1Page> {
  WidgetNode serializeWidgetToNode(Widget widget) {
    if (widget is RowBox) {
      final List<WidgetNode> childrenNodes =
          widget.children.map((child) => serializeWidgetToNode(child)).toList();
      return WidgetNode(type: 'row', children: childrenNodes);
    } else if (widget is ListView) {
      final List<WidgetNode> childrenNodes =
          acceptedData.map((child) => serializeWidgetToNode(child)).toList();
      return WidgetNode(type: 'listView', children: childrenNodes);
    } else if (widget is ColBox) {
      final List<WidgetNode> childrenNodes =
          widget.children.map((child) => serializeWidgetToNode(child)).toList();
      return WidgetNode(type: 'col', children: childrenNodes);
    } else if (widget is TextBox) {
      log(widget.controller?.text ?? '');
      return WidgetNode(type: 'textBox', hint: widget.controller?.text ?? '');
    }
    // You can add more conditions for other widgets as needed

    // If the widget doesn't match any known types, return an empty node
    return WidgetNode(type: 'empty');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: const Color(0xFFF7F7F7),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          'Blueprint Editor v1',
                          style: GoogleFonts.fredoka(
                              color: const Color(0xFF272727),
                              fontSize: 30,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      IconTextInputField(
                        hintText: '',
                        controller: TextEditingController(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 5),
                        child: Row(
                          children: [
                            Flexible(
                              child: Button(
                                text: 'Save',
                                onTap: () {
                                  setState(() {
                                    // yourJsonString = jsonStringController.text;
                                    // log('yourJsonString: $yourJsonString');
                                    serializeWidgetToNode(layout);
                                    final serializedLayout =
                                        serializeWidgetToNode(layout);

                                    // Convert the JSON structure to a JSON string
                                    final jsonLayout =
                                        serializedLayout.toJson();
                                    final jsonString = jsonLayout.toString();

                                    // Print the JSON string
                                    print(jsonString);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 2,
                              child: Button(
                                text: 'Preview the Blueprint',
                                onTap: () {},
                                primary: false,
                              ),
                            )
                          ],
                        ),
                      ),
                      // MultiTextInputField(
                      //   controller: jsonStringController,
                      // )
                      const Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: Color(0xFFA3A7BA),
                          )),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Widgets',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFFA3A7BA)),
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xFFA3A7BA)))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextBox(
                        renderType: 0,
                      ),
                      RowBox(
                        renderType: 0,
                      ),
                      ColBox(
                        renderType: 0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 12,
              child: ViewportV1(
                data: yourJsonString,
              )),
        ],
      ),
    );
  }
}
