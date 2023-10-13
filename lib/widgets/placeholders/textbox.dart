import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatelessWidget {
  const TextBox(
      {super.key,
      this.renderType = 0,
      this.controller,
      this.hintText = 'Hint Text'});
  final int renderType;
  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    if (renderType == 0) {
      return Draggable(
        data: const TextBox(renderType: 1),
        feedback: const TextBox(renderType: 2),
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
                'Text Field',
                style: TextStyle(color: Color(0xFFA3A7BA)),
              )
            ],
          ),
        ),
      );
    }

    if (renderType == 1) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            width: 1.5,
            color: const Color(0xFFE7E8ED),
          ),
        ),
        child: TextField(
          style: GoogleFonts.fredoka(
            color: const Color(0xFF272727),
            fontSize: 17,
          ),
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 3.5),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: GoogleFonts.fredoka(
              color: const Color(0xFFA3A7BA),
              fontSize: 14,
            ),
            prefixIcon: const Icon(
              Icons.pending_outlined,
              color: Color(0xFFA3A7BA),
            ),
          ),
        ),
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
              'Text Field',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
