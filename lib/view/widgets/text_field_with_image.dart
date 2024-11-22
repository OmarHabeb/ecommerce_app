import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWithImage extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final String? image;
  final Widget? ic;
  const TextFieldWithImage({   super.key,
    required this.labelText,
    this.obscureText = false,
    this.image,
    this.ic
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      style: TextStyle(color: Colors.white),
  obscureText: obscureText,
  decoration: InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.white),
    suffixIcon: ic !=null ? ic : null,
    prefixIcon: image != null ?  Image(image: AssetImage("$image")) : null,
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