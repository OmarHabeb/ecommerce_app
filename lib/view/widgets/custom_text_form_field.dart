import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final Widget? ic;
  final FormFieldValidator<String>? validator;
 final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.validator,
      this.obscureText = true,
      this.ic,  this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: ic != null ? ic : null,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
        fillColor: Color.fromRGBO(22, 31, 40, 1),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.h,
          horizontal: 16.w,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: Color.fromRGBO(22, 31, 40, 1),
            width: 0.5.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0.w,
          ),
        ),
      ),
    );
  }
}
