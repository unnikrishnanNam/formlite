import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiTextInputField extends StatelessWidget {
  const MultiTextInputField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          width: 1.5,
          color: const Color(0xFFE7E8ED),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: 50,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          border: InputBorder.none,
          hintText: 'Enter the Blueprint Name',
          hintStyle: GoogleFonts.fredoka(
            color: const Color(0xFFA3A7BA),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
