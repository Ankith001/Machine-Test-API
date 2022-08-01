import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldWidget extends StatelessWidget {
   FormFieldWidget({
    Key? key,required this.text,required this.controller 
  }) : super(key: key); 
  String text;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField( focusNode: FocusNode(),
      // validator: validateName,
      keyboardType: TextInputType.text,
       controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(255, 213, 213, 213),
        filled: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1.5, color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: text,
      //  hintStyle: GoogleFonts.inter(),
      ),
     
    );
  }
}