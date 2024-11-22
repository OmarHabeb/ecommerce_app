import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 54.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.w),
      color: Color.fromRGBO(91, 158, 225, 1)
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp),
      )),
    );
  }
}
