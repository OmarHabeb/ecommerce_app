import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrowButton extends StatelessWidget {
  final VoidCallback? onTap;

  const BackArrowButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: Color.fromRGBO(22, 31, 40, 1),
        shape: BoxShape.circle
      ),
      child: GestureDetector(
        onTap: onTap ?? () => Navigator.of(context).pop(),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white, 
          size: 17, 
        ),
      ),
    );
  }
}
