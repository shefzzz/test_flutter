import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.data,
      this.hint,
      required this.controller,
      required this.validator,
      this.prefixIconn,
      this.suffixIconn,
      required this.isVisible});

  String data;
  String? hint;
  var controller = TextEditingController();
  String? Function(String?)? validator;
  final bool isVisible;
  Widget? prefixIconn;
  Widget? suffixIconn;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isVisible,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.green, width: 3)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 3)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.orange, width: 3)),
          label: Text(data),
          prefixIcon: prefixIconn,
          suffixIcon: suffixIconn,
          hintText: hint),
    );
  }
}
