import 'package:flutter/material.dart';

import '../resources/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String prefixImage;
  final String? suffixImage;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    required this.hintText,
    required this.prefixImage,
    this.suffixImage,
  }) : super(key: key);

  
 @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        fillColor: Colors.white,
        prefixIcon: Image.asset(
          prefixImage,
          height: 24,
          width: 24,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
          fontWeight: FontWeight.normal
        ),
        suffixIcon: suffixImage == null 
        ? const SizedBox.shrink()
        : Image.asset(
          suffixImage!,
          height: 24,
          width: 24,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: CustomColors.fade)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: CustomColors.black)
        ),
      ),
    );
  }
}