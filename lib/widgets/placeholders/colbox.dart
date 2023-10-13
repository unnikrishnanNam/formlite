import 'dart:developer';

import 'package:flutter/material.dart';

class ColBox extends StatefulWidget {
  ColBox({
    super.key,
    this.renderType = -1,
    this.children = const [],
  });
  final int renderType;
  List<Widget> children = [];

  @override
  State<ColBox> createState() => _ColBoxState();
}

class _ColBoxState extends State<ColBox> {
  List<Widget> colChildren = [];
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: ColBox(renderType: 1),
        feedback: ColBox(renderType: -1),
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
                'Column',
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
          colChildren.add(data);
          widget.children = colChildren;
          log(colChildren.toString());
        }),
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            // height: 50,
            // width: 220,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFA3A7BA).withOpacity(0.05),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: colChildren.isEmpty
                        ? [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Center(
                                child: Text(
                                  'Column Box Placeholder',
                                  style: TextStyle(
                                      color: const Color(0xFFA3A7BA)
                                          .withOpacity(0.8)),
                                ),
                              ),
                            ),
                          ]
                        : colChildren)),
          );
        },
      );
    }

    if (widget.renderType == 2) {
      return Container(
        // height: 50,
        // width: 220,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xFFA3A7BA).withOpacity(0.05),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.children.isEmpty
                    ? [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Center(
                            child: Text(
                              'Column Box Placeholder',
                              style: TextStyle(
                                  color:
                                      const Color(0xFFA3A7BA).withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ]
                    : widget.children)),
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
              'Column',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
