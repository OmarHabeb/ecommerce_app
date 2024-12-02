import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  CustomContainer(
      {required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15.h),
          width: 160.w,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15.w)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 137.w,
                height: 100.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image))),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2F2F2)),
              ),
              Text(
                price.toString(),
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              )
            ],
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
