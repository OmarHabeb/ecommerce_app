import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            width: 157.w,
            height: 200.h,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.w)),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Color(0xFF8C6658),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomRight: Radius.circular(15))),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ),
        ),
      ],
    );
  }
}
