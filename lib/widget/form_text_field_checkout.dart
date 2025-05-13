import 'package:flutter/material.dart';
import 'package:phul_ecom_partner/constant/global_constant.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required this.validator,
    required this.textType,
    required this.label,
    required this.hintText,
    this.borderColor,
    this.fillColors,
    this.controller,
  }) : super(key: key);
  final String? validator;
  final TextInputType? textType;
  final String label;
  final String hintText;
  final Color? borderColor;
  final Color? fillColors;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorRadius: const Radius.circular(50),
      cursorColor: ColorsConstant.backgroundButtonColor,
      controller: controller,
      style: TextStyle(
        color: borderColor ?? Colors.black,
      ),
      keyboardType: textType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validator;
        }
        return null;
      },
      onTap: () {},
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Colors.grey.shade100,
            width: 1.0,
          ),
        ),
        label: Text(label),
        labelStyle: TextStyle(
          color: borderColor ?? Colors.black,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontStyle: FontStyle.normal,
          color: borderColor ?? Colors.black,
        ),
        isDense: true,
        filled: true,
        fillColor: fillColors ?? Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Colors.grey.shade100,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
