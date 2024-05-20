import 'package:flutter/material.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';

class CustomTextfield extends StatelessWidget {
  final IconData iconData;
  final String hinttext;
  final String labletext;
  final TextEditingController? textEditingController;
  final inputformatters;
  final Function(String)? onChange;
  final TextInputType keyboard;
  final Validator;
  final bool obscureText;
  final suffixIcon;

  const CustomTextfield({
    super.key,
    required this.iconData,
    required this.hinttext,
    required this.labletext,
    required this.textEditingController,
    this.inputformatters,
    this.onChange,
    required this.keyboard,
    this.Validator,
    required this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputformatters,
      keyboardType: keyboard,
      onChanged: onChange,
      validator: Validator,
      controller: textEditingController,
      obscureText: obscureText,
      cursorColor: Colors.lightBlueAccent,
      enabled: true,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        prefixIcon: Icon(iconData),
        fillColor: ColorsClass.colorwhite30,
        hintText: hinttext,
        labelText: labletext,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsClass.colorblack, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsClass.colorblack, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsClass.colorgrey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
