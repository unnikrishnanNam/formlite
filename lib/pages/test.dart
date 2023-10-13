import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NestedJsonWidget(
          jsonData: json.decode(yourJsonString),
        ),
      ),
    );
  }
}

class NestedJsonWidget extends StatelessWidget {
  final dynamic jsonData;

  NestedJsonWidget({required this.jsonData});

  Widget buildWidget(dynamic data) {
    if (data is List) {
      // If data is a List, create a Column with nested children
      return Column(
        children: data.map((item) => buildWidget(item)).toList(),
      );
    } else if (data is Map && data.containsKey('type')) {
      // If data is a Map and contains a 'type' field, create corresponding widget
      switch (data['type']) {
        case 'row':
          return Row(
            children: (data['children'] as List).map((item) => buildWidget(item)).toList(),
          );
        case 'column':
          return Column(
            children: (data['children'] as List).map((item) => buildWidget(item)).toList(),
          );
        // Add more cases for other widget types as needed
        default:
          return SizedBox(); // Return an empty widget if type is not recognized
      }
    } else {
      return SizedBox(); // Return an empty widget if data type is not recognized
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildWidget(jsonData),
    );
  }
}

// Replace this with your actual JSON data
const yourJsonString = '''
{
  "type": "column",
  "children": [
    {
      "type": "row",
      "children": [
        {"type": "widget", "data": "Nested 1"},
        {"type": "widget", "data": "Nested 2"}
      ]
    },
    {"type": "widget", "data": "Nested 3"}
  ]
}
''';
