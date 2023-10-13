import 'package:flutter/material.dart';
import 'package:formlite/widgets/button.dart';
import 'package:formlite/widgets/icon_textinput_field.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatefulWidget {
  TextBox({super.key, this.renderType = 0, this.hintText = 'Text Box'});
  final int renderType;
  String hintText;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: TextBox(renderType: 1),
        feedback: TextBox(renderType: 2),
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

    if (widget.renderType == 1) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              backgroundColor: Colors.white,
              builder: (context) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 140),
                    child: SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: SizedBox(
                        width: 220,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 3,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            const SizedBox(height: 20),
                            IconTextInputField(
                                hintText: 'Enter Field Name',
                                controller: controller),
                            Button(
                                text: 'Save',
                                onTap: () {
                                  Navigator.pop(context, controller.text);
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).then((value) => setState(() {
                widget.hintText = value;
              }));
        },
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                width: 1.5,
                color: const Color(0xFFE7E8ED),
              ),
            ),
            child: Center(
              child: Text(
                widget.hintText,
                style: GoogleFonts.fredoka(
                  color: const Color(0xFFA3A7BA),
                  fontSize: 17,
                ),
              ),
            )),
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
