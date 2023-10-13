import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RowBox extends StatefulWidget {
  RowBox({super.key, this.renderType = 0, this.children = const []});
  final int renderType;
  List<Widget> children;

  @override
  State<RowBox> createState() => _RowBoxState();
}

class _RowBoxState extends State<RowBox> {
  List<Widget> rowChildren = [];
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: RowBox(renderType: 1),
        feedback: RowBox(renderType: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1.5,
              color: const Color(0xFFE7E8ED),
            ),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.bookmark_border_outlined,
                    color: Color(0xFFA3A7BA)),
              ),
              Text(
                'Row',
                style: TextStyle(color: Color(0xFFA3A7BA)),
              )
            ],
          ),
        ),
      );
    }

    if (widget.renderType == 1) {
      return DragTarget<Widget>(
        onAccept: (data) => setState(() {
          rowChildren.add(Flexible(child: data));
          widget.children = rowChildren;
          log(rowChildren.toString());
        }),
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            // height: 50,
            width: 220,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFA3A7BA).withOpacity(0.05),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: rowChildren.isEmpty
                    ? [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            'RowBox Placeholder',
                            style: TextStyle(
                                color: Color(0xFFA3A7BA).withOpacity(0.8)),
                          ),
                        ),
                      ]
                    : rowChildren,
              ),
            ),
          );
        },
      );
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 45,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1.5,
            color: const Color(0xFFE7E8ED),
          ),
        ),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.bookmark_border_outlined,
                  color: Color(0xFFA3A7BA)),
            ),
            Text(
              'Row',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
