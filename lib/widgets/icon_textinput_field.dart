import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTextInputField extends StatelessWidget {
  const IconTextInputField(
      {super.key, required this.hintText, required this.controller});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
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
}
