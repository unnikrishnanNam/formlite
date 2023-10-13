import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      required this.onTap,
      this.primary = true});
  final String text;
  final VoidCallback onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        // width: 100 + (text.length * 10),
        // width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.5),
            gradient: LinearGradient(
              colors: primary
                  ? [
                      const Color(0xFFF66052),
                      const Color(0xFFDE3178),
                    ]
                  : [
                      const Color(0xFFA3A7BA),
                      const Color(0xFFA3A7BA),
                    ],
            ),
            boxShadow: [
              primary
                  ? BoxShadow(
                      color: const Color(0xFFF66052).withOpacity(0.43),
                      offset: const Offset(0, 19),
                      blurRadius: 9,
                      spreadRadius: -10,
                    )
                  : BoxShadow(
                      color: const Color(0xFFA3A7BA).withOpacity(0.43),
                      offset: const Offset(0, 19),
                      blurRadius: 9,
                      spreadRadius: -10,
                    ),
            ]),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.fredoka(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
