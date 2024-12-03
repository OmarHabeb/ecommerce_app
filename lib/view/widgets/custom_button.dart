import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double width;
  final String? image;
  final Color? color;
   CustomButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
    this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.w),
          color: color == null ? Color(0xFF8C6658) : color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Image.asset(image!, width: 24.w, height: 24.h),
              ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
