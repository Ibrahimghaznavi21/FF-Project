import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';

class SimpleTextField extends StatelessWidget {
  final String labelText;
  final String hinttext;
  final TextEditingController controller;
  final IconData iconData;
  final suffixIcon;
  final List<TextInputFormatter>? inputformatters;
  final Function(String)? onChange;
  final TextInputType keyboard;
  final bool readonly;

  SimpleTextField(
      {required this.labelText,
      required this.controller,
      this.onChange,
      required this.iconData,
      required this.hinttext,
      this.inputformatters,
      this.suffixIcon,
        required this.readonly,
      required this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
        cursorColor: ColorsClass.colorlightBlueAccent,
        inputFormatters: inputformatters,
        keyboardType: keyboard,
        readOnly: readonly,
        enabled: true,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hinttext,
          fillColor: ColorsClass.colorwhite30,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(iconData),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsClass.colorblack, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsClass.colorblack, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsClass.colorgrey, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
